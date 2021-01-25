#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000

SetCapsLockState, alwaysoff
SetScrollLockState, alwaysoff
SendMode, Event

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
<::Volume_Down
>::Volume_Up
m::Volume_Mute
]::Media_Next
[::Media_Prev
Enter::Media_Play_Pause

#if