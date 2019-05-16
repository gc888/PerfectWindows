﻿CreateTray:
menu,tray,icon,,,1
menu,tray,DeleteAll
menu,tray,NoStandard
menu,tray,UseErrorLevel
menu,tray,click,1
menu,tray,tip,Power Keys %v%
menu,tray,add,Power Keys %v% by %_Author%,About
menu,tray,disable,Power Keys %v% by %_Author%
menu,tray,disable,%_Author%
menu,tray,add
menu,tray,add,%_StartUp%,StartUp
if StartUp
menu,tray,check,%_StartUp%
menu,tray,add,%_Help%,Help
menu,tray,add,%_Feedback%,Feedback
menu,tray,add
menu,tray,add,%_Update%,Update
menu,tray,add,%_Exit%,Exit
menu,tray,add,%_Restart%,Restart
menu,tray,add
menu,tray,add,%_Config%,Config
menu,tray,add,%_EnableGameMode%,EnableGameMode
menu,tray,default,%_Restart%
if !SpaceDisabled
{
    menu,tray,add,%_DisableSpace%,ToggleSpace
}
else
{
    menu,tray,add,%_EnableSpace%,ToggleSpace
}
Return

Author:
About:
License:
Return

EnableGameMode:
RegWrite, REG_dword, HKLM\Software\szzhiyang\Power Keys,GameMode,1
GameMode=1
Hotkey,LAlt & CapsLock,Off
Hotkey,RAlt & CapsLock,Off
Hotkey,LAlt & Tab,Off
Hotkey,RAlt & Tab,Off
Hotkey,`` & Tab,Off
menu,tray,icon,,,1
menu,tray,DeleteAll
menu,tray,NoStandard
menu,tray,UseErrorLevel
menu,tray,click,1
menu,tray,tip,Power Keys %v%
menu,tray,add,Power Keys %v% by %_Author%,About
menu,tray,disable,Power Keys %v% by %_Author%
menu,tray,add
menu,tray,add,%_DisableGameMode%,DisableGameMode
menu,tray,default,%_DisableGameMode%
Gosub,GameModeEnabled
Return

DisableGameMode:
RegWrite, REG_dword, HKLM\Software\szzhiyang\Power Keys,GameMode,0
GameMode=0
Hotkey,LAlt & CapsLock,On
Hotkey,RAlt & CapsLock,On
Hotkey,LAlt & Tab,On
Hotkey,RAlt & Tab,On
Hotkey,`` & Tab,On
Gosub,CreateTray
Gosub,GameModeDisabled
Return

Startup:
if Startup
{
    RegDelete, HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys
    StartUp=0
    menu,tray,uncheck,%_StartUp%
}
else
{
    RegWrite, REG_SZ, HKLM\Software\Microsoft\Windows\CurrentVersion\Run, Power Keys, %A_ScriptFullPath%
    StartUp=1
    menu,tray,check,%_StartUp%
}
Return

ToggleSpace:
if SpaceDisabled
{
    SpaceDisabled=0
    RegWrite, REG_dword, HKLM\Software\szzhiyang\Power Keys,SpaceDisabled,0
    menu,tray,rename,%_EnableSpace%,%_DisableSpace%
    Gosub,SpaceEnabled
}
else
{
    SpaceDisabled=1
    RegWrite, REG_dword, HKLM\Software\szzhiyang\Power Keys,SpaceDisabled,1
    menu,tray,rename,%_DisableSpace%,%_EnableSpace%
    Gosub,SpaceDisabled
}
Return

Help:
ShellRun(HelpLink)
Return

Feedback:
MsgBox,0x40040,Power Keys,%_ConfirmFeedback%
Return

Restart:
FileRemoveDir,%ProgramFilesDir%,1
Reload
Exitapp
Return

Update:
FileRemoveDir,%ProgramFilesDir%,1
FileCreateDir, %ProgramFilesDir%
FileCopy, %A_ScriptFullPath%, %ProgramFilesDir%\Power-Keys-Updater.exe,1
Run,%ProgramFilesDir%\Power-Keys-Updater.exe update "%A_ScriptFullPath%",,UseErrorLevel
Exitapp
Return

Config:
FileCreateDir,F1
FileCreateDir,F2
FileCreateDir,F3
FileCreateDir,F4
FileCreateDir,F5
FileCreateDir,F6
FileCreateDir,F7
FileCreateDir,F8
FileCreateDir,F9
FileCreateDir,F10
FileCreateDir,F11
FileCreateDir,F12
Run,%A_WorkingDir%,,UseErrorLevel
Return

Exit:
FileRemoveDir,%ProgramFilesDir%,1
MsgBox,0x40134,Power Keys,%_ConfirmExit%
IfMsgBox, Yes
Exitapp
Return