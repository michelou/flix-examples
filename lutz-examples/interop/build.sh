#!/usr/bin/env bash
#
# Copyright (c) 2018-2025 Stéphane Micheloud
#
# Licensed under the MIT License.
#

##############################################################################
## Subroutines

getHome() {
    local source="${BASH_SOURCE[0]}"
    while [[ -h "$source" ]]; do
        local linked="$(readlink "$source")"
        local dir="$( cd -P $(dirname "$source") && cd -P $(dirname "$linked") && pwd )"
        source="$dir/$(basename "$linked")"
    done
    ( cd -P "$(dirname "$source")" && pwd )
}

debug() {
    local DEBUG_LABEL="[46m[DEBUG][0m"
    [[ $DEBUG -eq 1 ]] && echo "$DEBUG_LABEL $1" 1>&2
}

warning() {
    local WARNING_LABEL="[46m[WARNING][0m"
    echo "$WARNING_LABEL $1" 1>&2
}

error() {
    local ERROR_LABEL="[91mError:[0m"
    echo "$ERROR_LABEL $1" 1>&2
}

# use variables EXITCODE, TIMER_START
cleanup() {
    [[ $1 =~ ^[0-1]$ ]] && EXITCODE=$1

    debug "EXITCODE=$EXITCODE"
    exit $EXITCODE
}

args() {
    [[ $# -eq 0 ]] && HELP=1 && return 1

    for arg in "$@"; do
        case "$arg" in
        ## options
        -debug)    DEBUG=1 ;;
        -help)     HELP=1 ;;
        -nightly)  NIGHTLY=1 ;;
        -verbose)  VERBOSE=1 ;;
        -*)
            error "Unknown option $arg"
            EXITCODE=1 && return 0
            ;;
        ## subcommands
        clean)     CLEAN=1 ;;
        compile)   COMPILE=1 ;;
        decompile) COMPILE=1 && DECOMPILE=1 ;;
        help)      HELP=1 ;;
        run)       COMPILE=1 && RUN=1 ;;
        test)      COMPILE=1 && TEST=1 ;;
        *)
            error "Unknown subcommand $arg"
            EXITCODE=1 && return 0
            ;;
        esac
    done
    if [[ $NIGHTLY -eq 1 ]]; then
        local nightly_jar=
        for f in $(find "$FLIX_HOME/" -type f -name "flix-*.jar" 2>/dev/null); do
            nightly_jar="$f"
        done
        if [[ -f "$nightly_jar" ]]; then
            if [[ $DEBUG -eq 1 ]]; then
                debug "Nightly build \"$nightly_jar\" was selected"
            elif [[ $VERBOSE -eq 1 ]]; then
                echo "Nightly build \"$nightly_jar\" was selected" 1>&2
            fi
            set FLIX_JAR="$nightly_jar"
        else
            set NIGHTLY=0
            warning "Nightly build of Flix not found (use release version instead)"
            warning "         It can be downloaded from https://flix.dev/nightly/."
        fi
    fi
    if [[ $DECOMPILE -eq 1 ]] && [[ ! -x "$CFR_CMD" ]]; then
        warning "cfr installation not found"
        DECOMPILE=0
    fi
    debug "Options    : DEBUG=$DEBUG NIGHTLY=$NIGHTLY VERBOSE=$VERBOSE"
    debug "Subcommands: CLEAN=$CLEAN COMPILE=$COMPILE DECOMPILE=$DECOMPILE HELP=$HELP RUN=$RUN"
    [[ -n "$CFR_HOME" ]] && debug "Variables  : CFR_HOME=$CFR_HOME"
    debug "Variables  : FLIX_HOME=$FLIX_HOME"
    debug "Variables  : GRADLE_HOME=$GRADLE_HOME"
    debug "Variables  : JAVA_HOME=$JAVA_HOME"
    debug "Variables  : MAKE_HOME=$MAKE_HOME"
    debug "Variables  : SCALA_HOME=$SCALA_HOME"
}

help() {
    cat << EOS
Usage: $BASENAME { <option> | <subcommand> }

  Options:
    -debug       print commands executed by this script
    -nightly     select latest Flix nightly build if locally available
    -verbose     print progress messages

  Subcommands:
    clean        delete generated files
    compile      compile Scala/Flix source files
    decompile    decompile generated code with CFR
    help         print this help message
    run          execute Flix program "$PROJECT_NAME"
    test         run the unit tests
EOS
}

clean() {
    if [[ -d "$TARGET_DIR" ]]; then
        if [[ $DEBUG -eq 1 ]]; then
            debug "Delete directory \"$TARGET_DIR\""
        elif [[ $VERBOSE -eq 1 ]]; then
            echo "Delete directory \"${TARGET_DIR/$ROOT_DIR\//}\"" 1>&2
        fi
        rm -rf "$TARGET_DIR"
        if [[ $? -ne 0 ]]; then
            error "Failed to delete directory \"${TARGET_DIR/$ROOT_DIR\//}\""
            EXITCODE=1 && return 0
        fi
    fi
}

compile() {
    [[ -d "$TARGET_APP_DIR" ]] || mkdir -p "$TARGET_APP_DIR"
    compile_init

    local is_required=0
    is_required="$(action_required "$APP_JAR" "$SOURCE_MAIN_DIR/" "*.scala")"
    if [[ $is_required -eq 1 ]]; then
        compile_scala
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    fi
    is_required="$(action_required "$APP_JAR" "$SOURCE_MAIN_DIR/" "*.flix")"
    if [[ $is_required -eq 1 ]]; then
        compile_flix
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    fi
}

compile_init() {
    [[ -d "$TARGET_APP_DIR/build" ]] && return 1

    if [[ $DEBUG -eq 1 ]]; then
        debug "$JAVA_CMD -jar \"$(mixed_path $FLIX_JAR)\" init"
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Initialize directory \"${TARGET_APP_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    pushd "$TARGET_APP_DIR" 1>/dev/null
    eval "$JAVA_CMD" -jar "$(mixed_path $FLIX_JAR)" init
    if [[ $? -ne 0 ]]; then
        popd 1>/dev/null
        error "Failed to initialize \"${TARGET_APP_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
    popd 1>/dev/null

    rm -rf "$TARGET_APP_DIR/src/"*.flix
    rm -rf "$TARGET_APP_DIR/test/"*.flix

    local target_src_dir="$TARGET_APP_DIR/src"
    if [[ $DEBUG -eq 1 ]]; then
        debug "cp -r \"$SOURCE_MAIN_DIR/\"*.flix \"$target_src_dir/\""
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Copy Flix source files to directory \"${target_src_dir/$ROOT_DIR\//}\"" 1>&2
    fi
    cp -r "$SOURCE_MAIN_DIR/"*.flix "$target_src_dir/"

    [[ -z "$(ls -R $SOURCE_TEST_DIR/*.flix 2>/dev/null)" ]] && return 1
    local target_test_dir="$TARGET_APP_DIR/test"
    if [[ $DEBUG -eq 1 ]]; then
        debug "cp -r \"$SOURCE_TEST_DIR/\"*.flix \"$target_test_dir/\""
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Copy Flix test source files to directory \"${target_test_dir/$ROOT_DIR\//}\"" 1>&2
    fi
    cp -r "$SOURCE_TEST_DIR/"*.flix "$target_test_dir/"
}

action_required() {
    local target_file=$1
    local search_path=$2
    local search_pattern=$3
    local source_file=
    for f in $(find "$search_path" -type f -name $search_pattern 2>/dev/null); do
        [[ $f -nt $source_file ]] && source_file=$f
    done
    if [[ -z "$source_file" ]]; then
        ## Do not compile if no source file
        echo 0
    elif [[ ! -f "$target_file" ]]; then
        ## Do compile if target file doesn't exist
        echo 1
    else
        ## Do compile if target file is older than most recent source file
        [[ $source_file -nt $target_file ]] && echo 1 || echo 0
    fi
}

compile_scala() {
    local opts_file="$TARGET_DIR/scalac_opts.txt"
    echo -color never -classpath "$(mixed_path $TARGET_LIB_DIR)" -d "$(mixed_path $TARGET_LIB_DIR)" > "$opts_file"

    local sources_file="$TARGET_LIB_DIR/scalac_sources.txt"
    [[ -f "$sources_file" ]] && rm "$sources_file"
    local n=0
    for f in $(find "$SOURCE_MAIN_DIR/" -type f -name "*.scala" 2>/dev/null); do
        echo $(mixed_path $f) >> "$sources_file"
        n=$((n + 1))
    done
    if [[ $n -eq 0 ]]; then
        warning "No Scala source file found"
        return 1
    fi
    local s=; [[ $n -gt 1 ]] && s="s"
    local n_files="$n Scala source file$s"
    if [[ $DEBUG -eq 1 ]]; then
        debug "$SCALAC_CMD @$(mixed_path $opts_file) @$(mixed_path $sources_file)"
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Compile $n_files to directory \"${TARGET_LIB_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$SCALAC_CMD" "@$(mixed_path $opts_file)" "@$(mixed_path $sources_file)"
    if [[ $? -ne 0 ]]; then
        error "Failed to compile $n_files to directory \"${TARGET_LIB_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

compile_flix() {
    local n=0
    for f in $(find "$TARGET_APP_DIR/src/" -type f -name "*.flix" 2>/dev/null); do
        n=$((n + 1))
    done
    for f in $(find "$TARGET_APP_DIR/test/" -type f -name "*.flix" 2>/dev/null); do
        n=$((n + 1))
    done
    if [[ $n -eq 0 ]]; then
        warning "No Flix source file found"
        return 1
    fi
    local s=; [[ $n -gt 1 ]] && s="s"
    local n_files="$n Flix source file$s"
    if [[ $DEBUG -eq 1 ]]; then
        debug "$JAVA_CMD -jar \"$(mixed_path $FLIX_JAR)\" build"
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Compile $n_files to directory \"${TARGET_BUILD_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    pushd "$TARGET_APP_DIR" 1>/dev/null
    eval "$JAVA_CMD" -jar "$(mixed_path $FLIX_JAR)" build
    if [[ $? -ne 0 ]]; then
        popd 1>/dev/null
        error "Failed to compile $n_files to directory \"${TARGET_BUILD_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
    if [[ $DEBUG -eq 1 ]]; then
        debug "$JAVA_CMD -jar \"$(mixed_path $FLIX_JAR)\" build-jar"
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Create archive file \"${APP_JAR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$JAVA_CMD" -jar "$(mixed_path $FLIX_JAR)" build-jar
    if [[ $? -ne 0 ]]; then
        popd 1>/dev/null
        error "Failed to create archive file \"${APP_JAR/$ROOT_DIR\//}\""
        cleanup 1
    fi
    popd 1>/dev/null
}

mixed_path() {
    if [[ -x "$CYGPATH_CMD" ]]; then
        $CYGPATH_CMD -am $1
    elif [[ $(($mingw + $msys)) -gt 0 ]]; then
        echo $1 | sed 's|/|\\\\|g'
    else
        echo $1
    fi
}

decompile() {
    local output_dir="$TARGET_DIR/cfr-sources"
    [[ -d "$output_dir" ]] || mkdir -p "$output_dir"

    local cfr_opts="--extraclasspath "$(extra_cpath)" --outputdir "$(mixed_path $output_dir)""

    local n="$(ls -n $CLASSES_DIR/*.class | wc -l)"
    local class_dirs=
    [[ $n -gt 0 ]] && class_dirs="$CLASSES_DIR"
    for f in $(ls -d "$CLASSES_DIR" 2>/dev/null); do
        n="$(ls -n $CLASSES_DIR/*.class | wc -l)"
        [[ $n -gt 0 ]] && class_dirs="$class_dirs $f"
    done
    [[ $VERBOSE -eq 1 ]] && echo "Decompile Java bytecode to directory \"${output_dir/$ROOT_DIR\//}\"" 1>&2
    for f in $class_dirs; do
        debug "$CFR_CMD $cfr_opts $(mixed_path $f)/*.class"
        eval "$CFR_CMD" $cfr_opts "$(mixed_path $f)/*.class" $STDERR_REDIRECT
        if [[ $? -ne 0 ]]; then
            error "Failed to decompile generated code in directory \"$f\""
            cleanup 1
        fi
    done
    local version_list=($(version_string))
    local version_string="${version_list[0]}"
    local version_suffix="${version_list[1]}"

    ## output file contains Scala and CFR headers
    local output_file="$TARGET_DIR/cfr-sources$version_suffix.java"
    echo "// Compiled with $version_string" > "$output_file"

    if [[ $DEBUG -eq 1 ]]; then
        debug "cat $output_dir/*.java >> $output_file"
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Save generated Java source files to file \"${output_file/$ROOT_DIR\//}\"" 1>&2
    fi
    local java_files=
    for f in $(find "$output_dir/" -type f -name "*.java" 2>/dev/null); do
        java_files="$java_files $(mixed_path $f)"
    done
    [[ -n "$java_files" ]] && cat $java_files >> "$output_file"

    if [[ ! -x "$DIFF_CMD" ]]; then
        if [[ $DEBUG -eq 1 ]]; then
            warning "diff command not found"
        elif [[ $VERBOSE -eq 1 ]]; then
            echo "diff command not found" 1>&2
        fi
        return 0
    fi
    local diff_opts=--strip-trailing-cr

    local check_file="$SOURCE_DIR/build/cfr-source$VERSION_SUFFIX.java"
    if [[ -f "$check_file" ]]; then
        if [[ $DEBUG -eq 1 ]]; then
            debug "$DIFF_CMD $diff_opts $(mixed_path $output_file) $(mixed_path $check_file)"
        elif [[ $VERBOSE -eq 1 ]]; then
            echo "Compare output file with check file \"${check_file/$ROOT_DIR\//}\"" 1>&2
        fi
        eval "$DIFF_CMD" $diff_opts "$(mixed_path $output_file)" "$(mixed_path $check_file)"
        if [[ $? -ne 0 ]]; then
            error "Output file and check file differ"
            cleanup 1
        fi
    fi
}

## output parameter: _EXTRA_CPATH
extra_cpath() {
    if [[ $SCALA_VERSION -eq 3 ]]; then
        lib_path="$SCALA3_HOME/lib"
    else
        lib_path="$SCALA_HOME/lib"
    fi
    local extra_cpath=
    for f in $(find "$lib_path/" -type f -name "*.jar"); do
        extra_cpath="$extra_cpath$(mixed_path $f)$PSEP"
    done
    echo $extra_cpath
}

## output parameter: ($version $suffix)
version_string() {
    local tool_version="$($SCALAC_CMD -version 2>&1 | cut -d " " -f 4)"
    local version=
    [[ $SCALA_VERSION -eq 3 ]] && version="scala3_$tool_version" || version="scala2_$tool_version"

    ## keep only "-NIGHTLY" in version suffix when compiling with a nightly build 
    local str="${version/NIGHTLY*/NIGHTLY}"
    local suffix=
    if [[ ! "$version" == "$str" ]]; then
        suffix="_$str"
    else
        ## same for "-SNAPSHOT"
        str="${version/SNAPSHOT*/SNAPSHOT}"
        if [[ ! "$version" == "$str" ]]; then
            suffix="_$str"
        else
            suffix=_3.0.0
        fi
    fi
    local arr=($version $suffix)
    echo "${arr[@]}"
}

run() {
    local boot_cpath=
    for f in $(find "$TARGET_LIB_DIR/" -type f -name "*.jar" 2>/dev/null); do
        boot_cpath="$boot_cpath$PSEP$(mixed_path $f)"
    done
    local java_opts=
    [[ -n "$boot_cpath" ]] && java_opts="-Xbootclasspath/a:\"$boot_cpath\"" $java_opts
    if [[ $DEBUG -eq 1 ]]; then
        debug "$JAVA_CMD $java_opts -jar \"$(mixed_path $APP_JAR)\""
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Execute the JAR file \"${APP_JAR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$JAVA_CMD" $java_opts -jar "$(mixed_path $APP_JAR)"
    if [[ $? -ne 0 ]]; then
        error "Failed to execute the JAR file \"${APP_JAR/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

run_tests() {
    pushd "$TARGET_APP_DIR" 1>/dev/null
    if [[ $DEBUG -eq 1 ]]; then
        debug "$JAVA_CMD -jar \"$(mixed_path $FLIX_JAR)\" test"
    elif [[ $VERBOSE -eq 1 ]]; then
        echo "Run the unit tests for \"${APP_JAR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$JAVA_CMD" -jar "$(mixed_path $FLIX_JAR)" test
    if [[ $? -ne 0 ]]; then
        popd 1>/dev/null
        error "Failed to run the unit tests for \"${APP_JAR/$ROOT_DIR\//}\""
        cleanup 1
    fi
    popd 1>/dev/null
}

##############################################################################
## Environment setup

BASENAME=$(basename "${BASH_SOURCE[0]}")

EXITCODE=0

ROOT_DIR="$(getHome)"

PROJECT_NAME="$(basename $ROOT_DIR)"
PROJECT_URL="github.com/$USER/flix-examples"
PROJECT_VERSION="1.0-SNAPSHOT"

SOURCE_DIR="$ROOT_DIR/src"
SOURCE_MAIN_DIR="$SOURCE_DIR/main"
SOURCE_TEST_DIR="$SOURCE_DIR/test"
TARGET_DIR="$ROOT_DIR/target"
TARGET_APP_DIR="$TARGET_DIR/$PROJECT_NAME"
TARGET_BUILD_DIR="$TARGET_APP_DIR/build"
TARGET_LIB_DIR="$TARGET_APP_DIR/lib"

## Starting with version 0.35.0 Flix generates the jar file into directory 'artifact'.
APP_JAR="$TARGET_APP_DIR/artifact/$PROJECT_NAME.jar"

## We refrain from using `true` and `false` which are Bash commands
## (see https://man7.org/linux/man-pages/man1/false.1.html)
CLEAN=0
COMPILE=0
DEBUG=0
DECOMPILE=0
HELP=0
NIGHTLY=0
RUN=0
TEST=0
VERBOSE=0

COLOR_START="[32m"
COLOR_END="[0m"

cygwin=0
mingw=0
msys=0
darwin=0
case "$(uname -s)" in
    CYGWIN*) cygwin=1 ;;
    MINGW*)  mingw=1 ;;
    MSYS*)   msys=1 ;;
    Darwin*) darwin=1
esac
unset CYGPATH_CMD
PSEP=":"
if [[ $(($cygwin + $mingw + $msys)) -gt 0 ]]; then
    CYGPATH_CMD="$(which cygpath 2>/dev/null)"
    PSEP=";"
    [[ -n "$CFR_HOME" ]] && CFR_HOME="$(mixed_path $CFR_HOME)"
    [[ -n "$FLIX_HOME" ]] && FLIX_HOME="$(mixed_path $FLIX_HOME)"
    [[ -n "$GIT_HOME" ]] && GIT_HOME="$(mixed_path $GIT_HOME)"
    [[ -n "$JAVA_HOME" ]] && JAVA_HOME="$(mixed_path $JAVA_HOME)"
    [[ -n "$SCALA_HOME" ]] && SCALA_HOME="$(mixed_path $SCALA_HOME)"
fi
if [[ ! -x "$JAVA_HOME/bin/java" ]]; then
    error "Java SDK installation not found"
    cleanup 1
fi
JAVA_CMD="$JAVA_HOME/bin/java"

if [[ ! -x "$SCALA_HOME/bin/scalac" ]]; then
    error "Scala 2 installation not found"
    cleanup 1
fi
SCALAC_CMD="$SCALA_HOME/bin/scalac"

unset CFR_CMD
[[ -x "$CFR_HOME/bin/cfr" ]] && CFR_CMD="$CFR_HOME/bin/cfr"

if [[ ! -f "$FLIX_HOME/flix.jar" ]]; then
    error "Flix installation not found $FLIX_HOME"
    cleanup 1
fi
FLIX_JAR="$FLIX_HOME/flix.jar"

args "$@"
[[ $EXITCODE -eq 0 ]] || cleanup 1

##############################################################################
## Main

[[ $HELP -eq 1 ]] && help && cleanup

if [[ $CLEAN -eq 1 ]]; then
    clean || cleanup 1
fi
if [[ $COMPILE -eq 1 ]]; then
    compile || cleanup 1
fi
if [[ $DECOMPILE -eq 1 ]]; then
    decompile || cleanup 1
fi
if [[ $RUN -eq 1 ]]; then
    run || cleanup 1
fi
if [[ $TEST -eq 1 ]]; then
    run_tests || cleanup 1
fi
cleanup
