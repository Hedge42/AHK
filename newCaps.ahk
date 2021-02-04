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

; can still turn caps on
#CapsLock::CapsLock

; usable as a keybind in games
; however, keys like WASD will be processed as arrow keys
; ~CapsLock::SetCapsLockState, Off

#if GetKeyState("CapsLock", "P")
;if (GetKeyState("CapsLock" , "P")){

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

; ALT CHARS
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