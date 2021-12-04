#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000

; blacklist programs from being used 
;GroupAdd, blacklist, ahk_exe VALORANT-Win64-Shipping.exe
;#IfWinNotActive, ahk_group blacklist

SetCapsLockState, alwaysoff
SetScrollLockState, alwaysoff
SendMode, Event

; win+caps can still turn caps on
; turned off because buggy
; #CapsLock::CapsLock



; usable as a keybind in games
; however, keys like WASD will be processed as arrow keys
; ~CapsLock::SetCapsLockState, Off

*CapsLock::return

;CapsLock Up::
;    SendKeyUps()
;    return

SendKeyUps()
{
    Loop, 0xFF
    {
	    Key := Format("VK{:02X}",A_Index)
	    if GetKeyState(Key)
            SendMessage, %key% Up
		    Send, {%Key% Up}
    }
}

#if GetKeyState("CapsLock", "P")    


r::reload

; mouse clicks
z Up::Send {MButton Up}
x Up::Send {RButton Up}
c Up::Send {LButton Up}

z::Send {MButton Down}
x::Send {RButton Down}
c::Send {LButton Down}

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
+-::Send {Asc 0151} ; —
BackSpace::Delete
p::PrintScreen
q::NumpadHome
e::NumpadEnd
Escape::`

; ALT CHARS
Tab & Escape::#^Left
Tab & j::Send {ASC 27} ; ← 
Tab & l::Send {ASC 26} ; →
Tab & i::Send {ASC 24} ; ↑
Tab & k::Send {ASC 25} ; ↓
Tab & 8::Send {ASC 236} ; ∞
Tab & f::Send {ASC 159} ; ƒ
Tab & ,::Send {ASC 243} ; ≤
Tab & .::Send {ASC 242} ; ≥
Tab & o::Send {ASC 234} ; Ω
Tab & '::Send {ASC 248} ; °
Tab & -::Send {ASC 241} ; ±
Tab & [::Send {ASC 174} ; «
Tab & ]::Send {ASC 175} ; »
Tab & p::Send {ASC 227} ; π
Tab & b::Send {ASC 225} ; ß
Tab & a::Send {ASC 224} ; α
Tab & t::Send {ASC 231} ; τ
Tab & e::Send {ASC 228} ; Σ
Tab & m::Send {ASC 0153} ; ™
Tab & 3::Send {ASC 3} ; ♥
Tab & d::Send {U+0394} ; Δ
Tab & =::Send {U+2260} ; ≠

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

; Caps + Wheel for horizontal scrolling
; https://autohotkey.com/board/topic/56123-horizontal-scroll-wheelleftwheelright-in-windows-2003xp/
WheelUp::  ; Scroll left.
ControlGetFocus, fcontrol, A
Loop 3  ; <-- Increase this value to scroll faster.
    SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
return

WheelDown::  ; Scroll right.
ControlGetFocus, fcontrol, A
Loop 3  ; <-- Increase this value to scroll faster.
    SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.
return

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

; git bash (terminal) shortcut
; https://gist.github.com/yiboyang/c4a4656660cfd0503b7f46e9edbb6f72

#t::
  OpenGbHere()
  return

OpenGbHere()
{
    ; This is required to get the full path of the file from the address bar
    WinGetText, full_path, A

    ; Split on newline (`n)
    StringSplit, word_array, full_path, `n

    ; Find and take the element from the array that contains address
    Loop, %word_array0%
    {
        IfInString, word_array%A_Index%, Address
        {
            full_path := word_array%A_Index%
            break
        }
    }  

    ; strip to bare address
    full_path := RegExReplace(full_path, "^Address: ", "")

    ; Just in case - remove all carriage returns (`r)
    StringReplace, full_path, full_path, `r, , all


    IfInString full_path, \
    {
        Run,  C:\Program Files\Git\git-bash.exe, %full_path%
    }
    else
    {
        Run, C:\Program Files\Git\git-bash.exe --cd-to-home
    }
}





#if