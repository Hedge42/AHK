#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000

SetCapsLockState, alwaysoff
SetScrollLockState, alwaysoff
SendMode, Event

; usable caps
#CapsLock::CapsLock

; handling Caps Up events
*CapsLock up::
{
    if (GetKeyState("w", "p")){
        Send {Up Up}
    }
    if (GetKeyState("a", "p")){
        Send {Left Up}
    }
    if (GetKeyState("s", "p")){
        Send {Down Up}
    }
    if (GetKeyState("d", "p")){
        Send {Right Up}
    }
    if (GetKeyState("q", "p")){
        Send {NumpadHome Up}
    }
    if (GetKeyState("e", "p")){
        Send {NumpadEnd Up}
    }
}
return

#if GetKeyState("CapsLock", "P")

r::reload

; arrow keys
w::Up
a::Left
s::Down
d::Right

; special keys
l::End
j::Home
i::PGUP
k::PGDN
`;::Ins
BackSpace::Delete
p::PrintScreen
q::NumpadHome
e::NumpadEnd

; f1-f12
1::F1
2::F2
3::F3
4::F4
5::F5
6::F6
7::F7
8::F8
9::F9
0::F10
-::F11
=::F12

; Media
,::Volume_Down
.::Volume_Up
m::Volume_Mute
]::Media_Next
[::Media_Prev
Enter::Media_Play_Pause

; Open calculator
; https://www.autohotkey.com/boards/viewtopic.php?t=53645
#c::	; <-- Open/Activate/Minimize Windows Calculator
{
	if WinExist("Calculator ahk_class CalcFrame") or WinExist("Calculator ahk_class ApplicationFrameWindow")
		if WinActive()
			WinMinimize
		else
			WinActivate
	else
		Run calc.exe
	return
}

; c-style comments
/::send {/}{*}{End}{*}{/}{left}{left}

#if