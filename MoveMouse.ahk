#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000

SendMode, Input


dpi := 1200
distance := 17.1429

total_distance := dpi * distance

i::MouseMove, total_distance, 0, 50, R

;7::DllCall("mouse_event", "UInt", 0x01, "UInt", total_distance, "UInt", 0, "UInt", 0, "UPtr", 0x52)
;7::DllCall("User32.dll\mouse_event", "UInt", 1, "UInt", total_distance, "UInt", 0, "UInt", 5, "UPtr", 5)