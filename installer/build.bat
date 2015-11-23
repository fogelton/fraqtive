@echo off

if "%1" == "" goto usage

set VERSION=0.4.8
set BUILDVERSION=0.4.8.5508

set NSISDIR=C:\Program Files (x86)\NSIS

if not %1 == x86 goto elsex64

set BUILDDIR=D:\Release\fraqtive-x86

set QTDIR=C:\Qt5\x86
set VCRTDIR=C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT

set ARCHITECTURE=win_x86
set SUFFIX=

goto endopt
:elsex64

if not %1 == x64 goto usage

set BUILDDIR=d:\git\fraqtive-master\

set QTDIR=C:\Qt\5.5\msvc2013_64
set VCRTDIR=C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\redist\x64\Microsoft.VC120.CRT

set ARCHITECTURE=win_x64
set SUFFIX= (64-bit)

goto endopt
:usage

echo usage: build.bat x86^|x64

goto :eof
:endopt

echo have to be precompiled qtvars.bat are missing!!!!!!!!!!!!!!!!!!!!!!!
::call "%QTDIR%\bin\qtvars.bat" vsvars

if not exist "%BUILDDIR%" mkdir "%BUILDDIR%"

::echo.
::echo Exporting...
::echo.

::svn export --quiet --force .. "%BUILDDIR%"

pushd "%BUILDDIR%"

call configure.bat

nmake release

if errorlevel 1 goto cleanup

call sign.bat release\fraqtive.exe

echo.
echo Creating uninstaller...
echo.

"%NSISDIR%\makensis.exe" /DINNER "/DQTDIR=%QTDIR%" "/DVCRTDIR=%VCRTDIR%" "/DVERSION=%VERSION%" "/DBUILDVERSION=%BUILDVERSION%" "/DARCHITECTURE=%ARCHITECTURE%" "/DSUFFIX=%SUFFIX%" /V2 installer\fraqtive.nsi

if errorlevel 1 goto cleanup

"%TEMP%\innerinst.exe"

call sign.bat "%TEMP%\uninstall.exe"

echo.
echo Creating installer...
echo.

"%NSISDIR%\makensis.exe" "/DQTDIR=%QTDIR%" "/DVCRTDIR=%VCRTDIR%" "/DVERSION=%VERSION%" "/DBUILDVERSION=%BUILDVERSION%" "/DARCHITECTURE=%ARCHITECTURE%" "/DSUFFIX=%SUFFIX%" /V2 installer\fraqtive.nsi

if errorlevel 1 goto cleanup

call sign.bat "installer\fraqtive-%VERSION%-%ARCHITECTURE%.exe"

if not %1 == x86 goto cleanup

:cleanup

del /q /f "%TEMP%\innerinst.exe"
del /q /f "%TEMP%\uninstall.exe"

popd
