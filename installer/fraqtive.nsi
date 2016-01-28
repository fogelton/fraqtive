/**************************************************************************
* This file is part of the Fraqtive program
* Copyright (C) 2004-2012 Michał Męciński
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
**************************************************************************/

!define SRCDIR ".."
!define BUILDDIR "..\release"

!define SSL_DIR "c:\Dropbox\openssl1.0.2d\msvc2013_64"

!define UNINST_KEY "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Fraqtive"

!include "MUI2.nsh"

!include "languages\fraqtive_en.nsh"

SetCompress off

!ifdef INNER
    

    OutFile "$%TEMP%\innerinst.exe"
!else
    !verbose 4
    
  #  !SetCompressor /SOLID lzma
    
   # !SetCompressorDictSize 32

    OutFile "fraqtive-${VERSION}-${ARCHITECTURE}.exe"
!endif

!define MULTIUSER_EXECUTIONLEVEL "Highest"
!define MULTIUSER_MUI
!define MULTIUSER_INSTALLMODE_COMMANDLINE
!define MULTIUSER_INSTALLMODE_DEFAULT_REGISTRY_KEY "${UNINST_KEY}"
!define MULTIUSER_INSTALLMODE_DEFAULT_REGISTRY_VALUENAME "UninstallString"
!define MULTIUSER_INSTALLMODE_INSTDIR "Fraqtive"
!define MULTIUSER_INSTALLMODE_INSTDIR_REGISTRY_KEY "${UNINST_KEY}"
!define MULTIUSER_INSTALLMODE_INSTDIR_REGISTRY_VALUENAME "InstallLocation"
!if ${ARCHITECTURE} == "win_x64"
    !define MULTIUSER_USE_PROGRAMFILES64
!endif
!ifndef INNER
    !define MULTIUSER_NOUNINSTALL
!endif
!include "include\multiuser64.nsh"

Name "$(NAME)"

!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install-blue.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall-blue.ico"

!define MUI_WELCOMEFINISHPAGE_BITMAP "images\wizard.bmp"
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "images\wizard.bmp"

!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "images\header.bmp"
!define MUI_HEADERIMAGE_RIGHT

!define MUI_WELCOMEPAGE_TITLE "$(TITLE)"
!define MUI_WELCOMEPAGE_TEXT "$(WELCOME_TEXT)"
!insertmacro MUI_PAGE_WELCOME

!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "${SRCDIR}\COPYING"

!insertmacro MULTIUSER_PAGE_INSTALLMODE

!insertmacro MUI_PAGE_DIRECTORY

ShowInstDetails nevershow
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_TITLE "$(TITLE)"
!insertmacro MUI_PAGE_FINISH
  
!ifdef INNER  
    !define MUI_WELCOMEPAGE_TITLE "$(TITLE)"
    !insertmacro MUI_UNPAGE_WELCOME

    !insertmacro MUI_UNPAGE_CONFIRM

    ShowUninstDetails nevershow
    !insertmacro MUI_UNPAGE_INSTFILES

    !define MUI_FINISHPAGE_TITLE "$(TITLE)"
    !insertmacro MUI_UNPAGE_FINISH
!endif

!insertmacro MUI_LANGUAGE "English"

VIProductVersion "${BUILDVERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Michał Męciński"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "Fraqtive Setup"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright (C) 2004-2015 Michał Męciński"
VIAddVersionKey /LANG=${LANG_ENGLISH} "OriginalFilename" "fraqtive-${VERSION}-${ARCHITECTURE}.exe"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "Fraqtive"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${VERSION}"

Function .onInit

!if ${ARCHITECTURE} == "win_x64"
    SetRegView 64
!endif

!ifdef INNER
    WriteUninstaller "$%TEMP%\uninstall.exe"
    Quit
!endif

    !insertmacro MULTIUSER_INIT
 ClearErrors
    ReadRegDWORD $0 HKLM "Software\Microsoft\Net Framework Setup\NDP\v4\Client" "Install"
    IfErrors dotNet40NotFound
    IntCmp $0 1 dotNet40Found
      dotNet40NotFound:
      MessageBox MB_OK "You are not administrator and you do not have Microsoft .Net framework 4.5 installed, which is needed by Kinect to work properly. Please download Microsoft .Net framework and install it."
      Abort
      Return
    # otherwise, confirm and return
      dotNet40Found:
      Return
FunctionEnd

Section "Kinect for Windows v2 runtime (required)" 
  SectionIn RO

  Banner::show /set 76 "Installing Microsoft Kinect SDK v2 runtime" "Please wait"  
    SetOutPath $TEMP
    File "${BUILDDIR}\KinectRuntime-v2.0_1409-Setup.exe"
    ExecWait "$TEMP\KinectRuntime-v2.0_1409-Setup.exe"
    Delete /REBOOTOK "$TEMP\KinectRuntime-v2.0_1409-Setup.exe"
    Banner::destroy

 SectionEnd

Section ".Net Framework (required)" 
;SetShellVarContext current
  SectionIn RO
  ClearErrors
ReadRegDWORD $0 HKLM "Software\Microsoft\Net Framework Setup\NDP\v4\Client" "Install"
IfErrors dotNet40NotFound
IntCmp $0 1 dotNet40Found
dotNet40NotFound:
  Banner::show /set 76 "Installing Microsoft .NET Framework 4.5.2" "Please wait"  
    SetOutPath $TEMP
    File "${BUILDDIR}\dotNetFx40_Client_x86_x64.exe"
    ExecWait "$TEMP\dotNetFx40_Client_x86_x64.exe /passive /norestart"
    Delete /REBOOTOK "$TEMP\dotNetFx40_Client_x86_x64.exe"
    Banner::destroy
    dotNet40Found:

 SectionEnd

Section

    SetShellVarContext current
    SetOutPath "$APPDATA\Fraqtive"
    File "${SRCDIR}\bookmarks.dat"
    SetShellVarContext all

    SetOutPath "$INSTDIR"

    File "${SRCDIR}\ChangeLog"
    File "${SRCDIR}\COPYING"
    File "${SRCDIR}\README"
    
    SetOutPath "$INSTDIR\bin"
    Delete "$INSTDIR\bin\*.*"
    
    File "${SRCDIR}\config.ini"

    File "${BUILDDIR}\fraqtive.exe"
    File "${BUILDDIR}\FraqtiveKinectAdapter.exe"
    File "${BUILDDIR}\closedHand.cur"
    File "${BUILDDIR}\openHand.cur"
    File "${BUILDDIR}\lassoHand.cur"

    File "${VCRTDIR}\msvcp120.dll"
    File "${VCRTDIR}\msvcr120.dll"

    File "${QTDIR}\bin\Qt5Core.dll"
    File "${QTDIR}\bin\Qt5Gui.dll"
    File "${QTDIR}\bin\Qt5OpenGL.dll"
    File "${QTDIR}\bin\Qt5Widgets.dll"
    File "${QTDIR}\bin\Qt5Xml.dll"
    File "${QTDIR}\bin\Qt5Network.dll"
    File "${QTDIR}\bin\Qt5Multimedia.dll"
    
    File "${SSL_DIR}\libeay32.dll"
    File "${SSL_DIR}\ssleay32.dll"

    SetOutPath "$INSTDIR\bin\imageformats"

    File "${QTDIR}\plugins\imageformats\qjpeg.dll"
    File "${QTDIR}\plugins\imageformats\qtiff.dll"

SetOutPath "$INSTDIR\bin\mediaservice"

    File "${QTDIR}\plugins\mediaservice\dsengine.dll"
    File "${QTDIR}\plugins\mediaservice\wmfengine.dll"
    File "${QTDIR}\plugins\mediaservice\qtmedia_audioengine.dll"

    SetOutPath "$INSTDIR\bin\platforms"

    File "${QTDIR}\plugins\platforms\qwindows.dll"

    SetOutPath "$INSTDIR\bin"

    CreateShortCut "$SMPROGRAMS\Fraqtive.lnk" "$INSTDIR\bin\fraqtive.exe"
    CreateShortCut "$DESKTOP\Fraqtive.lnk" "$INSTDIR\bin\fraqtive.exe"

    WriteRegStr SHCTX "${UNINST_KEY}" "DisplayIcon" '"$INSTDIR\bin\fraqtive.exe"'
    WriteRegStr SHCTX "${UNINST_KEY}" "DisplayName" "Fraqtive ${VERSION}${SUFFIX}"
    WriteRegStr SHCTX "${UNINST_KEY}" "DisplayVersion" "${VERSION}"
    WriteRegStr SHCTX "${UNINST_KEY}" "UninstallString" '"$INSTDIR\uninstall.exe" /$MultiUser.InstallMode'
    WriteRegStr SHCTX "${UNINST_KEY}" "InstallLocation" "$INSTDIR"
    WriteRegStr SHCTX "${UNINST_KEY}" "Publisher" "Michał Męciński"
    WriteRegStr SHCTX "${UNINST_KEY}" "HelpLink" "http://fraqtive.mimec.org"
    WriteRegStr SHCTX "${UNINST_KEY}" "URLInfoAbout" "http://fraqtive.mimec.org"
    WriteRegStr SHCTX "${UNINST_KEY}" "URLUpdateInfo" "http://fraqtive.mimec.org/downloads"
    WriteRegDWORD SHCTX "${UNINST_KEY}" "NoModify" 1
    WriteRegDWORD SHCTX "${UNINST_KEY}" "NoRepair" 1

    ExecShell "" "$INSTDIR\bin\FraqtiveKinectAdapter.exe"
!ifndef INNER
    SetOutPath "$INSTDIR"
    File "$%TEMP%\uninstall.exe"
!endif

SectionEnd

!ifdef INNER

Function un.onInit

!if ${ARCHITECTURE} == "win_x64"
    SetRegView 64
!endif

    !insertmacro MULTIUSER_UNINIT
    KillProcDLL::KillProc "fraqtive.exe"
KillProcDLL::KillProc "FraqtiveKinectAdapter.exe"

FunctionEnd

Section "Uninstall"

    DeleteRegKey SHCTX "${UNINST_KEY}"
    DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Run\" "FraqtiveKinectAdapter"
    Delete "$SMPROGRAMS\Fraqtive.lnk"
    Delete "$DESKTOP\Fraqtive.lnk"

    Delete "$INSTDIR\ChangeLog"
    Delete "$INSTDIR\COPYING"
    Delete "$INSTDIR\README"
    RMDir /r "$INSTDIR\bin"
    RMDir /r "$INSTDIR\plugins"
    Delete "$INSTDIR\uninstall.exe"
    RMDir "$INSTDIR"

SectionEnd

!endif
