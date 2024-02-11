@echo off
setlocal enabledelayedexpansion

@rem only for interactive debugging !
set _DEBUG=0

@rem #########################################################################
@rem ## Environment setup

set _EXITCODE=0

call :env
if not %_EXITCODE%==0 goto end

call :args %*
if not %_EXITCODE%==0 goto end

@rem #########################################################################
@rem ## Main

if %_HELP%==1 (
    call :help
    exit /b !_EXITCODE!
)
for %%i in (%_COMMANDS%) do (
    call :%%i
    if not !_EXITCODE!==0 goto end
)
goto end

@rem #########################################################################
@rem ## Subroutine

@rem output parameters: _DEBUG_LABEL, _ERROR_LABEL, _WARNING_LABEL
@rem                    _JAR_CMD, _JAVA_CMD, _SCALAC_CMD, _FLIX_JAR
:env
set _BASENAME=%~n0
set "_ROOT_DIR=%~dp0"

call :env_colors
set _DEBUG_LABEL=%_NORMAL_BG_CYAN%[%_BASENAME%]%_RESET%
set _ERROR_LABEL=%_STRONG_FG_RED%Error%_RESET%:
set _WARNING_LABEL=%_STRONG_FG_YELLOW%Warning%_RESET%:

set "_SOURCE_DIR=%_ROOT_DIR%src"
set "_SOURCE_MAIN_DIR=%_SOURCE_DIR%\main"
set "_SOURCE_TEST_DIR=%_SOURCE_DIR%\test"
set "_TARGET_DIR=%_ROOT_DIR%target"

if not exist "%JAVA_HOME%\bin\java.exe" (
    echo %_ERROR_LABEL% Java SDK installation not found 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_JAR_CMD=%JAVA_HOME%\bin\jar.exe"
set "_JAVA_CMD=%JAVA_HOME%\bin\java.exe"

if not exist "%SCALA_HOME%\bin\scalac.bat" (
    echo %_ERROR_LABEL% Scala 2 installation not found 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_SCALAC_CMD=%SCALA_HOME%\bin\scalac.bat"

if not exist "%FLIX_HOME%\flix.jar" (
    echo %_ERROR_LABEL% Flix library not found 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_FLIX_JAR=%FLIX_HOME%\flix.jar"
goto :eof

:env_colors
@rem ANSI colors in standard Windows 10 shell
@rem see https://gist.github.com/mlocati/#file-win10colors-cmd

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

@rem we define _RESET in last position to avoid crazy console output with type command
set _BOLD=[1m
set _INVERSE=[7m
set _UNDERSCORE=[4m
set _RESET=[0m
goto :eof

@rem input parameter: %*
@rem output parameters: _COMMANDS, _HELP, _NIGHTLY, _VERBOSE
:args
set _COMMANDS=
set _HELP=0
set _NIGHTLY=0
set _VERBOSE=0
set __N=0
:args_loop
set "__ARG=%~1"
if not defined __ARG (
    if !__N!==0 set _HELP=1
    goto args_done
)
if "%__ARG:~0,1%"=="-" (
    @rem option
    if "%__ARG%"=="-debug" ( set _DEBUG=1
    ) else if "%__ARG%"=="-help" ( set _HELP=1
    ) else if "%__ARG%"=="-nightly" ( set _NIGHTLY=1
    ) else if "%__ARG%"=="-verbose" ( set _VERBOSE=1
    ) else (
        echo %_ERROR_LABEL% Unknown option "%__ARG%" 1>&2
        set _EXITCODE=1
        goto args_done
   )
) else (
    @rem subcommand
    if "%__ARG%"=="clean" ( set _COMMANDS=!_COMMANDS! clean
    ) else if "%__ARG%"=="compile" ( set _COMMANDS=!_COMMANDS! compile
    ) else if "%__ARG%"=="doc" ( set _COMMANDS=!_COMMANDS! doc
    ) else if "%__ARG%"=="help" ( set _HELP=1
    ) else if "%__ARG%"=="run" ( set _COMMANDS=!_COMMANDS! compile run
    ) else if "%__ARG%"=="test" ( set _COMMANDS=!_COMMANDS! test_compile test
    ) else (
        echo %_ERROR_LABEL% Unknown subcommand "%__ARG%" 1>&2
        set _EXITCODE=1
        goto args_done
    )
    set /a __N+=1
)
shift
goto args_loop
:args_done
for %%i in ("%_ROOT_DIR:~0,-1%") do set "_PROJECT_NAME=%%~ni"

set "_BUILD_DIR=%_TARGET_DIR%\%_PROJECT_NAME%"
@rem Starting with version 0.35.0 Flix generates the jar file into directory 'artifact'.
set "_MAIN_JAR_FILE=%_BUILD_DIR%\artifact\%_PROJECT_NAME%.jar"
set "_MAIN_JAR_TEST_FILE=%_BUILD_DIR%\%_PROJECT_NAME%.jar-test.txt"

set _STDERR_REDIRECT=2^>NUL
if %_DEBUG%==1 set _STDERR_REDIRECT=

if %_NIGHTLY%==1 (
    set __NIGHTLY_JAR=
    for /f "delims=" %%i in ('dir /b /a-d "%FLIX_HOME%\flix-*.jar" 2^>NUL') do (
        set "__NIGHTLY_JAR=%%i"
    )
    if defined __NIGHTLY_JAR (
        if %_DEBUG%==1 ( echo %_DEBUG_LABEL% Nightly build "!__NIGHTLY_JAR!" was selected 1>&2
        ) else if %_VERBOSE%==1 ( echo Nightly build "!__NIGHTLY_JAR!" was selected 1>&2
        )
        set "_FLIX_JAR=%FLIX_HOME%\!__NIGHTLY_JAR!"
    ) else (
        set _NIGHTLY=0
        echo %_WARNING_LABEL% Nightly build of Flix not found ^(use release version instead^) 1>&2
        echo          It can be downloaded from https://flix.dev/nightly/. 1>&2
    )
)
if %_DEBUG%==1 (
    echo %_DEBUG_LABEL% Properties : _PROJECT_NAME=%_PROJECT_NAME% 1>&2
    echo %_DEBUG_LABEL% Options    : _NIGHTLY=%_NIGHTLY% _VERBOSE=%_VERBOSE% 1>&2
    echo %_DEBUG_LABEL% Subcommands: _COMMANDS=%_COMMANDS% 1>&2
    echo %_DEBUG_LABEL% Variables  : "FLIX_HOME=%FLIX_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : "JAVA_HOME=%JAVA_HOME%" 1>&2
    echo %_DEBUG_LABEL% Variables  : "SCALA_HOME=%SCALA_HOME%" 1>&2
)
goto :eof

:help
if %_VERBOSE%==1 (
    set __BEG_P=%_STRONG_FG_CYAN%
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
echo     %__BEG_O%-debug%__END%      print commands executed by this script
echo     %__BEG_O%-nightly%__END%    use latest Flix nightly build if locally available
echo     %__BEG_O%-verbose%__END%    print progress messages
echo.
echo   %__BEG_P%Subcommands:%__END%
echo     %__BEG_O%clean%__END%       delete generated files
echo     %__BEG_O%compile%__END%     generate class files
echo     %__BEG_O%doc%__END%         generate API documentation
echo     %__BEG_O%help%__END%        print this help message
echo     %__BEG_O%run%__END%         execute the generated program "%__BEG_N%!_MAIN_JAR_FILE:%_BUILD_DIR%\=!%__END%"
echo     %__BEG_O%test%__END%        execute unit tests
goto :eof

:clean
call :rmdir "%_TARGET_DIR%"
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
    echo %_ERROR_LABEL% Failed to delete directory "!__DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:compile
if not exist "%_BUILD_DIR%\" mkdir "%_BUILD_DIR%"

call :action_required "%_MAIN_JAR_FILE%" "%_SOURCE_MAIN_DIR%\*.flix"
if %_ACTION_REQUIRED%==0 goto :eof

set __N=0
for /f "delims=" %%f in ('dir /s /b "%_SOURCE_MAIN_DIR%\*.flix" 2^>NUL') do (
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Flix source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Flix source file
) else ( set __N_FILES=%__N% Flix source files
)
pushd "%_BUILD_DIR%"
if not exist "%_BUILD_DIR%\build" (
    if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" -jar "%_FLIX_JAR%" init 1>&2
    ) else if %_VERBOSE%==1 ( echo Initialize Flix project directory "!_BUILD_DIR:%_ROOT_DIR%=!" 1>&2
    )
    call "%_JAVA_CMD%" -jar "%_FLIX_JAR%" init
    if not !ERRORLEVEL!==0 (
        popd
        echo %_ERROR_LABEL% Failed to initialize Flix project directory "!_BUILD_DIR:%_ROOT_DIR%=!" 1>&2
        set _EXITCODE=1
        goto :eof
    )
)
if exist "%_BUILD_DIR%\src\*.flix" del /q "%_BUILD_DIR%\src\*.flix"
if exist "%_BUILD_DIR%\test\*.flix" del /q "%_BUILD_DIR%\test\*.flix"

@rem xcopy must be called AFTER flix init
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% xcopy /s /y "%_SOURCE_MAIN_DIR%" "%_BUILD_DIR%\src\" 1^>NUL 1>&2
) else if %_VERBOSE%==1 ( echo Copy %__N_FILES% to directory "!_BUILD_DIR:%_ROOT_DIR%=!\src\" 1>&2
)
xcopy /s /y "%_SOURCE_MAIN_DIR%" "%_BUILD_DIR%\src\" 1>NUL
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to copy %__N_FILES% to directory "!_BUILD_DIR:%_ROOT_DIR%=!\src\" 1>&2
    set _EXITCODE=1
    goto :eof
)
call :compile_lib
if not %_EXITCODE%==0 popd & goto :eof

set __JAVA_OPTS=-cp "%_BUILD_DIR%\lib;%_BUILD_DIR%\build"
set __BUILD_OPTS=
if %_DEBUG%==1 ( set __BUILD_OPTS=%__BUILD_OPTS% --explain
) else if %_VERBOSE%==1 ( set __BUILD_OPTS=%__BUILD_OPTS% --explain
)
if not "!_COMMANDS:doc=!"=="%_COMMANDS%" set __BUILD_OPTS=%__BUILD_OPTS% --doc

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" %__JAVA_OPTS% -jar "%_FLIX_JAR%" build %__BUILD_OPTS% 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% into directory "!_BUILD_DIR:%_ROOT_DIR%=!\build\" 1>&2
)
call "%_JAVA_CMD%" %__JAVA_OPTS% -jar "%_FLIX_JAR%" build %__BUILD_OPTS%
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% into directory "!_BUILD_DIR:%_ROOT_DIR%=!\build\" 1>&2
    set _EXITCODE=1
    goto :eof
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" -jar "%_FLIX_JAR%" build-jar 1>&2
) else if %_VERBOSE%==1 ( echo Create archive file "!_MAIN_JAR_FILE:%_ROOT_DIR%=!" 1>&2
)
call "%_JAVA_CMD%" -jar "%_FLIX_JAR%" build-jar
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to create archive file "!_MAIN_JAR_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
popd
goto :eof

:compile_lib
if not exist "%_BUILD_DIR%\lib" mkdir "%_BUILD_DIR%\lib"

set __SOURCE_FILES=
set __N=0
for /f "delims=" %%f in ('dir /s /b "%_BUILD_DIR%\src\*.scala" 2^>NUL') do (
    set __SOURCE_FILES=%__SOURCE_FILES% "%%f"
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Scala source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_SCALA_FILES=%__N% Scala source file
) else ( set __N_SCALA_FILES=%__N% Scala source files
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_SCALAC_CMD%" -cp "%_FLIX_JAR%" -d "%_BUILD_DIR%\lib" %__SOURCE_FILES% 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_SCALA_FILES% to directory "!_BUILD_DIR:%_ROOT_DIR%=!" 1>&2
)
call "%_SCALAC_CMD%" -cp "%_FLIX_JAR%" -d "%_BUILD_DIR%\lib" %__SOURCE_FILES%
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to compile %__N_SCALA_FILES% to directory "!_BUILD_DIR:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
set "__LIBRARY_JAR=%_BUILD_DIR%\lib\lib-%_PROJECT_NAME%.jar"

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAR_CMD%" cf "%__LIBRARY_JAR%" -C "%_BUILD_DIR%\lib" .
) else if %_VERBOSE%==1 ( echo Create Java archive file "!__LIBRARY_JAR:%_ROOT_DIR%=!" 1>&2
)
call "%_JAR_CMD%" cf "%__LIBRARY_JAR%" -C "%_BUILD_DIR%\lib" .
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to create Java archive file "!__LIBRARY_JAR:%_ROOT_DIR%=!" 1>&2
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
set __PATH=%~1
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

:run
set __BOOT_CPATH=
for /f "delims=" %%f in ('dir /s /b "%_BUILD_DIR%\lib\*.jar" 2^>NUL') do (
    set "__BOOT_CPATH=%__BOOT_CPATH%%%f;"
)
set __JAVA_OPTS=
if defined __BOOT_CPATH set __JAVA_OPTS="-Xbootclasspath/a:%__BOOT_CPATH%" %__JAVA_OPTS%

set __MAIN_ARGS=

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" %__JAVA_OPTS% -jar "%_MAIN_JAR_FILE%" %__MAIN_ARGS% 1>&2
) else if %_VERBOSE%==1 ( echo Execute Flix program "!_MAIN_JAR_FILE:%_ROOT_DIR%=!" 1>&2
)
call "%_JAVA_CMD%" %__JAVA_OPTS% -jar "%_MAIN_JAR_FILE%" %__MAIN_ARGS%
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to execute Flix program "!_MAIN_JAR_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:test_compile
if not exist "%_BUILD_DIR%\" mkdir "%_BUILD_DIR%"

if not exist "%_MAIN_JAR_TEST_FILE%" goto test_next

call :action_required "%_MAIN_JAR_TEST_FILE%" "%_SOURCE_MAIN_DIR%\*.flix"
if %_ACTION_REQUIRED%==1 goto test_next

call :action_required "%_MAIN_JAR_TEST_FILE%" "%_SOURCE_TEST_DIR%\*.flix"
if %_ACTION_REQUIRED%==0 goto :eof

:test_next
set __N=0
for /f "delims=" %%f in ('dir /s /b "%_SOURCE_MAIN_DIR%\*.flix" 2^>NUL') do (
    set /a __N+=1
)
if %__N%==0 (
    echo %_WARNING_LABEL% No Flix source file found 1>&2
    goto :eof
) else if %__N%==1 ( set __N_FILES=%__N% Flix source file
) else ( set __N_FILES=%__N% Flix source files
)
set __N_TEST=0
for /f "delims=" %%f in ('dir /s /b "%_SOURCE_TEST_DIR%\*.flix" 2^>NUL') do (
    set /a __N_TEST+=1
)
if %__N_TEST%==0 (
    echo %_WARNING_LABEL% No Flix test source file found 1>&2
    goto :eof
) else if %__N_TEST%==1 ( set __N_TEST_FILES=%__N_TEST% Flix test source file
) else ( set __N_TEST_FILES=%__N_TEST% Flix test source files
)
pushd "%_BUILD_DIR%"
if not exist "%_BUILD_DIR%\build" (
    if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" -jar "%_FLIX_JAR%" init 1>&2
    ) else if %_VERBOSE%==1 ( echo Initialize Flix project directory "!_BUILD_DIR:%_ROOT_DIR%=!" 1>&2
    )
    call "%_JAVA_CMD%" -jar "%_FLIX_JAR%" init
)
@rem xcopy must be called AFTER flix init
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% xcopy /s /y "%_SOURCE_MAIN_DIR%" "%_BUILD_DIR%\src\" 1^>NUL 1>&2
) else if %_VERBOSE%==1 ( echo Copy %__N_FILES% to directory "!_BUILD_DIR:%_ROOT_DIR%=!\src\" 1>&2
)
xcopy /s /y "%_SOURCE_MAIN_DIR%" "%_BUILD_DIR%\src\" 1>NUL
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to copy %__N_FILES% to directory "!_BUILD_DIR:%_ROOT_DIR%=!\src\" 1>&2
    set _EXITCODE=1
    goto :eof
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% xcopy /s /y "%_SOURCE_TEST_DIR%" "%_BUILD_DIR%\test\" 1^>NUL 1>&2
) else if %_VERBOSE%==1 ( echo Copy %__N_TEST_FILES% to directory "!_BUILD_DIR:%_ROOT_DIR%=!\test\" 1>&2
)
xcopy /s /y "%_SOURCE_TEST_DIR%" "%_BUILD_DIR%\test\" 1>NUL
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to copy %__N_TEST_FILES% to directory "!_BUILD_DIR:%_ROOT_DIR%=!\test\" 1>&2
    set _EXITCODE=1
    goto :eof
)
call :compile_lib
if not %_EXITCODE%==0 popd& goto :eof

set __JAVA_OPTS=
set __BUILD_OPTS=
if %_DEBUG%==1 ( set __BUILD_OPTS=--explain
) else if %_VERBOSE%==1 ( set __BUILD_OPTS=--explain
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" %__JAVA_OPTS% -jar "%_FLIX_JAR%" build %__BUILD_OPTS% 1>&2
) else if %_VERBOSE%==1 ( echo Compile %__N_FILES% and %__N_TEST_FILES% 1>&2
)
call "%_JAVA_CMD%" %__JAVA_OPTS% -jar "%_FLIX_JAR%" build %__BUILD_OPTS%
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to compile %__N_FILES% and %__N_TEST_FILES% 1>&2
    set _EXITCODE=1
    goto :eof
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" -jar "%_FLIX_JAR%" build-jar 1>&2
) else if %_VERBOSE%==1 ( echo Create archive file "!_MAIN_JAR_FILE:%_ROOT_DIR%=!" 1>&2
)
call "%_JAVA_CMD%" -jar "%_FLIX_JAR%" build-jar
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to create archive file "!_MAIN_JAR_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
popd
echo >"%_MAIN_JAR_TEST_FILE%"
goto :eof

:test
set __BOOT_CPATH=
for /f "delims=" %%f in ('dir /s /b "%_BUILD_DIR%\lib\*.jar" 2^>NUL') do (
    set "__BOOT_CPATH=%__BOOT_CPATH%%%f;"
)
set __JAVA_OPTS=
if defined __BOOT_CPATH set __JAVA_OPTS="-Xbootclasspath/a:%__BOOT_CPATH%" %__JAVA_OPTS%

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% "%_JAVA_CMD%" %__JAVA_OPTS% -jar "%_FLIX_JAR%" test 1>&2
) else if %_VERBOSE%==1 ( echo Execute tests for Flix program "!_MAIN_JAR_FILE:%_ROOT_DIR%=!" 1>&2
)
pushd "%_BUILD_DIR%"
call "%_JAVA_CMD%" %__JAVA_OPTS% -jar "%_FLIX_JAR%" test
if not %ERRORLEVEL%==0 (
    popd
    echo %_ERROR_LABEL% Failed to execute tests for Flix program "!_MAIN_JAR_FILE:%_ROOT_DIR%=!" 1>&2
    set _EXITCODE=1
    goto :eof
)
popd
goto :eof

@rem #########################################################################
@rem ## Cleanups

:end
if %_DEBUG%==1 echo %_DEBUG_LABEL% _EXITCODE=%_EXITCODE% 1>&2
exit /b %_EXITCODE%
endlocal
