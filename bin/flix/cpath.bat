@echo off
setlocal enabledelayedexpansion

@rem output parameter: _CPATH

if not defined _DEBUG set _DEBUG=%~1
if not defined _DEBUG set _DEBUG=0
set _VERBOSE=0

if not defined _MVN_CMD set "_MVN_CMD=%MAVEN_HOME%\bin\mvn.cmd"
if %_DEBUG%==1 echo [%~n0] "_MVN_CMD=%_MVN_CMD%"

if %_DEBUG%==1 ( set _MVN_OPTS=
) else ( set _MVN_OPTS=--quiet
)
set _CENTRAL_REPO=https://repo1.maven.org/maven2
set _TYPESAFE_REPO=https://scala-ci.typesafe.com/ui/native/scala-pr-validation-snapshots/
set "_LOCAL_REPO=%USERPROFILE%\.m2\repository"

set "_TEMP_DIR=%TEMP%\lib"
if not exist "%_TEMP_DIR%" mkdir "%_TEMP_DIR%"
if %_DEBUG%==1 echo [%~n0] "_TEMP_DIR=%_TEMP_DIR%"

set _LIBS_CPATH=

set __SCALA_BINARY_VERSION=2.13

set __SCALA_VERSION=2.13.11

@rem https://mvnrepository.com/artifact/org.scala-lang/scala-library
call :add_jar "org.scala-lang" "scala-library" "%__SCALA_VERSION%"

@rem https://mvnrepository.com/artifact/org.scala-lang/scala-reflect
call :add_jar "org.scala-lang" "scala-reflect" "%__SCALA_VERSION%"

@rem https://mvnrepository.com/artifact/org.java-websocket/Java-WebSocket
@rem version 1.3.9 in build.gradle
call :add_jar "org.java-websocket" "Java-WebSocket" "1.5.3"

@rem https://mvnrepository.com/artifact/org.jline/jline
@rem version 3.5.1 in build.gradle
call :add_jar "org.jline" "jline" "3.22.0"

@rem version 3.6.12 in build.gradle
set __JSON4S_VERSION=4.0.6

@rem https://mvnrepository.com/artifact/org.json4s/json4s-ast
call :add_jar "org.json4s" "json4s-ast_%__SCALA_BINARY_VERSION%" "%__JSON4S_VERSION%"

@rem https://mvnrepository.com/artifact/org.json4s/json4s-core
call :add_jar "org.json4s" "json4s-core_%__SCALA_BINARY_VERSION%" "%__JSON4S_VERSION%"

@rem https://mvnrepository.com/artifact/org.json4s/json4s-native
call :add_jar "org.json4s" "json4s-native_%__SCALA_BINARY_VERSION%" "%__JSON4S_VERSION%"

@rem https://mvnrepository.com/artifact/org.json4s/json4s-native-core
call :add_jar "org.json4s" "json4s-native-core_%__SCALA_BINARY_VERSION%" "%__JSON4S_VERSION%"

@rem https://mvnrepository.com/artifact/org.ow2.asm/asm
@rem build.gradle -> 9.2
call :add_jar "org.ow2.asm" "asm" "9.5"

@rem https://mvnrepository.com/artifact/com.chuusai/shapeless
@rem call :add_jar "com.chuusai" "shapeless_%__SCALA_BINARY_VERSION%" "2.3.10"

@rem https://mvnrepository.com/artifact/org.parboiled/parboiled
call :add_jar "org.parboiled" "parboiled_%__SCALA_BINARY_VERSION%" "2.4.1"

@rem https://mvnrepository.com/artifact/org.scalactic/scalactic
@rem version 3.2.15 in build.gradle
call :add_jar "org.scalactic" "scalactic_%__SCALA_BINARY_VERSION%" "3.2.16"

@rem https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections
@rem version 0.2.0 in build.gradle
call :add_jar "org.scala-lang.modules" "scala-parallel-collections_%__SCALA_BINARY_VERSION%" "1.0.4"

@rem https://mvnrepository.com/artifact/com.github.scopt/scopt
@rem version 4.0.1 in build.gradle
call :add_jar "com.github.scopt" "scopt_%__SCALA_BINARY_VERSION%" "4.1.0"

@rem https://mvnrepository.com/artifact/com.google.guava/guava
call :add_jar "com.google.guava" "guava" "31.1-jre"

@rem https://mvnrepository.com/artifact/io.github.p-org.solvers/pjbdd
@rem version 1.0.10-9-67-gf113b5a in build.gradle
call :add_jar "io.github.p-org.solvers" "pjbdd" "1.0.10-10"

set __SCALATEST_VERSION=3.2.16

@rem https://mvnrepository.com/artifact/org.scalatest/scalatest
@rem version 3.2.15 in build.gradle
call :add_jar "org.scalatest" "scalatest_%__SCALA_BINARY_VERSION%" "%__SCALATEST_VERSION%"

goto end

@rem #########################################################################
@rem ## Subroutines

@rem input parameters: %1=group ID, %2=artifact ID, %3=version
@rem global variable: _LIBS_CPATH
:add_jar
@rem https://mvnrepository.com/artifact/org.portable-scala
set __GROUP_ID=%~1
set __ARTIFACT_ID=%~2
set __VERSION=%~3

set __JAR_NAME=%__ARTIFACT_ID%-%__VERSION%.jar
set __JAR_PATH=%__GROUP_ID:.=\%\%__ARTIFACT_ID:/=\%
set __JAR_FILE=
for /f "usebackq delims=" %%f in (`where /r "%_LOCAL_REPO%\%__JAR_PATH%" %__JAR_NAME% 2^>NUL`) do (
    set "__JAR_FILE=%%f"
)
if not exist "%__JAR_FILE%" (
    set __JAR_URL=%_CENTRAL_REPO%/%__GROUP_ID:.=/%/%__ARTIFACT_ID%/%__VERSION%/%__JAR_NAME%
    set "__JAR_FILE=%_TEMP_DIR%\%__JAR_NAME%"
    if not exist "!__JAR_FILE!" (
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% powershell -c "Invoke-WebRequest -Uri '!__JAR_URL!' -Outfile '!__JAR_FILE!'" 1>&2
        ) else if %_VERBOSE%==1 ( echo Download file %__JAR_NAME% to directory "!_TEMP_DIR:%USERPROFILE%=%%USERPROFILE%%!" 1>&2
        )
        powershell -c "$progressPreference='silentlyContinue';Invoke-WebRequest -Uri '!__JAR_URL!' -Outfile '!__JAR_FILE!'"
        if not !ERRORLEVEL!==0 (
            echo %_ERROR_LABEL% Failed to download file "%__JAR_NAME%" 1>&2
            set _EXITCODE=1
            goto :eof
        )
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_MVN_CMD%" %_MVN_OPTS% install:install-file -Dfile="!__JAR_FILE!" -DgroupId="%__GROUP_ID%" -DartifactId=%__ARTIFACT_ID% -Dversion=%__VERSION% -Dpackaging=jar 1>&2
        ) else if %_VERBOSE%==1 ( echo Install Maven artifact into directory "!_LOCAL_REPO:%USERPROFILE%=%%USERPROFILE%%!\%__SCALA_XML_PATH%" 1>&2
        )
        @rem see https://stackoverflow.com/questions/16727941/how-do-i-execute-cmd-commands-through-a-batch-file
        call "%_MVN_CMD%" %_MVN_OPTS% install:install-file -Dfile="!__JAR_FILE!" -DgroupId="%__GROUP_ID%" -DartifactId=%__ARTIFACT_ID% -Dversion=%__VERSION% -Dpackaging=jar
        if not !ERRORLEVEL!==0 (
            echo %_ERROR_LABEL% Failed to install Maven artifact into directory "!_LOCAL_REPO:%USERPROFILE%=%%USERPROFILE%%!" ^(error:!ERRORLEVEL!^) 1>&2
        )
        for /f "usebackq delims=" %%f in (`where /r "%_LOCAL_REPO%\%__JAR_PATH%" %__JAR_NAME% 2^>NUL`) do (
            set "__JAR_FILE=%%f"
        )
    )
)
set "_LIBS_CPATH=%_LIBS_CPATH%%__JAR_FILE%;"
goto :eof

@rem #########################################################################
@rem ## Cleanups

:end
endlocal & (
    set "_CPATH=%_LIBS_CPATH%"
)