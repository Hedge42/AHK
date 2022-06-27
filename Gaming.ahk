#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000

;SetCapsLockState, alwaysoff
;SetScrollLockState, alwaysoff

; whitelist programs
GroupAdd, whitelist, ahk_exe VALORANT-Win64-Shipping.exe
#IfWinActive, ahk_group whitelist

SendMode, Event

AppsKey::RWin ; can still use win key
CapsLock::8
LWin::9
LAlt::0

; Space::LButton ; experimental...

; block alt-tab and win-tab
;+Tab::Return
!Tab::Return
#Tab::Return

