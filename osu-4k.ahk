#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000

SendMode, Input



; ZX == LEFT CLICK
z::Send {x up}{z down}
z up::Send {z up}
x::Send {z up}{x down}
x up::Send {x up}

; CV == RIGHT CLICK
c::Send {v up}{c down}
c up::Send {c up}
v::Send {c up}{v down}
v up::Send {v up}