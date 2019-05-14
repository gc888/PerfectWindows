LWin & Esc::Return
RWin & Esc::Return

LWin & Esc Up::
RWin & Esc Up::
Process,Exist,Magnify.exe
if ErrorLevel
{
    Send {LWin Down}{Esc Down}{Esc Up}{LWin Up}
}
Else
{
    if GameMode
    Gosub,DisableGameMode
    Else
    Gosub,EnableGameMode
}
Return

LWin & =::Volume_Up
RWin & =::Volume_Up
LWin & -::Volume_Down
RWin & -::Volume_Down

LWin & \::Return
RWin & \::Return
LWin & \ Up::Send {Volume_Mute}
RWin & \ Up::Send {Volume_Mute}

LWin & [::Return
RWin & [::Return
LWin & [ Up::Send {Media_Prev}
RWin & [ Up::Send {Media_Prev}

LWin & ]::Return
RWin & ]::Return
LWin & ] Up::Send {Media_Next}
RWin & ] Up::Send {Media_Next}

LWin & '::Return
RWin & '::Return
LWin & ' Up::Send {Media_Play_Pause}
RWin & ' Up::Send {Media_Play_Pause}

#if !GameMode

$#`::#Tab

$#PgUp::#=
$#PgDn::#-

$#Enter::Return
$#Enter Up::Send {LCtrl Down}{LWin Down}{d Down}{d Up}{LWin Up}{LCtrl Up}

$#bs::Return
$#bs Up::Send {LCtrl Down}{LWin Down}{F4 Down}{F4 Up}{LWin Up}{LCtrl Up}

$#F1::Return
$#F1 Up::Gosub, Help

$#Delete::Return
$#Delete Up::Run ::{645ff040-5081-101b-9f08-00aa002f954e},,UseErrorLevel

$#+Delete::Return
$#+Delete Up::
msgbox,0x40131,Power Keys,%_ConfirmEmptyRecycleBin%
ifmsgbox,ok
{
    FileRecycleEmpty
}
Return

$#0::Return
$#0 Up::
calc="%A_WinDir%\system32\calc.exe"
ShellRun(calc)
Return

$#+PrintScreen::Return
$#+PrintScreen Up::
snippingtool="%A_WinDir%\system32\snippingtool.exe"
ShellRun(snippingtool)
Return

$#End::
Keywait,LWin
Keywait,RWin
DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1)
Return

#if

#if GameMode

LWin::Return
RWin::Return

#if