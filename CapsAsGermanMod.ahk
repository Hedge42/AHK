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


*CapsLock::return
AppsKey::return


#if GetKeyState("CapsLock", "P") || GetKeyState("AppsKey", "P")   

a::ä
+a::Ä
u::ü
+u::Ü
o::ö
+o::Ö
b::ß
+b::ẞ

#if