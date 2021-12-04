#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000

; blacklist programs from being used 
GroupAdd, gameList, ahk_exe VALORANT-Win64-Shipping.exe
GroupAdd, gameList, ahk_exe VALORANT-Win64-Shipping.exe

; #IfWinActive, ahk_group gameList

if WinActive(ahk_group gameList){
	if WinActive("Caps.ahk", ahk_class AutoHotkey){
		WinClose
	}
	if !WinActive("Gaming.ahk", ahk_class AutoHotkey){
		Run "Gaming.ahk"
	}
}
else{
	if !WinActive("Caps.ahk", ahk_class AutoHotkey){
		Run "Caps.ahk"
	}
	if WinActive("Gaming.ahk", ahk_class AutoHotkey){
		WinClose
	}
}

