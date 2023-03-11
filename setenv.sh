#!/usr/bin/env bash

## Usage: $ . ./setenv.sh

##############################################################################
## Subroutines

getHome() {
    local source="${BASH_SOURCE[0]}"
    while [] -h "$source" ]]; do
        local linked="$(readlink "$source")"
        local dir="$( cd -P $(dirname "$source") && cd -P $(dirname "$linked") && pwd )"
        source="$dir/$(basename "$linked")"
    done
    ( cd -P "$(dirname "$source")" && pwd )
}

getOS() {
    local os
    case "$(uname -s)" in
        Linux*)  os=linux;;
        Darwin*) os=mac;;
        CYGWIN*) os=cygwin;;
        MINGW*)  os=mingw;;
        *)       os=unknown
    esac
    echo $os
}

getPath() {
    local path=""
    for i in $(ls -d "$1"*/ 2>/dev/null); do path=$i; done
    # ignore trailing slash introduced in for loop
    [[ -z "$path" ]] && echo "" || echo "${path::-1}"
}

##############################################################################
## Environment setup

PROG_HOME="$(getHome)"

OS="$(getOS)"
[[ $OS == "unknown" ]] && { echo "Unsuppored OS"; exit 1; }

if [[ $OS == "cygwin" || $OS == "mingw" ]]; then
    [[ $OS == "cygwin" ]] && prefix="/cygdrive" || prefix=""
    export FLIX_HOME="$(getPath "$prefix/c/opt/flix-0")"
    export GRADLE_HOME="$(getPath "$prefix/c/opt/gradle-7")"
    export GIT_HOME="$(getPath "$prefix/c/opt/Git-2")"
    export JAVA_HOME="$(getPath "$prefix/c/opt/jdk-temurin-11")"
    export JMC_HOME="$(getPath "$prefix/c/opt/jmc-8")"
    export MAKE_HOME="$(getPath "$prefix/c/opt/make-3")"
    export SCALA_HOME="$(getPath "$prefix/c/opt/scala-2.13")"
else
    export FLIX_HOME="$(getPath "/opt/flix-0")"
    export GRADLE_HOME="$(getPath "/opt/gradle-7")"
    export JAVA_HOME="$(getPath "/opt/jdk-temurin-11")"
    export JMC_HOME="$(getPath "/opt/jmc-8")"
    export SCALA_HOME="$(getPath "/opt/scala-2.13")"
fi
PATH1="$PATH"
[[ -x "$GRADLE_HOME/bin/gradle" ]] && PATH1="$PATH1:$GRADLE_HOME/bin"
[[ -x "$GIT_HOME/bin/git" ]] && PATH1="$PATH1:$GIT_HOME/bin"
[[ -x "$MAKE_HOME/bin/make" ]] && PATH1="$PATH1:$MAKE_HOME/bin"
export PATH="$PATH1"
