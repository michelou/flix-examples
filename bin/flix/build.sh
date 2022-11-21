#!/usr/bin/env bash
#
# Copyright (c) 2018-2022 Stéphane Micheloud
#
# Licensed under the MIT License.
#

##############################################################################
## Subroutines

getHome() {
    local source="${BASH_SOURCE[0]}"
    while [ -h "$source" ] ; do
        local linked="$(readlink "$source")"
        local dir="$( cd -P $(dirname "$source") && cd -P $(dirname "$linked") && pwd )"
        source="$dir/$(basename "$linked")"
    done
    ( cd -P "$(dirname "$source")" && pwd )
}

debug() {
    local DEBUG_LABEL="[46m[DEBUG][0m"
    $DEBUG && echo "$DEBUG_LABEL $1" 1>&2
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

    if $TIMER; then
        local TIMER_END=$(date +'%s')
        local duration=$((TIMER_END - TIMER_START))
        echo "Total execution time: $(date -d @$duration +'%H:%M:%S')" 1>&2
    fi
    debug "EXITCODE=$EXITCODE"
    exit $EXITCODE
}

args() {
    [[ $# -eq 0 ]] && HELP=true && return 1

    for arg in "$@"; do
        case "$arg" in
        ## options
        -debug)    DEBUG=true ;;
        -help)     HELP=true ;;
        -timer)    TIMER=true ;;
        -verbose)  VERBOSE=true ;;
        -*)
            error "Unknown option $arg"
            EXITCODE=1 && return 0
            ;;
        ## subcommands
        clean)     CLEAN=true ;;
        compile)   COMPILE=true ;;
        help)      HELP=true ;;
        jar)       COMPILE=true && JAR=true ;;
        run)       COMPILE=true && JAR=true && RUN=true ;;
        test)      COMPILE=true && JAR=true && TEST=true ;;
        *)
            error "Unknown subcommand $arg"
            EXITCODE=1 && return 0
            ;;
        esac
    done
    debug "Options    : TIMER=$TIMER VERBOSE=$VERBOSE"
    debug "Subcommands: CLEAN=$CLEAN COMPILE=$COMPILE JAR=$JAR HELP=$HELP RUN=$RUN TEST=$TEST"
    debug "Variables  : GIT_HOME=$GIT_HOME"
    debug "Variables  : JAVA_HOME=$JAVA_HOME"
    debug "Variables  : SCALA_HOME=$SCALA_HOME"
    # See http://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
    $TIMER && TIMER_START=$(date +"%s")
}

help() {
    cat << EOS
Usage: $BASENAME { <option> | <subcommand> }

  Options:
    -debug       show commands executed by this script
    -timer       display total elapsed time
    -verbose     display progress messages

  Subcommands:
    clean        delete generated files
    compile      compile Java/Scala source files
    help         display this help message
    jar          create JAR archive "${JAR_FILE/$ROOT_DIR//}"
    run          execute main class "$MAIN_CLASS"
    test         execute unit tests with Scalatest
EOS
}

clean() {
    if [ -d "$BUILD_DIR" ]; then
        if $DEBUG; then
            debug "Delete directory \"$BUILD_DIR\""
        elif $VERBOSE; then
            echo "Delete directory \"${BUILD_DIR/$ROOT_DIR\//}\"" 1>&2
        fi
        rm -rf "$BUILD_DIR"
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    fi
}

compile() {
    [[ -d "$CLASSES_DIR" ]] || mkdir -p "$CLASSES_DIR"

    local timestamp_file="$BUILD_DIR/.latest-build"

    local is_required=0
    is_required="$(action_required "$timestamp_file" "$MAIN_SOURCE_DIR/" "*.java")"
    if [[ $is_required -eq 1 ]]; then
        compile_java
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    fi
    is_required="$(action_required "$timestamp_file" "$MAIN_SOURCE_DIR/" "*.scala")"
    if [[ $is_required -eq 1 ]]; then
        compile_scala
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
        touch "$timestamp_file"
    fi
}

compile_java() {
    local opts_file="$BUILD_DIR/javac_opts.txt"
    echo "-d \"$(mixed_path $CLASSES_DIR)\"" > "$opts_file"

    local sources_file="$BUILD_DIR/javac_sources.txt"
    [[ -f "$sources_file" ]] && rm "$sources_file"
    local n=0
    for f in $(find "$MAIN_SOURCE_DIR/" -type f -name "*.java" 2>/dev/null); do
        echo $(mixed_path $f) >> "$sources_file"
        n=$((n + 1))
    done
    if [[ $n -eq 0 ]]; then
        warning "No Java source file found"
        return
    fi
    local s=; [[ $n -gt 1 ]] && s="s"
    local n_files="$n Java source file$s"
    if $DEBUG; then
        debug "$JAVAC_CMD \"@$(mixed_path $opts_file)\" \"@$(mixed_path $sources_file)\""
    elif $VERBOSE; then
        echo "Compile $n_files to directory \"${CLASSES_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$JAVAC_CMD \"@$(mixed_path $opts_file)\" \"@$(mixed_path $sources_file)\""
    if [[ $? -ne 0 ]]; then
        error "Failed to compile $n_files to directory \"${CLASSES_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

compile_scala() {
    local cpath=
    for f in $(find "$LIB_DIR/" -type f -name "*.jar" 2>/dev/null); do
        cpath="$cpath$(mixed_path $f)$PSEP"
    done
    cpath="$cpath$(mixed_path $CLASSES_DIR)"

    local opts_file="$BUILD_DIR/scalac_opts.txt"
    echo "$SCALAC_OPTS -classpath \"$cpath\" -d \"$(mixed_path $CLASSES_DIR)\"" > "$opts_file"

    local sources_file="$BUILD_DIR/scalac_sources.txt"
    [[ -f "$sources_file" ]] && rm "$sources_file"
    local n=0
    for f in $(find "$MAIN_SOURCE_DIR/" -type f -name "*.scala" 2>/dev/null); do
        echo "$(mixed_path $f)" >> "$sources_file"
        n=$((n + 1))
    done
    if [[ $n -eq 0 ]]; then
        warning "No Scala source file found"
        return
    fi
    local s=; [[ $n -gt 1 ]] && s="s"
    local n_files="$n Scala source file$s"
    if $DEBUG; then
        debug "$SCALAC_CMD \"@$(mixed_path $opts_file)\" \"@$(mixed_path $sources_file)\""
    elif $VERBOSE; then
        echo "Compile $n_files to directory \"${CLASSES_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$SCALAC_CMD \"@$(mixed_path $opts_file)\" \"@$(mixed_path $sources_file)\""
    if [[ $? -ne 0 ]]; then
        error "Failed to compile $n_files to directory \"${CLASSES_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

action_required() {
    local target_file=$1
    local search_path=$2
    local search_pattern=$3
    local source_file=
    for f in $(find "$search_path" -type f -name "$search_pattern"); do
        [[ $f -nt $source_file ]] && source_file=$f
    done
    if [ -z "$source_file" ]; then
        ## Do not compile if no source file
        echo 0
    elif [ ! -f "$target_file" ]; then
        ## Do compile if target file doesn't exist
        echo 1
    else
        ## Do compile if target file is older than most recent source file
        [[ $source_file -nt $target_file ]] && echo 1 || echo 0
    fi
}

mixed_path() {
    if [ -x "$CYGPATH_CMD" ]; then
        $CYGPATH_CMD -am $1
    elif $mingw || $msys; then
        echo $1 | sed 's|/|\\\\|g'
    else
        echo $1
    fi
}

jar() {
    [[ -d "$BUILD_DIR/libs" ]] || mkdir -p "$BUILD_DIR/libs"
    [[ -d "$BUILD_DIR/tmp" ]] || mkdir -p "$BUILD_DIR/tmp"

    local is_required=0
    is_required="$(action_required "$JAR_FILE" "$BUILD_DIR" ".latest-build")"
    [[ $is_required -eq 0 ]] && return

    if $DEBUG; then
        debug "$JAR_CMD cf \"$(mixed_path $JAR_FILE)\" -C \"$(mixed_path $BUILD_DIR/classes)\""
    elif $VERBOSE; then
        echo "Create Java archive \"${JAR_FILE/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$JAR_CMD cf \"$(mixed_path $JAR_FILE)\" -C \"$(mixed_path $BUILD_DIR/classes)\" ."
    if [[ $? -ne 0 ]]; then
        error "Failed to create Java archive \"${JAR_FILE/$ROOT_DIR\//}\""
        cleanup 1
    fi
    # we include the Flix sources and resources into the Flix jar file
    local arg_file="$BUILD_DIR/jar_list.txt"
    [[ -f "$arg_file" ]] && rm "$arg_file"
    for f in $(find "$MAIN_SOURCE_DIR/" -type f \( -name "*.flix" -o -name "*.zip" \) 2>/dev/null); do
        local file="${f/$ROOT_DIR\/main\//}"
        echo "-C \"$(mixed_path $ROOT_DIR/main)\" \"$file\"" >> "$arg_file"
    done
    for f in $(find "$TEST_SOURCE_DIR/" -type f -name "*.flix" 2>/dev/null); do
        local file="${f/$ROOT_DIR\/main\//}"
        echo "-C \"$(mixed_path $ROOT_DIR/main)\" \"$file\"" >> "$arg_file"
    done
    if $DEBUG; then
        debug "$JAR_CMD uf \"$JAR_FILE\" \"@$arg_file\""
    elif $VERBOSE; then
       echo "Update archive \"${JAR_FILE/$ROOT_DIR\//}\" (Flix sources)" 1>&2
    fi
    eval "$JAR_CMD uf \"$(mixed_path $JAR_FILE)\" \"@$arg_file\""
    if [[ $? -ne 0 ]]; then
        error "Failed to update Java archive \"${JAR_FILE/$ROOT_DIR\//}\" (Flix sources)"
        cleanup 1
    fi
    # we include the Scala library into the Flix jar file
    for f in scala-library.jar scala-reflect.jar; do
        include_jar "$JAR_FILE" "$SCALA_HOME/lib/$f"
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    done
    # we include the library dependencies into the Flix jar file
    for f in $(find "$LIB_DIR/" -type f -name "*.jar" 2>/dev/null); do
        include_jar "$JAR_FILE" "$f"
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    done
    local manifest_file="$MAIN_SOURCE_DIR/META-INF/MANIFEST.MF"
    if [[ ! -f "$manifest_file" ]]; then
        error "Manifest file not found"
        cleanup 1
    fi
    if $DEBUG; then
        debug "$JAR_CMD ufm \"$JAR_FILE\" \"$manifest_file\""
    elif $VERBOSE; then
        echo "Add manifest to archive \"${JAR_FILE/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$JAR_CMD ufm \"$(mixed_path $JAR_FILE)\" \"$manifest_file\""
    if [[ $? -ne 0 ]]; then
        error "Failed to add manifest to archive \"${JAR_FILE/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

# input parameters: %1=path of target JAR file, %2=path of source JAR file
include_jar() {
    local target_jar_file=$1
    local source_jar_file=$2

    local output_dir="$BUILD_DIR/tmp/$(basename $source_jar_file .jar)"
    [[ -f "$output_dir" ]] || mkdir -p "$output_dir"

    pushd "$output_dir" 1>/dev/null
    if $DEBUG; then
        debug "$JAR_CMD xf \"$(mixed_path $source_jar_file)\""
    fi
    eval "$JAR_CMD xf \"$(mixed_path $source_jar_file)\""
    if [[ $? -ne 0 ]]; then
        popd 1>/dev/null
        error "Extract class files from archive \"${source_jar_file/$ROOT_DIR\//}\""
        cleanup 1
    fi
    popd 1>/dev/null
    if $DEBUG; then
        debug "$JAR_CMD uf \"$(mixed_path $target_jar_file)\" -C \"$(mixed_path $output_dir)\" ."
    elif $VERBOSE; then
        echo "Update archive \"${target_jar_file/$ROOT_DIR\//}\" (\"${source_jar_file/$ROOT_DIR\//}\")" 1>&2
    fi
    eval "$JAR_CMD uf \"$(mixed_path $target_jar_file)\" -C \"$(mixed_path $output_dir)\" ."
    if [[ $? -ne 0 ]]; then
        error "Failed to update archive \"${target_jar_file/$ROOT_DIR\//}\" (\"${source_jar_file/$ROOT_DIR\//}\")"
        cleanup 1
   fi
}

run() {
    local run_args=--version

    if $DEBUG; then
        debug "$JAVA_CMD -jar \"$(mixed_path $JAR_FILE)\" $run_args"
    elif $VERBOSE; then
        echo "Execute program file \"${JAR_FILE/$ROOT_DIR\//}\" with arguments $run_args" 1>&2
    fi
    eval "$JAVA_CMD -jar \"$(mixed_path $JAR_FILE)\" $run_args"
    if [[ $? -ne 0 ]]; then
        error "Failed to execute program file \"${JAR_FILE/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

test_compile() {
    [[ -d "$TEST_CLASSES_DIR" ]] || mkdir -p "$TEST_CLASSES_DIR"

    local timestamp_file="$BUILD_DIR/.latest-test-build"

    local is_required=0
    is_required="$(action_required "$timestamp_file" "$TEST_SOURCE_DIR/" "*.java")"
    if [[ $is_required -eq 1 ]]; then
        test_compile_java
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
    fi
    is_required="$(action_required "$timestamp_file" "$TEST_SOURCE_DIR/" "*.scala")"
    if [[ $is_required -eq 1 ]]; then
        test_compile_scala
        [[ $? -eq 0 ]] || ( EXITCODE=1 && return 0 )
        touch "$timestamp_file"
    fi
}

test_compile_java() {
    local opts_file="$BUILD_DIR/javac_test_opts.txt"
    echo "-d \"$(mixed_path $TEST_CLASSES_DIR)\"" > "$opts_file"

    local sources_file="$BUILD_DIR/javac_test_sources.txt"
    [[ -f "$sources_file" ]] && rm "$sources_file"
    local n=0
    for f in $(find "$TEST_SOURCE_DIR/" -type f -name "*.java" 2>/dev/null); do
        echo $(mixed_path $f) >> "$sources_file"
        n=$((n + 1))
    done
    if [[ $n -eq 0 ]]; then
        warning "No Java test source file found"
        return
    fi
    local s=; [[ $n -gt 1 ]] && s="s"
    local n_files="$n Java test source file$s"
    if $DEBUG; then
        debug "$JAVAC_CMD \"@$(mixed_path $opts_file)\" \"@$(mixed_path $sources_file)\""
    elif $VERBOSE; then
        echo "Compile $n_files to directory \"${TEST_CLASSES_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$JAVAC_CMD \"@$(mixed_path $opts_file)\" \"@$(mixed_path $sources_file)\""
    if [[ $? -ne 0 ]]; then
        error "Failed to compile $n_files to directory \"${TEST_CLASSES_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

test_compile_scala() {
    local cpath=
    for f in $(find "$LIB_DIR/" -type f -name "*.jar" 2>/dev/null); do
        cpath="$cpath$(mixed_path $f)$PSEP"
    done
    cpath="$cpath$(mixed_path $CLASSES_DIR)$PSEP$(mixed_path $TEST_CLASSES_DIR)"

    local opts_file="$BUILD_DIR/scalac_test_opts.txt"
    echo "$SCALAC_OPTS -classpath \"$cpath\" -d \"$(mixed_path $TEST_CLASSES_DIR)\"" > "$opts_file"

    local sources_file="$BUILD_DIR/scalac_test_sources.txt"
    [[ -f "$sources_file" ]] && rm "$sources_file"
    local n=0
    for f in $(find "$TEST_SOURCE_DIR/" -type f -name "*.scala" 2>/dev/null); do
        echo "$(mixed_path $f)" >> "$sources_file"
        n=$((n + 1))
    done
    if [[ $n -eq 0 ]]; then
        warning "No Scala test source file found"
        return
    fi
    local s=; [[ $n -gt 1 ]] && s="s"
    local n_files="$n Scala test source file$s"
    if $DEBUG; then
        debug "$SCALAC_CMD \"@$(mixed_path $opts_file)\" \"@$(mixed_path $sources_file)\""
    elif $VERBOSE; then
        echo "Compile $n_files to directory \"${TEST_CLASSES_DIR/$ROOT_DIR\//}\"" 1>&2
    fi
    eval "$SCALAC_CMD \"@$(mixed_path $opts_file)\" \"@$(mixed_path $sources_file)\""
    if [[ $? -ne 0 ]]; then
        error "Failed to compile $n_files to directory \"${TEST_CLASSES_DIR/$ROOT_DIR\//}\""
        cleanup 1
    fi
}

test() {
    test_compile

    local java_opts="-cp \"$(mixed_path $JAR_FILE)$PSEP$(mixed_path $TEST_CLASSES_DIR)\""

    local runner_class=org.scalatest.tools.Runner
    ## https://www.scalatest.org/user_guide/using_the_runner
    local runner_args="-s ca.uwaterloo.flix.TestAll -oW"

    if $DEBUG; then
        debug "$JAVA_CMD $java_opts $runner_class $runner_args"
    elif $VERBOSE; then
        echo "Execute unit tests" 1>&2
    fi
    eval "$JAVA_CMD $java_opts $runner_class $runner_args"
    if [[ $? -ne 0 ]]; then
        error "Failed to execute unit tests"
        cleanup 1
    fi
}

##############################################################################
## Environment setup

BASENAME=$(basename "${BASH_SOURCE[0]}")

EXITCODE=0

ROOT_DIR="$(getHome)"

SOURCE_DIR=$ROOT_DIR/main
LIB_DIR=$ROOT_DIR/lib
MAIN_SOURCE_DIR=$SOURCE_DIR/src
TEST_SOURCE_DIR=$SOURCE_DIR/test
BUILD_DIR=$ROOT_DIR/build
CLASSES_DIR=$BUILD_DIR/classes
TEST_CLASSES_DIR=$BUILD_DIR/test-classes

SCALAC_OPTS="-J-Xmx1536m -encoding utf-8 -language:postfixOps -Ypatmat-exhaust-depth 400"

JAR_FILE=$BUILD_DIR/libs/flix.jar

CLEAN=false
COMPILE=false
DEBUG=false
HELP=false
JAR=false
MAIN_CLASS=ca.uwaterloo.flix.Main
MAIN_ARGS=
RUN=false
TEST=false
TIMER=false
VERBOSE=false

COLOR_START="[32m"
COLOR_END="[0m"

cygwin=false
mingw=false
msys=false
darwin=false
case "$(uname -s)" in
  CYGWIN*) cygwin=true ;;
  MINGW*)  mingw=true ;;
  MSYS*)   msys=true ;;
  Darwin*) darwin=true
esac
unset CYGPATH_CMD
PSEP=":"
if $cygwin || $mingw || $msys; then
    CYGPATH_CMD="$(which cygpath 2>/dev/null)"
    PSEP=";"
    [[ -n "$GIT_HOME" ]] && GIT_HOME="$(mixed_path $GIT_HOME)"
    [[ -n "$JAVA_HOME" ]] && JAVA_HOME="$(mixed_path $JAVA_HOME)"
    [[ -n "$SCALA_HOME" ]] && SCALA_HOME="$(mixed_path $SCALA_HOME)"
fi
if [ ! -x "$JAVA_HOME/bin/javac" ]; then
    error "Java SDK installation not found"
    cleanup 1
fi
JAR_CMD="$JAVA_HOME/bin/jar"
JAVA_CMD="$JAVA_HOME/bin/java"
JAVAC_CMD="$JAVA_HOME/bin/javac"

if [ ! -x "$SCALA_HOME/bin/scalac" ]; then
    error "Scala 2 installation not found"
    cleanup 1
fi
SCALA_CMD="$SCALA_HOME/bin/scala"
SCALAC_CMD="$SCALA_HOME/bin/scalac"

args "$@"
[[ $EXITCODE -eq 0 ]] || cleanup 1

##############################################################################
## Main

$HELP && help && cleanup

if $CLEAN; then
    clean || cleanup 1
fi
if $COMPILE; then
    compile || cleanup 1
fi
if $JAR; then
    jar || cleanup 1
fi
if $RUN; then
    run || cleanup 1
fi
if $TEST; then
    test || cleanup 1
fi
cleanup
