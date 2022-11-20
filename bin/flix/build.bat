@echo off
setlocal enabledelayedexpansion

@rem only for interactive debugging !
set _DEBUG=0

@rem ############################################
@rem ## Environment setup

set _EXITCODE=0

call :env
if not %_EXITCODE%==0 goto end

call :args %*
if not %_EXITCODE%==0 goto end

@rem ############################################
@rem ## Main

for %%i in (%_COMMANDS%) do (
    call :%%i
    if not !_EXITCODE!==0 goto end
)
goto end

@rem ############################################
@rem ## Subroutines

:env
set _BASENAME=%~n0
set "_ROOT_DIR=%~dp0"
set _TIMER=0

call :env_colors
set _DEBUG_LABEL=%_NORMAL_BG_CYAN%[%_BASENAME%]%_RESET%
set _ERROR_LABEL=%_STRONG_FG_RED%Error%_RESET%:
set _WARNING_LABEL=%_STRONG_FG_YELLOW%Warning%_RESET%:

set "_MAIN_SOURCE_DIR=%_ROOT_DIR%main\src"
set "_TEST_SOURCE_DIR=%_ROOT_DIR%main\test"

set "_BUILD_DIR=%_ROOT_DIR%build"
set "_CLASSES_DIR=%_BUILD_DIR%\classes"
set "_TEST_CLASSES_DIR=%_BUILD_DIR%\test-classes"

if not exist "%JAVA_HOME%\bin\jar.exe" (
    echo %_ERROR_LABEL% Java SDK installation not found 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_JAR_CMD=%JAVA_HOME%\bin\jar.exe"
set "_JAVA_CMD=%JAVA_HOME%\bin\java.exe"
set "_JAVAC_CMD=%JAVA_HOME%\bin\javac.exe"

if not exist "%SCALA_HOME%\bin\scala.bat" (
    echo %_ERROR_LABEL% Scala 2 installation not found 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_SCALA_CMD=%SCALA_HOME%\bin\scala.bat"
set "_SCALAC_CMD=%SCALA_HOME%\bin\scalac.bat"
goto :eof

:env_colors
@rem ANSI colors in standard Windows 10 shell
@rem see https://gist.github.com/mlocati/#file-win10colors-cmd
set _RESET=[0m
set _BOLD=[1m
set _UNDERSCORE=[4m
set _INVERSE=[7m

@rem normal foreground colors
set _NORMAL_FG_BLACK=[30m
set _NORMAL_FG_RED=[31m
set _NORMAL_FG_GREEN=[32m
set _NORMAL_FG_YELLOW=[33m
set _NORMAL_FG_BLUE=[34m
set _NORMAL_FG_MAGENTA=[35m
set _NORMAL_FG_CYAN=[36m
set _NORMAL_FG_WHITE=[37m

@rem normal background colors
set _NORMAL_BG_BLACK=[40m
set _NORMAL_BG_RED=[41m
set _NORMAL_BG_GREEN=[42m
set _NORMAL_BG_YELLOW=[43m
set _NORMAL_BG_BLUE=[44m
set _NORMAL_BG_MAGENTA=[45m
set _NORMAL_BG_CYAN=[46m
set _NORMAL_BG_WHITE=[47m

@rem strong foreground colors
set _STRONG_FG_BLACK=[90m
set _STRONG_FG_RED=[91m
set _STRONG_FG_GREEN=[92m
set _STRONG_FG_YELLOW=[93m
set _STRONG_FG_BLUE=[94m
set _STRONG_FG_MAGENTA=[95m
set _STRONG_FG_CYAN=[96m
set _STRONG_FG_WHITE=[97m

@rem strong background colors
set _STRONG_BG_BLACK=[100m
set _STRONG_BG_RED=[101m
set _STRONG_BG_GREEN=[102m
set _STRONG_BG_YELLOW=[103m
set _STRONG_BG_BLUE=[104m
goto :eof

@rem input parameter: %*
:args
set _COMMANDS=
set _MAIN_CLASS=ca.uwaterloo.flix.Main
set _MAIN_ARGS=
set _TEST=0
set _TIMER=0
set _VERBOSE=0
set __N=0
:args_loop
set "__ARG=%~1"
if not defined __ARG (
    if !__N!==0 set _COMMANDS=help
    goto args_done
)
if "%__ARG:~0,1%"=="-" (
    @rem option
    if "%__ARG%"=="-debug" ( set _DEBUG=1
    ) else if "%__ARG%"=="-help" ( set _HELP=1
    ) else if "%__ARG%"=="-timer" ( set _TIMER=1
    ) else if "%__ARG%"=="-verbose" ( set _VERBOSE=1
    ) else (
        echo %_ERROR_LABEL% Unknown option %__ARG% 1>&2
        set _EXITCODE=1
        goto args_done
    )
) else (
    @rem subcommand
    if "%__ARG%"=="clean" ( set _COMMANDS=!_COMMANDS! clean
    ) else if "%__ARG%"=="compile" ( set _COMMANDS=!_COMMANDS! compile
    ) else if "%__ARG%"=="help" ( set _COMMANDS=help
    ) else if "%__ARG%"=="jar" ( set _COMMANDS=!_COMMANDS! compile jar
    ) else if "%__ARG%"=="run" ( set _COMMANDS=!_COMMANDS! compile jar run
    ) else if "%__ARG%"=="test" ( set _COMMANDS=!_COMMANDS! compile jar test
    ) else (
        echo %_ERROR_LABEL% Unknown subcommand %__ARG% 1>&2
        set _EXITCODE=1
        goto args_done
    )
    set /a __N+=1
)
shift
goto args_loop
:args_done
set _SCALAC_OPTS=-J-Xmx1536m -language:postfixOps -Ypatmat-exhaust-depth 400

set "_JAR_FILE=%_BUILD_DIR%\libs\flix.jar"

if %_DEBUG%==1 (
    echo %_DEBUG_LABEL% Options    : _TIMER=%_TIMER% _VERBOSE=%_VERBOSE% 1>&2
    echo %_DEBUG_LABEL% Subcommands: %_COMMANDS% 1>&2
    echo %_DEBUG_LABEL% Variables  : "JAVA_HOME=%JAVA_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : "SCALA_HOME=%SCALA_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : _MAIN_CLASS=%_MAIN_CLASS% _MAIN_ARGS=%_MAIN_ARGS% 1>&2
)
if %_TIMER%==1 for /f "delims=" %%i in ('powershell -c "(Get-Date)"') do set _TIMER_START=%%i
goto :eof

:help
if %_VERBOSE%==1 (
    set __BEG_P=%_STRONG_FG_CYAN%%_UNDERSCORE%
    set __BEG_O=%_STRONG_FG_GREEN%
    set __BEG_N=%_NORMAL_FG_YELLOW%
    set __END=%_RESET%
) else (
    set __BEG_P=
    set __BEG_O=
    set __BEG_N=
    set __END=
)
echo Usage: %__BEG_O%%_BASENAME% { ^<option^> ^| ^<subcommand^> }%__END%
echo.
echo   %__BEG_P%Options:%__END%
echo     %__BEG_O%-debug%__END%       show commands executed by this script
echo     %__BEG_O%-verbose%__END%     display progress messages
echo.
echo   %__BEG_P%Subcommands:%__END%
echo     %__BEG_O%clean%__END%        delete generated files
echo     %__BEG_O%compile%__END%      compile Java/Scala source files
echo     %__BEG_O%help%__END%         display this help message
echo     %__BEG_O%jar%__END%          create JAR archive "!_JAR_FILE=%_ROOT_DIR%=!"
echo     %__BEG_O%run%__END%          execute main class "%__BEG_N%%_MAIN_CLASS%%__END%"
echo     %__BEG_O%test%__END%         execut unit tests with Scalatest
goto :eof

:clean
call :rmdir "%_BUILD_DIR%"
goto :eof

@rem input parameter: %1=directory path
:rmdir
set "__DIR=%~1"
if not exist "%__DIR%\" goto :eof
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% rmdir /s /q "%__DIR%" 1>&2
) else if %_VERBOSE%==1 ( echo Delete directory "!__DIR:%_ROOT_DIR%=!" 1>&2
)
rmdir /s /q "%__DIR%"
if not %ERRORLEVEL%==0 (
    set _EXITCODE=1
    goto :eof
)
goto :eof

:compile
if not exist "%_CLASSES_DIR%" mkdir "%_CLASSES_DIR%" 1>NUL

set "__TIMESTAMP_FILE=%_BUILD_DIR%\.latest-build"

call :action_required "%__TIMESTAMP_FILE%" "%_MAIN_SOURCE_DIR%\*.java"
if %_ACTION_REQUIRED%==0 goto compile_next

call :compile_java
if not %_EXITCODE%==0 goto :eof

:compile_next
call :action_required "%__TIMESTAMP_FILE%" "%_MAIN_SOURCE_DIR%\*.scala"
if %_ACTION_REQUIRED%==0 goto :eof

call :compile_scala
if not %_EXITCODE%==0 goto :eof

echo. > "%__TIMESTAMP_FILE%"
goto :eof

:compile_java
set "__OPTS_FILE=%_BUILD_DIR%\javac_opts.txt"
echo -d "%_CLASSES_DIR:\=\\%" > "%__OPTS_FILE%"

set "__SOURCES_FILE=%_BUILD_DIR%\javac_sources.txt"
if exist "%__SOURCES_FILE%" del "%__SOURCES_FILE%" 1>NUL
set __N=0
for /f %%f in ('dir /s /b "%_MAIN_SOURCE_DIR%\*.java" 2^>NUL') do (
    echo %%f >> "%__SOURCES_FILE%"
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Java source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Java source file
) else ( set __N_FILES=%__N% Java source files
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% to directory "!_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
)
call "%_JAVAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% to directory "!_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:compile_scala
set __CPATH=
for /f "delims=" %%f in ('dir /b "%_ROOT_DIR%lib\*.jar" 2^>NUL') do (
    set "__CPATH=!__CPATH!%_ROOT_DIR%lib\%%f;"
)
set "__CPATH=%__CPATH%%_CLASSES_DIR%"

set "__OPTS_FILE=%_BUILD_DIR%\scalac_opts.txt"
echo %_SCALAC_OPTS% -classpath "%__CPATH%" -d "%_CLASSES_DIR%" > "%__OPTS_FILE%"

set "__SOURCES_FILE=%_BUILD_DIR%\scalac_sources.txt"
if exist "%__SOURCES_FILE%" del "%__SOURCES_FILE%" 1>NUL
set __N=0
for /f %%f in ('dir /s /b "%_MAIN_SOURCE_DIR%\*.scala" 2^>NUL') do (
    echo %%f >> "%__SOURCES_FILE%"
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Scala source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Scala source file
) else ( set __N_FILES=%__N% Scala source files
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_SCALAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% to directory "!_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
)
call "%_SCALAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% to directory "!_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem input parameter: 1=target file 2,3,..=path (wildcards accepted)
@rem output parameter: _ACTION_REQUIRED
:action_required
set "__TARGET_FILE=%~1"

set __PATH_ARRAY=
set __PATH_ARRAY1=
:action_path
shift
set "__PATH=%~1"
if not defined __PATH goto action_next
set __PATH_ARRAY=%__PATH_ARRAY%,'%__PATH%'
set __PATH_ARRAY1=%__PATH_ARRAY1%,'!__PATH:%_ROOT_DIR%=!'
goto action_path

:action_next
set __TARGET_TIMESTAMP=00000000000000
for /f "usebackq" %%i in (`powershell -c "gci -path '%__TARGET_FILE%' -ea Stop | select -last 1 -expandProperty LastWriteTime | Get-Date -uformat %%Y%%m%%d%%H%%M%%S" 2^>NUL`) do (
     set __TARGET_TIMESTAMP=%%i
)
set __SOURCE_TIMESTAMP=00000000000000
for /f "usebackq" %%i in (`powershell -c "gci -recurse -path %__PATH_ARRAY:~1% -ea Stop | sort LastWriteTime | select -last 1 -expandProperty LastWriteTime | Get-Date -uformat %%Y%%m%%d%%H%%M%%S" 2^>NUL`) do (
    set __SOURCE_TIMESTAMP=%%i
)
call :newer %__SOURCE_TIMESTAMP% %__TARGET_TIMESTAMP%
set _ACTION_REQUIRED=%_NEWER%
if %_DEBUG%==1 (
    echo %_DEBUG_LABEL% %__TARGET_TIMESTAMP% Target : '%__TARGET_FILE%' 1>&2
    echo %_DEBUG_LABEL% %__SOURCE_TIMESTAMP% Sources: %__PATH_ARRAY:~1% 1>&2
    echo %_DEBUG_LABEL% _ACTION_REQUIRED=%_ACTION_REQUIRED% 1>&2
) else if %_VERBOSE%==1 if %_ACTION_REQUIRED%==0 if %__SOURCE_TIMESTAMP% gtr 0 (
    echo No action required ^(%__PATH_ARRAY1:~1%^) 1>&2
)
goto :eof

@rem input parameters: %1=file timestamp 1, %2=file timestamp 2
@rem output parameter: _NEWER
:newer
set __TIMESTAMP1=%~1
set __TIMESTAMP2=%~2

set __DATE1=%__TIMESTAMP1:~0,8%
set __TIME1=%__TIMESTAMP1:~-6%

set __DATE2=%__TIMESTAMP2:~0,8%
set __TIME2=%__TIMESTAMP2:~-6%

if %__DATE1% gtr %__DATE2% ( set _NEWER=1
) else if %__DATE1% lss %__DATE2% ( set _NEWER=0
) else if %__TIME1% gtr %__TIME2% ( set _NEWER=1
) else ( set _NEWER=0
)
goto :eof

:jar
if not exist "%_BUILD_DIR%\libs" mkdir "%_BUILD_DIR%\libs"
if not exist "%_BUILD_DIR%\tmp" mkdir "%_BUILD_DIR%\tmp"

set "__TIMESTAMP_FILE=%_BUILD_DIR%\.latest-build"

call :action_required "%_JAR_FILE%" "%__TIMESTAMP_FILE%"
if %_ACTION_REQUIRED%==0 goto :eof

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAR_CMD%" cf "%_JAR_FILE%" -C "%_BUILD_DIR%\classes" . 1>&2
) else if %_VERBOSE%==1 ( echo Create Java archive "!_JAR_FILE:%_ROOT_DIR%=!" 1>&2
)
"%_JAR_CMD%" cf "%_JAR_FILE%" -C "%_BUILD_DIR%\classes" .
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to create Java archive "!_JAR_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
@rem we include the Flix sources and resources into the Flix jar file
set "__ARG_FILE=%_BUILD_DIR%\jar_list.txt"
if exist "%__ARG_FILE%" del "%__ARG_FILE%"
for /f "delims=" %%f in ('dir /b /s "%_MAIN_SOURCE_DIR%\*.flix" "%_MAIN_SOURCE_DIR%\*.zip" "%_TEST_SOURCE_DIR%\*.flix" 2^>NUL') do (
    set "__FILE=%%f"
    set "__FILE=!__FILE:%_ROOT_DIR%main\=!"
    echo -C "%_ROOT_DIR:\=/%main" "!__FILE:\=/!" >> "%__ARG_FILE%"
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAR_CMD%" uf "%_JAR_FILE%" "@%__ARG_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Update archive "!_JAR_FILE:%_ROOT_DIR%=!" ^(Flix sources^) 1>&2
)
"%_JAR_CMD%" uf "%_JAR_FILE%" "@%__ARG_FILE%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to update Java archive "!_JAR_FILE:%_ROOT_DIR%=!" ^(Flix sources^) 1>&2
    set _EXITCODE=1
    goto :eof
)
@rem we include the Scala library into the Flix jar file
for %%i in (scala-library scala-reflect) do (
    call :include_jar "%_JAR_FILE%" "%SCALA_HOME%\lib\%%i.jar"
    if not !_EXITCODE!==0 goto :eof
)
@rem we include the library dependencies into the Flix jar file
for /f "delims=" %%f in ('dir /b "%_ROOT_DIR%lib\*.jar" 2^>NUL') do (
    call :include_jar "%_JAR_FILE%" "%_ROOT_DIR%lib\%%f"
    if not !_EXITCODE!==0 goto :eof
)
set "__MANIFEST_FILE=%_MAIN_SOURCE_DIR%\META-INF\MANIFEST.MF"
if not exist "%__MANIFEST_FILE%" (
    echo %_ERROR_LABEL% Manifest file not found 1>&2
    set _EXITCODE=1
    goto :eof
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAR_CMD%" ufm "%_JAR_FILE%" "%__MANIFEST_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Add manifest to archive "!_JAR_FILE:%_ROOT_DIR%=!" 1>&2
)
"%_JAR_CMD%" ufm "%_JAR_FILE%" "%__MANIFEST_FILE%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to add manifest to archive "!_JAR_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem input parameters: %1=path of target JAR file, %2=path of source JAR file
:include_jar
set "__TARGET_JAR_FILE=%~1"
set "__SOURCE_JAR_FILE=%~2"

for %%f in ("%__SOURCE_JAR_FILE%") do set "__NAME=%%~nf"
set "__OUTPUT_DIR=%_BUILD_DIR%\tmp\%__NAME%"
if not exist "%__OUTPUT_DIR%" mkdir "%__OUTPUT_DIR%"

pushd "%__OUTPUT_DIR%"
if %_DEBUG%==1 echo %_DEBUG_LABEL% "%_JAR_CMD%" xf "%__SOURCE_JAR_FILE%" 1>&2
"%_JAR_CMD%" xf "%__SOURCE_JAR_FILE%"
if not !ERRORLEVEL!==0 (
    popd
    echo %_ERROR_LABEL% Failed to extract archive "!__SOURCE_JAR_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
popd
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAR_CMD%" uf "%__TARGET_JAR_FILE%" -C "%__OUTPUT_DIR%" . 1>&2
) else if %_VERBOSE%==1 ( echo Update archive "!__TARGET_JAR_FILE:%_ROOT_DIR%=!" ^("!__SOURCE_JAR_FILE:%_ROOT_DIR%=!"^) 1>&2
)
"%_JAR_CMD%" uf "%__TARGET_JAR_FILE%" -C "%__OUTPUT_DIR%" .
if not %ERRORLEVEL%==0 (
    echo Failed to update archive "!__TARGET_JAR_FILE:%_ROOT_DIR%=!" ^("!__SOURCE_JAR_FILE:%_ROOT_DIR%=!"^) 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:run
set __RUN_ARGS=--version

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" -jar "%_JAR_FILE%" %__RUN_ARGS% 1>&2
) else if %_VERBOSE%==1 ( echo Execute program file "!_JAR_FILE:%_ROOT_DIR%=!" with arguments %__RUN_ARGS% 1>&2
)
"%_JAVA_CMD%" -jar "%_JAR_FILE%" %__RUN_ARGS%
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to execute program file "!_JAR_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:test_compile
if not exist "%_TEST_CLASSES_DIR%" mkdir "%_TEST_CLASSES_DIR%" 1>NUL

set "__TIMESTAMP_FILE=%_BUILD_DIR%\.latest-test_build"

call :action_required "%__TIMESTAMP_FILE%" "%_TEST_SOURCE_DIR%\*.java"
if %_ACTION_REQUIRED%==0 goto test_compile_next

call :test_compile_java
if not %_EXITCODE%==0 goto :eof

:test_compile_next
call :action_required "%__TIMESTAMP_FILE%" "%_TEST_SOURCE_DIR%\*.scala"
if %_ACTION_REQUIRED%==0 goto :eof

call :test_compile_scala
if not %_EXITCODE%==0 goto :eof

echo. > "%__TIMESTAMP_FILE%"
goto :eof

:compile_java
set "__OPTS_FILE=%_BUILD_DIR%\javac_test_opts.txt"
echo -d "%_TEST_CLASSES_DIR:\=\\%" > "%__OPTS_FILE%"

set "__SOURCES_FILE=%_BUILD_DIR%\javac_test_sources.txt"
if exist "%__SOURCES_FILE%" del "%__SOURCES_FILE%" 1>NUL
set __N=0
for /f %%f in ('dir /s /b "%_TEST_SOURCE_DIR%\*.java" 2^>NUL') do (
    echo %%f >> "%__SOURCES_FILE%"
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Java test source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Java test source file
) else ( set __N_FILES=%__N% Java test source files
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% to directory "!_TEST_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
)
call "%_JAVAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% to directory "!_TEST_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:test_compile_scala
set __CPATH=
for /f "delims=" %%f in ('dir /b "%_ROOT_DIR%lib\*.jar" 2^>NUL') do (
    set "__CPATH=!__CPATH!%_ROOT_DIR%lib\%%f;"
)
set "__CPATH=%__CPATH%%_CLASSES_DIR%;%_TEST_CLASSES_DIR%"

set "__OPTS_FILE=%_BUILD_DIR%\scalac_test_opts.txt"
echo %_SCALAC_OPTS% -classpath "%__CPATH:\=\\%" -d "%_TEST_CLASSES_DIR:\=\\%" > "%__OPTS_FILE%"

set "__SOURCES_FILE=%_BUILD_DIR%\scalac_test_sources.txt"
if exist "%__SOURCES_FILE%" del "%__SOURCES_FILE%" 1>NUL
set __N=0
for /f %%f in ('dir /s /b "%_TEST_SOURCE_DIR%\*.scala" 2^>NUL') do (
    echo %%f >> "%__SOURCES_FILE%"
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Scala test source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Scala test source file
) else ( set __N_FILES=%__N% Scala test source files
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_SCALAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%" 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% to directory "!_TEST_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
)
call "%_SCALAC_CMD%" "@%__OPTS_FILE%" "@%__SOURCES_FILE%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% to directory "!_TEST_CLASSES_DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:test
call test_compile
if not %_EXITCODE%==0 goto :eof

set __JAVA_OPTS=-cp "%_JAR_FILE%;%_TEST_CLASSES_DIR%"

set __RUNNER_CLASS=org.scalatest.tools.Runner
@rem https://www.scalatest.org/user_guide/using_the_runner
set __RUNNER_ARGS=-s ca.uwaterloo.flix.TestAll -oW

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" %__JAVA_OPTS% %__RUNNER_CLASS% %__RUNNER_ARGS% 1>&2
) else if %_VERBOSE%==1 ( echo Execute unit tests 1>&2
)
"%_JAVA_CMD%" %__JAVA_OPTS% %__RUNNER_CLASS% %__RUNNER_ARGS%
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to execute unit tests 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem output parameter: _DURATION
:duration
set __START=%~1
set __END=%~2

for /f "delims=" %%i in ('powershell -c "$interval = New-TimeSpan -Start '%__START%' -End '%__END%'; Write-Host $interval"') do set _DURATION=%%i
goto :eof

@rem ############################################
@rem ## Cleanups

:end
if %_TIMER%==1 (
    for /f "delims=" %%i in ('powershell -c "(Get-Date)"') do set __TIMER_END=%%i
    call :duration "%_TIMER_START%" "!__TIMER_END!"
    echo Total execution time: !_DURATION! 1>&2
)
if %_DEBUG%==1 echo %_DEBUG_LABEL% _EXITCODE=%_EXITCODE% 1>&2
exit /b %_EXITCODE%
