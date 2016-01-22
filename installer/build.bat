@echo off
set VERSION=0.4.8
set BUILDVERSION=0.4.8.5508

set NSISDIR=C:\Program Files (x86)\NSIS
set BUILDDIR=c:\git\fraqtive\

set QTDIR=C:\Qt\5.5\msvc2013_64
set VCRTDIR=C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\redist\x64\Microsoft.VC120.CRT
set path=%path%;C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin;%QTBIR%
set ARCHITECTURE=win_x64
set SUFFIX= (64-bit)


pushd "%BUILDDIR%"


call sign.bat release\FraqtiveKinectAdapter.exe
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


:cleanup

del /q /f "%TEMP%\innerinst.exe"
del /q /f "%TEMP%\uninstall.exe"

popd
