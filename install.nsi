
SetCompressor /SOLID /FINAL lzma
SetDatablockOptimize off

!include MUI2.nsh

; MUI Settings
!define MUI_ICON "build\beremiz\images\brz.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\nsis.bmp" ; optional
!define MUI_ABORTWARNING

; Documentation
!insertmacro MUI_PAGE_WELCOME
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

Name "YAPLC $BVERSION"
OutFile "YAPLC-$BVERSION.exe"
InstallDir "$PROGRAMFILES\YAPLC"
!define PYTHONW_EXE "$INSTDIR\python\pythonw.exe"
!define IDE_EXE '"$INSTDIR\IDE\yaplcide.py"'

Section "Beremiz" 
  SetOutPath $INSTDIR
  File /r /x debian /x *.pyc build\*
SectionEnd

Section "Install"
  ;Store installation folder
  WriteRegStr HKCU "Software\YAPLC" "" $INSTDIR
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\YAPLC" "Contact" "main@nucleron.ru"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\YAPLC" "DisplayName" "YAPLC-$BVERSION"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\YAPLC" "Publisher" "Nucleron R&D LLC"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\YAPLC" "URLInfoAbout" "https://github.com/nucleron/yaplc"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\YAPLC" "UninstallString" "$INSTDIR\uninstall.exe"
SectionEnd

Section "Shortcuts"
  SetShellVarContext all
  CreateDirectory "$SMPROGRAMS\YAPLC"
  CreateShortCut "$SMPROGRAMS\YAPLC\PlcopenEditor.lnk" "${PYTHONW_EXE}" '"$INSTDIR\beremiz\plcopeneditor.py"' "$INSTDIR\beremiz\images\poe.ico"
  CreateShortCut "$SMPROGRAMS\YAPLC\YAPLC-IDE.lnk" "${PYTHONW_EXE}" '${IDE_EXE}' "$INSTDIR\beremiz\images\brz.ico"
  CreateShortCut "$SMPROGRAMS\YAPLC\Uninstall.lnk" "$INSTDIR\uninstall.exe"
  SetShellVarContext current
  CreateShortCut "$DESKTOP\YAPLC-IDE-$BVERSION.lnk" "${PYTHONW_EXE}" '${IDE_EXE}' "$INSTDIR\beremiz\images\brz.ico"
SectionEnd

Section "Uninstall"
  SetShellVarContext all
  Delete "$INSTDIR\Uninstall.exe"
  Delete "$SMPROGRAMS\YAPLC\PlcopenEditor.lnk"
  Delete "$SMPROGRAMS\YAPLC\YAPLC-IDE.lnk"
  RMDir /R "$SMPROGRAMS\YAPLC"
  RMDir /R "$INSTDIR"
  DeleteRegKey /ifempty HKCU "Software\YAPLC"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\YAPLC"
  SetShellVarContext current
  Delete "$DESKTOP\YAPLC-IDE.lnk"
SectionEnd
