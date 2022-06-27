; https://www.autohotkey.com/boards/viewtopic.php?t=37043
;- created =20150209
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
edcol1=white
edcol2=yellow
edcol3=red

GUI,2:+AlwaysOnTop
Gui,2: Color, ControlColor, Black
Gui,2: Font, CDefault, FixedSys

Gui,2:Add, Edit, x5     y10  w800 h100  c%edcol1% vF1,

GUI,2:show, NA W820 H130 X20 Y0, Mark Text and use alt+F6
return
;----------------------------------------------------------
2GuiClose:
ExitApp


!F12::
sc=ahk_class AutoHotkeyGUI
classNN=Edit1
C2=
Clipboard := ""
Send, ^c
sleep,100
clipwait,1
C2:=clipboard
if (ErrorLevel)
    return
IfWinNotActive ,%SC%,,WinActivate,%SC%
  WinWaitActive,%SC%
;sendevent,%c2%
;- or
ControlSend,%classnn%,%c2%`n,%sc%
return
;=========================================================
