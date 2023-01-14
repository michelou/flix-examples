@echo off
setlocal enabledelayedexpansion

@rem output parameter: _CPATH

if not defined _DEBUG set _DEBUG=%~1
if not defined _DEBUG set _DEBUG=0
set _VERBOSE=0

if not defined _MVN_CMD set "_MVN_CMD=%MAVEN_HOME%\bin\mvn.cmd"
if %_DEBUG%==1 echo [%~n0] "MVN_CMD=%_MVN_CMD%"

if %_DEBUG%==1 ( set _MVN_OPTS=
) else ( set _MVN_OPTS=--quiet
)
set __CENTRAL_REPO=https://repo1.maven.org/maven2
set "__LOCAL_REPO=%USERPROFILE%\.m2\repository"

set "__TEMP_DIR=%TEMP%\lib"
if not exist "%__TEMP_DIR%" mkdir "%__TEMP_DIR%"
if %_DEBUG%==1 echo [%~n0] "_TEMP_DIR=%_TEMP_DIR%"

set _LIBS_CPATH=

set __SCALA_BINARY_VERSION=2.13

set __SCALA_VERSION=2.13.5

@rem https://mvnrepository.com/artifact/org.scala-lang/scala-library
call :add_jar "org.scala-lang" "scala-library" "%__SCALA_VERSION%"

@rem https://mvnrepository.com/artifact/org.scala-lang/scala-reflect
call :add_jar "org.scala-lang" "scala-reflect" "%__SCALA_VERSION%"

@rem https://mvnrepository.com/artifact/org.java-websocket/Java-WebSocket
@rem build.gradle -> 1.3.9
call :add_jar "org.java-websocket" "Java-WebSocket" "1.5.3"

@rem https://mvnrepository.com/artifact/org.jline/jline
@rem build.gradle -> 3.5.1
call :add_jar "org.jline" "jline" "3.21.0"

set __JSON4S_VERSION=4.0.6
@rem build.gradle -> 3.5.5

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
call :add_jar "org.ow2.asm" "asm" "9.4"

@rem https://mvnrepository.com/artifact/com.chuusai/shapeless
call :add_jar "com.chuusai" "shapeless_%__SCALA_BINARY_VERSION%" "2.3.10"

@rem https://mvnrepository.com/artifact/org.parboiled/parboiled
@rem build.gradle -> 2.2.1
call :add_jar "org.parboiled" "parboiled_%__SCALA_BINARY_VERSION%" "2.4.1"

@rem https://mvnrepository.com/artifact/org.scalactic/scalactic
@rem build.gradle -> 3.0.8
call :add_jar "org.scalactic" "scalactic_%__SCALA_BINARY_VERSION%" "3.2.15"

@rem https://mvnrepository.com/artifact/org.scala-lang.modules/scala-parallel-collections
@rem build.gradle -> 0.2.0
call :add_jar "org.scala-lang.modules" "scala-parallel-collections_%__SCALA_BINARY_VERSION%" "1.0.4"

@rem https://mvnrepository.com/artifact/com.github.scopt/scopt
@rem build.gradle -> 4.0.1
call :add_jar "com.github.scopt" "scopt_%__SCALA_BINARY_VERSION%" "4.1.0"

@rem https://mvnrepository.com/artifact/com.google.guava/guava
call :add_jar "com.google.guava" "guava" "25.1-jre"

@rem https://mvnrepository.com/artifact/io.github.p-org.solvers/pjbdd
call :add_jar "io.github.p-org.solvers" "pjbdd" "1.0.10-10-v5"

set __SCALATEST_VERSION=3.2.15

@rem https://mvnrepository.com/artifact/org.scalatest/scalatest
@rem build.gradle -> 3.0.8
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
for /f "usebackq delims=" %%f in (`where /r "%__LOCAL_REPO%\%__JAR_PATH%" %__JAR_NAME% 2^>NUL`) do (
    set "__JAR_FILE=%%f"
)
if not exist "%__JAR_FILE%" (
    set __JAR_URL=%__CENTRAL_REPO%/%__GROUP_ID:.=/%/%__ARTIFACT_ID%/%__VERSION%/%__JAR_NAME%
    set "__JAR_FILE=%__TEMP_DIR%\%__JAR_NAME%"
    if not exist "!__JAR_FILE!" (
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% powershell -c "Invoke-WebRequest -Uri '!__JAR_URL!' -Outfile '!__JAR_FILE!'" 1>&2
        ) else if %_VERBOSE%==1 ( echo Download file %__JAR_NAME% to directory "!__TEMP_DIR:%USERPROFILE%=%%USERPROFILE%%!" 1>&2
        )
        powershell -c "$progressPreference='silentlyContinue';Invoke-WebRequest -Uri '!__JAR_URL!' -Outfile '!__JAR_FILE!'"
        if not !ERRORLEVEL!==0 (
            echo %_ERROR_LABEL% Failed to download file %__JAR_NAME% 1>&2
            set _EXITCODE=1
            goto :eof
        )
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_MVN_CMD%" %_MVN_OPTS% install:install-file -Dfile="!__JAR_FILE!" -DgroupId="%__GROUP_ID%" -DartifactId=%__ARTIFACT_ID% -Dversion=%__VERSION% -Dpackaging=jar 1>&2
        ) else if %_VERBOSE%==1 ( echo Install Maven artifact into directory "!__LOCAL_REPO:%USERPROFILE%=%%USERPROFILE%%!\%__SCALA_XML_PATH%" 1>&2
        )
        @rem see https://stackoverflow.com/questions/16727941/how-do-i-execute-cmd-commands-through-a-batch-file
        %_MVN_CMD% %_MVN_OPTS% install:install-file -Dfile="!__JAR_FILE!" -DgroupId="%__GROUP_ID%" -DartifactId=%__ARTIFACT_ID% -Dversion=%__VERSION% -Dpackaging=jar
        if not !ERRORLEVEL!==0 (
            echo %_ERROR_LABEL% Failed to install Maven artifact into directory "!__LOCAL_REPO:%USERPROFILE%=%%USERPROFILE%%!" ^(error:!ERRORLEVEL!^) 1>&2
        )
        for /f "usebackq delims=" %%f in (`where /r "%__LOCAL_REPO%\%__JAR_PATH%" %__JAR_NAME% 2^>NUL`) do (
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