@echo off
setlocal enabledelayedexpansion

@rem only for interactive debugging
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

set _GIT_PATH=
set _GRADLE_PATH=
set _MAKE_PATH=
set _MDBOOK_PATH=

@rem Flix requires Java 11 or newer
call :java11
if not %_EXITCODE%==0 goto end

call :scala2
if not %_EXITCODE%==0 goto end

call :flix
if not %_EXITCODE%==0 goto end

call :flix_nightly
if not %_EXITCODE%==0 (
    @rem Local nighlty build is optional
    set _EXITCODE=0
    @rem goto end
)
call :git
if not %_EXITCODE%==0 goto end

call :gradle
if not %_EXITCODE%==0 goto end

call :make
if not %_EXITCODE%==0 goto end

call :mdbook
if not %_EXITCODE%==0 (
    @rem optional
    echo %_WARNING_LABEL% mdBook installation not found 1>&2
    set _EXITCODE=0
)
call :msys
if not %_EXITCODE%==0 (
    @rem optional
    echo %_WARNING_LABEL% MSYS2 installation not found 1>&2
    set _EXITCODE=0
)
goto end

@rem #########################################################################
@rem ## Subroutines

@rem output parameters: _DEBUG_LABEL, _ERROR_LABEL, _WARNING_LABEL
:env
set _BASENAME=%~n0
set _DRIVE_NAME=F
set "_ROOT_DIR=%~dp0"

call :env_colors
set _DEBUG_LABEL=%_NORMAL_BG_CYAN%[%_BASENAME%]%_RESET%
set _ERROR_LABEL=%_STRONG_FG_RED%Error%_RESET%:
set _WARNING_LABEL=%_STRONG_FG_YELLOW%Warning%_RESET%:
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
set _BASH=0
set _HELP=0
set _MSYS=0
set _VERBOSE=0
set __N=0
:args_loop
set "__ARG=%~1"
if not defined __ARG goto args_done

if "%__ARG:~0,1%"=="-" (
    @rem option
    if "%__ARG%"=="-bash" ( set _MSYS=0& set _BASH=1
    ) else if "%__ARG%"=="-debug" ( set _DEBUG=1
    ) else if "%__ARG%"=="-verbose" ( set _VERBOSE=1
    ) else (
        echo %_ERROR_LABEL% Unknown option %__ARG% 1>&2
        set _EXITCODE=1
        goto args_done
    )
) else (
    @rem subcommand
    if "%__ARG%"=="help" ( set _HELP=1
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
call :subst %_DRIVE_NAME% "%_ROOT_DIR%"
if not %_EXITCODE%==0 goto :eof

set _STDERR_REDIRECT=2^>NUL
if %_DEBUG%==1 set _STDERR_REDIRECT=

if %_DEBUG%==1 (
    echo %_DEBUG_LABEL% Options    : _VERBOSE=%_VERBOSE% 1>&2
    echo %_DEBUG_LABEL% Subcommands: _HELP=%_HELP% 1>&2
    echo %_DEBUG_LABEL% Variables  : _DRIVE_NAME=%_DRIVE_NAME% 1>&2
)
goto :eof

@rem input parameters: %1: drive letter, %2: path to be substituted
:subst
set __DRIVE_NAME=%~1
set "__GIVEN_PATH=%~2"

if not "%__DRIVE_NAME:~-1%"==":" set __DRIVE_NAME=%__DRIVE_NAME%:
if /i "%__DRIVE_NAME%"=="%__GIVEN_PATH:~0,2%" goto :eof

if "%__GIVEN_PATH:~-1%"=="\" set "__GIVEN_PATH=%__GIVEN_PATH:~0,-1%"
if not exist "%__GIVEN_PATH%" (
    echo %_ERROR_LABEL% Provided path does not exist ^(%__GIVEN_PATH%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
for /f "tokens=1,2,*" %%f in ('subst ^| findstr /b "%__DRIVE_NAME%" 2^>NUL') do (
    set "__SUBST_PATH=%%h"
    if "!__SUBST_PATH!"=="!__GIVEN_PATH!" (
        set __MESSAGE=
        for /f %%i in ('subst ^| findstr /b "%__DRIVE_NAME%\"') do "set __MESSAGE=%%i"
        if defined __MESSAGE (
            if %_DEBUG%==1 ( echo %_DEBUG_LABEL% !__MESSAGE! 1>&2
            ) else if %_VERBOSE%==1 ( echo !__MESSAGE! 1>&2
            )
        )
        goto :eof
    )
)
if %_DEBUG%==1 ( echo %_DEBUG_LABEL% subst "%__DRIVE_NAME%" "%__GIVEN_PATH%" 1>&2
) else if %_VERBOSE%==1 ( echo Assign path %__GIVEN_PATH% to drive %__DRIVE_NAME% 1>&2
)
subst "%__DRIVE_NAME%" "%__GIVEN_PATH%"
if not %ERRORLEVEL%==0 (
    echo %_ERROR_LABEL% Failed to assigne drive %__DRIVE_NAME% to path 1>&2
    set _EXITCODE=1
    goto :eof
)
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
echo     %__BEG_O%-debug%__END%      display commands executed by this script
echo     %__BEG_O%-verbose%__END%    display environment settings
echo.
echo   %__BEG_P%Subcommands:%__END%
echo     %__BEG_O%help%__END%        display this help message
goto :eof

@rem output parameter: _JAVA_HOME
:java11
set _JAVA_HOME=

set __JAVA_DISTRO=temurin
set __JAVAC_CMD=
for /f %%f in ('where javac.exe 2^>NUL') do set "__JAVAC_CMD=%%f"
@rem ignore command if Java version is not 11
if defined __JAVAC_CMD (
    for /f "tokens=1,*" %%i in ('"%__JAVAC_CMD%" -version') do (
        set __JAVAC_VERSION=%%j
        if "!__JAVAC_VERSION:11.=!"=="!__JAVAC_VERSION!" (
            echo "%_WARNING_LABEL% Expected: Java 11 executable, found: !__JAVAC_VERSION! 1>&2
            set __JAVAC_CMD=
        )
    )
)
if defined __JAVAC_CMD (
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of javac executable found in PATH 1>&2
    for %%i in ("%__JAVAC_CMD%") do set "__JAVA_BIN_DIR=%%~dpi"
    for %%f in ("!__JAVA_BIN_DIR!\.") do set "_JAVA_HOME=%%~dpf"
    goto :eof
) else if defined JAVA_HOME (
    set "_JAVA_HOME=%JAVA_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable JAVA_HOME 1>&2
) else (
    set __PATH=C:\opt
    for /f %%f in ('dir /ad /b "!__PATH!\jdk-%__JAVA_DISTRO%-11*" 2^>NUL') do set "_JAVA_HOME=!__PATH!\%%f"
    if not defined _JAVA_HOME (
        set "__PATH=%ProgramFiles%"
        for /f "delims=" %%f in ('dir /ad /b "!__PATH!\jdk-%__JAVA_DISTRO%-11*" 2^>NUL') do set "_JAVA_HOME=!__PATH!\%%f"
    )
)
if not exist "%_JAVA_HOME%\bin\javac.exe" (
    echo %_ERROR_LABEL% Executable javac.exe not found ^(%_JAVA_HOME%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem output parameter: _SCALA_HOME
:scala2
set _SCALA_HOME=

set __SCALAC_CMD=
for /f %%f in ('where scalac.bat 2^>NUL') do (
    set __VERSION=
    for /f "tokens=1,2,3,4,*" %%i in ('scalac.bat -version 2^>^&1') do set "__VERSION=%%l"
    if defined __VERSION if "!__VERSION:~0,1!"=="2" set "__SCALAC_CMD=%%f"
)
if defined __SCALAC_CMD (
    for %%i in ("%__SCALAC_CMD%") do set "__SCALA_BIN_DIR=%%~dpi"
    for %%f in ("!__SCALA_BIN_DIR!..") do set "_SCALA_HOME=%%f"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of Scala 2 executable found in PATH 1>&2
    goto :eof
) else if defined SCALA_HOME (
    set "_SCALA_HOME=%SCALA_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable SCALA_HOME 1>&2
) else (
    set _PATH=C:\opt
    for /f %%f in ('dir /ad /b "!_PATH!\scala-2*" 2^>NUL') do set _SCALA_HOME=!_PATH!\%%f
    if defined _SCALA_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default Scala 2 installation directory !_SCALA_HOME!
    )
)
if not exist "%_SCALA_HOME%\bin\scalac.bat" (
    echo %_ERROR_LABEL% Scala executable not found ^(%_SCALA_HOME%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

@rem output parameters: _FLIX_HOME
:flix
set _FLIX_HOME=

if defined FLIX_HOME (
    set "_FLIX_HOME=%FLIX_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable FLIX_HOME 1>&2
) else (
    set _PATH=C:\opt
    for /f %%f in ('dir /ad /b "!_PATH!\flix-*" 2^>NUL') do set "_FLIX_HOME=!_PATH!\%%f"
    if defined _FLIX_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default Flix installation directory "!_FLIX_HOME!"
    )
)
if not exist "%_FLIX_HOME%\flix.jar" (
    echo %_ERROR_LABEL% Flix archive not found ^(%_FLIX_HOME%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:flix_nightly
if not exist "%_FLIX_HOME%" goto :eof

for /f %%i in ('powershell -C "(Get-Date).addHours(-18).ToString('yyyy-MM-dd')"') do (
    set "__JAR_NAME=flix-%%i.jar"
)
set "__JAR_FILE=%_FLIX_HOME%\%__JAR_NAME%"
if exist "%__JAR_FILE%" goto :eof

set "__JAR_URL=https://flix.dev/nightly/%__JAR_NAME%"

if %_DEBUG%==1 ( echo %_DEBUG_LABEL% powershell -c "Invoke-WebRequest -Uri '%__JAR_URL%' -Outfile '%__JAR_FILE%'" 1>&2
) else if %_VERBOSE%==1 ( echo Download file "%__JAR_NAME%" to directory "%_FLIX_HOME%" 1>&2
)
powershell -c "$progressPreference='silentlyContinue';Invoke-WebRequest -Uri '%__JAR_URL%' -Outfile '%__JAR_FILE%'" %_STDERR_REDIRECT%
if not %ERRORLEVEL%==0 (
    echo %_WARNING_LABEL% Failed to download file "%__JAR_URL%" to directory "%_FLIX_HOME%" 1>&2
    set _EXITCODE=1
    goto :eof
)
@rem delete Flix nightly builds older than 5 days
forfiles /d -5 /p "%_FLIX_HOME%" /m flix-*.jar /c "cmd /c del @path" 2>NUL
goto :eof

@rem output parameters: _GIT_HOME, _GIT_PATH
:git
set _GIT_HOME=
set _GIT_PATH=

set __GIT_CMD=
for /f %%f in ('where git.exe 2^>NUL') do set "__GIT_CMD=%%f"
if defined __GIT_CMD (
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of Git executable found in PATH 1>&2
    @rem keep _GIT_PATH undefined since executable already in path
    goto :eof
) else if defined GIT_HOME (
    set "_GIT_HOME=%GIT_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable GIT_HOME 1>&2
) else (
    set __PATH=C:\opt
    if exist "!__PATH!\Git\" ( set "_GIT_HOME=!__PATH!\Git"
    ) else (
        for /f %%f in ('dir /ad /b "!__PATH!\Git*" 2^>NUL') do set "_GIT_HOME=!__PATH!\%%f"
        if not defined _GIT_HOME (
            set "__PATH=%ProgramFiles%"
            for /f %%f in ('dir /ad /b "!__PATH!\Git*" 2^>NUL') do set "_GIT_HOME=!__PATH!\%%f"
        )
    )
)
if not exist "%_GIT_HOME%\bin\git.exe" (
    echo %_ERROR_LABEL% Git executable not found ^(%_GIT_HOME%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_GIT_PATH=;%_GIT_HOME%\bin;%_GIT_HOME%\mingw64\bin;%_GIT_HOME%\usr\bin"
goto :eof

@rem output parameters: _GRADLE_HOME, _GRADLE_PATH
:gradle
set _GRADLE_HOME=
set _GRADLE_PATH=

set __GRADLE_CMD=
for /f %%f in ('where gradle.bat 2^>NUL') do set "__GRADLE_CMD=%%f"
if defined __GRADLE_CMD (
    for %%i in ("%__GRADLE_CMD%") do set "__GRADLE_BIN_DIR=%%~dpi"
    for %%f in ("!__GRADLE_BIN_DIR!\.") do set "_GRADLE_HOME=%%~dpf"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of Gradle executable found in PATH 1>&2
    goto :eof
) else if defined GRADLE_HOME (
    set "_GRADLE_HOME=%GRADLE_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable GRADLE_HOME 1>&2
) else (
    set __PATH=C:\opt
    if exist "!__PATH!\gradle\" ( set "_GRADLE_HOME=!__PATH!\gradle"
    ) else (
        for /f %%f in ('dir /ad /b "!__PATH!\gradle-*" 2^>NUL') do set "_GRADLE_HOME=!__PATH!\%%f"
        if not defined _GRADLE_HOME (
            set "__PATH=%ProgramFiles%"
            for /f %%f in ('dir /ad /b "!__PATH!\gradle-*" 2^>NUL') do set "_GRADLE_HOME=!__PATH!\%%f"
        )
    )
    if defined _GRADLE_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default Gradle installation directory !_GRADLE_HOME! 1>&2
    )
)
if not exist "%_GRADLE_HOME%\bin\gradle.bat" (
    echo %_ERROR_LABEL% Gradle executable not found ^(%_GRADLE_HOME%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_GRADLE_PATH=;%_GRADLE_HOME%\bin"
goto :eof

@rem output parameters: _MAKE_HOME, _MAKE_PATH
:make
set _MAKE_HOME=
set _MAKE_PATH=

set __MAKE_CMD=
for /f %%f in ('where make.exe 2^>NUL') do set "__MAKE_CMD=%%f"
if defined __MAKE_CMD (
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of Make executable found in PATH 1>&2
    rem keep _MAKE_PATH undefined since executable already in path
    goto :eof
) else if defined MAKE_HOME (
    set "_MAKE_HOME=%MAKE_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable MAKE_HOME 1>&2
) else (
    set _PATH=C:\opt
    for /f %%f in ('dir /ad /b "!_PATH!\make-3*" 2^>NUL') do set "_MAKE_HOME=!_PATH!\%%f"
    if defined _MAKE_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default Make installation directory !_MAKE_HOME! 1>&2
    )
)
if not exist "%_MAKE_HOME%\bin\make.exe" (
    echo %_ERROR_LABEL% Make executable not found ^(%_MAKE_HOME%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_MAKE_PATH=;%_MAKE_HOME%\bin"
goto :eof

@rem output parameters: _MDBOOK_HOME, _MDBOOK_PATH
:mdbook
set _MDBOOK_HOME=
set _MDBOOK_PATH=

set __MDBOOK_CMD=
for /f %%f in ('where mdbook.exe 2^>NUL') do set "__MDBOOK_CMD=%%f"
if defined __MDBOOK_CMD (
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of mdBook executable found in PATH 1>&2
    @rem keep _MAKE_PATH undefined since executable already in path
    goto :eof
) else if defined MDBOOK_HOME (
    set "_MDBOOK_HOME=%MDBOOK_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable MDBOOK_HOME 1>&2
) else (
    set _PATH=C:\opt
    for /f %%f in ('dir /ad /b "!_PATH!\mdbook-*" 2^>NUL') do set "_MDBOOK_HOME=!_PATH!\%%f"
    if defined _MDBOOK_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default mdBook installation directory !_MDBOOK_HOME! 1>&2
    )
)
if not exist "%_MDBOOK_HOME%\mdbook.exe" (
    echo %_ERROR_LABEL% mdBook executable not found ^(%_MDBOOK_HOME%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
set "_MDBOOK_PATH=;%_MDBOOK_HOME%"
goto :eof

@rem output parameter: _MSYS_HOME
:msys
set _MSYS_HOME=

set __MSYS2_CMD=
for /f %%f in ('where msy2_shell.cmd 2^>NUL') do set "__MSYS2_CMD=%%f"
if defined __MSYS2_CMD (
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using path of msys2 command found in PATH 1>&2
    goto :eof
) else if defined MSYS_HOME (
    set "_MSYS_HOME=%MSYS_HOME%"
    if %_DEBUG%==1 echo %_DEBUG_LABEL% Using environment variable MSYS_HOME 1>&2
) else (
    set _PATH=C:\opt
    for /f %%f in ('dir /ad /b "!_PATH!\msys64*" 2^>NUL') do set "_MSYS_HOME=!_PATH!\%%f"
    if defined _MSYS_HOME (
        if %_DEBUG%==1 echo %_DEBUG_LABEL% Using default MSYS2 installation directory !_MSYS_HOME! 1>&2
    )
)
if not exist "%_MSYS_HOME%\msys2_shell.cmd" if %_MSYS%==1 (
    set _MSYS=0
    echo %_ERROR_LABEL% MSYS2 command not found ^(%_MSYS_HOME%^) 1>&2
    set _EXITCODE=1
    goto :eof
)
goto :eof

:print_env
set __VERBOSE=%1
set "__VERSIONS_LINE1=  "
set "__VERSIONS_LINE2=  "
set __WHERE_ARGS=
where /q "%JAVA_HOME%\bin:java.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,2,3,*" %%i in ('"%JAVA_HOME%\bin\java.exe" -version 2^>^&1 ^| findstr version') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% java %%~k,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%JAVA_HOME%\bin:java.exe"
)
where /q "%JAVA_HOME%\bin:javac.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,*" %%i in ('"%JAVA_HOME%\bin\javac.exe" -version') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% javac %%~j,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%JAVA_HOME%\bin:javac.exe"
)
where /q "%SCALA_HOME%\bin:scalac.bat"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,2,3,4,*" %%i in ('"%SCALA_HOME%\bin\scalac.bat" -version') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% scalac %%l,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%SCALA_HOME%\bin:scalac.bat"
)
where /q "%FLIX_HOME%:flix.jar"
if %ERRORLEVEL%==0 (
    for /f "tokens=1-4,*" %%i in ('call "%JAVA_HOME%\bin\java.exe" -jar "%FLIX_HOME%\flix.jar" --version') do set "__VERSIONS_LINE1=%__VERSIONS_LINE1% flix %%m"
)
where /q "%GIT_HOME%\bin:git.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,2,*" %%i in ('"%GIT_HOME%\bin\git.exe" --version') do set "__VERSIONS_LINE2=%__VERSIONS_LINE2% git %%k,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%GIT_HOME%\bin:git.exe"
)
where /q diff.exe
if %ERRORLEVEL%==0 (
   for /f "tokens=1-3,*" %%i in ('diff.exe --version ^| findstr /B diff') do set "__VERSIONS_LINE2=%__VERSIONS_LINE2% diff %%l,"
    set __WHERE_ARGS=%__WHERE_ARGS% diff.exe
)
where /q "%GRADLE_HOME%\bin:gradle.bat"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,*" %%i in ('"%GRADLE_HOME%\bin\gradle.bat" -version ^| findstr Gradle') do set "__VERSIONS_LINE2=%__VERSIONS_LINE2% gradle %%j"
    set __WHERE_ARGS=%__WHERE_ARGS% "%GRADLE_HOME%\bin:gradle.bat"
)
where /q "%MAKE_HOME%\bin:make.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,2,*" %%i in ('"%MAKE_HOME%\bin\make.exe" --version 2^>^&1 ^| findstr Make') do set "__VERSIONS_LINE2=%__VERSIONS_LINE2% make %%k,"
    set __WHERE_ARGS=%__WHERE_ARGS% "%MAKE_HOME%\bin:make.exe"
)
where /q "%MDBOOK_HOME%:mdbook.exe"
if %ERRORLEVEL%==0 (
    for /f "tokens=1,*" %%i in ('"%MDBOOK_HOME%\mdbook.exe" --version') do set "__VERSIONS_LINE2=%__VERSIONS_LINE2% mdbook %%j"
    set __WHERE_ARGS=%__WHERE_ARGS% "%MDBOOK_HOME%:mdbook.exe"
)
echo Tool versions:
echo %__VERSIONS_LINE1%
echo %__VERSIONS_LINE2%
if %__VERBOSE%==1 if defined __WHERE_ARGS (
    @rem if %_DEBUG%==1 echo %_DEBUG_LABEL% where %__WHERE_ARGS%
    echo Tool paths: 1>&2
    for /f "tokens=*" %%p in ('where %__WHERE_ARGS%') do echo    %%p 1>&2
    echo Environment variables: 1>&2
    if defined FLIX_HOME echo    "FLIX_HOME=%FLIX_HOME%" 1>&2
    if defined GIT_HOME echo    "GIT_HOME=%GIT_HOME%" 1>&2
    if defined GRADLE_HOME echo    "GRADLE_HOME=%GRADLE_HOME%" 1>&2
    if defined JAVA_HOME echo    "JAVA_HOME=%JAVA_HOME%" 1>&2
    if defined MAKE_HOME echo    "MAKE_HOME=%MAKE_HOME%" 1>&2
    if defined MDBOOK_HOME echo    "MDBOOK_HOME=%MDBOOK_HOME%" 1>&2
    if defined SCALA_HOME echo    "SCALA_HOME=%SCALA_HOME%" 1>&2
    echo Path associations: 1>&2
    for /f "delims=" %%i in ('subst') do echo %%i
)
goto :eof

@rem #########################################################################
@rem ## Cleanups

:end
endlocal & (
    if %_EXITCODE%==0 (
        if not defined FLIX_HOME set "FLIX_HOME=%_FLIX_HOME%"
        if not defined GIT_HOME set "GIT_HOME=%_GIT_HOME%"
        if not defined GRADLE_HOME set "GRADLE_HOME=%_GRADLE_HOME%"
        if not defined JAVA_HOME set "JAVA_HOME=%_JAVA_HOME%"
        if not defined MAKE_HOME set "MAKE_HOME=%_MAKE_HOME%"
        if not defined MDBOOK_HOME set "MDBOOK_HOME=%_MDBOOK_HOME%"
        if not defined MSYS_HOME set "MSYS_HOME=%_MSYS_HOME%"
        if not defined SCALA_HOME set "SCALA_HOME=%_SCALA_HOME%"
        @rem We prepend %_GIT_HOME%\bin to hide C:\Windows\System32\bash.exe
        set "PATH=%_GIT_HOME%\bin;%PATH%%_GRADLE_PATH%%_MAKE_PATH%%_MDBOOK_PATH%%_GIT_PATH%;%~dp0bin"
        call :print_env %_VERBOSE%
        if not "%CD:~0,2%"=="%_DRIVE_NAME%:" (
            if %_DEBUG%==1 echo %_DEBUG_LABEL% cd /d %_DRIVE_NAME%: 1>&2
            cd /d %_DRIVE_NAME%:
        )
        if %_BASH%==1 (
            @rem see https://conemu.github.io/en/GitForWindows.html
            if %_DEBUG%==1 echo %_DEBUG_LABEL% %_GIT_HOME%\usr\bin\bash.exe --login 1>&2
            cmd.exe /c "%_GIT_HOME%\usr\bin\bash.exe --login"
        ) else if %_MSYS%==1 (
            if %_DEBUG%==1 echo %_DEBUG_LABEL% "%_MSYS_HOME%\msys2_shell.cmd -mingw64 -where %_DRIVE_NAME%:" 1>&2
            cmd.exe /c "%_MSYS_HOME%\msys2_shell.cmd -mingw64 -where %_DRIVE_NAME%:"
        )
    )
    if %_DEBUG%==1 echo %_DEBUG_LABEL% _EXITCODE=%_EXITCODE% 1>&2
    for /f "delims==" %%i in ('set ^| findstr /b "_"') do set %%i=
)
