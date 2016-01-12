@echo off

set prefix="C:\Program Files\Fraqtive"
set config=debug
set sse2=sse2
set msvc=no

if exist .\fraqtive.pro goto arg_loop

echo *** ERROR: cannot find project file in current directory.
goto end

:arg_loop
if "%1" == "" goto arg_done
if "%1" == "-prefix" goto arg_prefix
if "%1" == "-debug" goto arg_debug
if "%1" == "-no-sse2" goto arg_nosse2
if "%1" == "-msvc" goto arg_msvc
if "%1" == "-help" goto show_usage
if "%1" == "--help" goto show_usage
if "%1" == "/?" goto show_usage

echo *** ERROR: Unrecognized option '%1'
goto show_usage

:arg_prefix
set prefix=%2
shift
goto arg_next

:arg_debug
set config=debug
goto arg_next

:arg_nosse2
set sse2=no-sse2
goto arg_next

:arg_msvc
set msvc=yes
goto arg_next

:arg_next
shift
goto arg_loop

:show_usage
echo Usage: configure [-prefix DIR] [-debug] [-msvc]
echo.
echo Options:
echo.
echo   -prefix DIR   Set the instalation directory to DIR
echo                   (default: C:\Program Files\Fraqtive)
echo   -debug        Build with debugging symbols
echo   -no-sse2      Do not compile with use of SSE2 instructions
echo   -msvc         Generate Visual Studio solution
goto end

:arg_done

echo Testing for qmake...

set QMAKE=

qmake -v >nul 2>nul
if errorlevel 1 goto test_qtdir
set QMAKE=qmake
goto qmake_found

:test_qtdir
if "%QTDIR%" == "" goto no_qmake
"%QTDIR%\bin\qmake" -v >nul 2>nul
if errorlevel 1 goto no_qmake
set QMAKE=%QTDIR%\bin\qmake
goto qmake_found

:no_qmake
echo *** ERROR: Cannot find 'qmake' in your PATH.
goto end

:qmake_found

echo Writing configuration file...

echo # this file was generated by configure.bat >config.pri
echo CONFIG += %config% %sse2% >>config.pri
echo PREFIX = %prefix:\=\\% >>config.pri

if "%msvc%" == "yes" goto gen_msvc

echo Generating Makefiles...

"%QMAKE%" -recursive
if errorlevel 1 goto qmake_failed
echo.
echo Configure finished. Run 'make' or 'nmake' now.
goto end

:gen_msvc

echo Generating Visual Studio solution...

"%QMAKE%" -tp vc -recursive
if errorlevel 1 goto qmake_failed
echo.
echo Configure finished.
goto end

:qmake_failed
echo *** ERROR: Running 'qmake' failed.

:end
