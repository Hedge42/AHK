#SingleInstance Force
#NoEnv
#Persistent
#MaxHotkeysPerInterval 1000
SendMode, Event

; Set the size and color of the rectangle
rectWidth := 100
rectHeight := 100
rectColorRed := "FF0000"
rectColorGreen := "00FF00"
currentColor := rectColorRed

; Create the GUI window to show the rectangle
Gui +AlwaysOnTop +ToolWindow +Resize
Gui, Color, %currentColor%
Gui, Margin, 0, 0
Gui, Add, Text, w20 h20, ""
Gui, Add, Picture, x0 y0 w%rectWidth% h%rectHeight%
Gui, Show, x0 y0 NoActivate, ☺
lastGui := WinExist("A")

; Define the mouse down event to capture mouse movement and allow the user to drag the rectangle
Gui, +hwndhwnd
hwndDrag := hwnd
OnMessage(0x201, "WM_LBUTTONDOWN")
return

WM_LBUTTONDOWN(wParam, lParam)
{
    ; Get the current position of the mouse
    MouseGetPos, startX, startY

    ; Get the current position and size of the GUI window
    WinGetPos, winX, winY, winWidth, winHeight, ahk_id %lastGui%

    ; Calculate the offset between the mouse position and the GUI window position
    offsetX := startX - winX
    offsetY := startY - winY

    ; Capture the mouse movement and move the GUI window accordingly
    Loop
    {
        GetKeyState, state, LButton, P
        if state = U
            break

        MouseGetPos, newX, newY
        newWinX := newX - offsetX
        newWinY := newY - offsetY
        WinMove, ahk_id %lastGui%, , newWinX, newWinY
    }
}

; Define the hotkey to toggle the color of the rectangle between red and green
~$LControl::
    ; Check if the F1 key is already being held down
    ;GetKeyState, state2, LControl
    ;if state2 = U
    currentColor := (currentColor = rectColorRed) ? rectColorGreen : rectColorRed
    Gui, Color, %currentColor%
    GuiControl, +E0x1, % "ahk_id " lastGui, Rect1, %currentColor%
    KeyWait LControl
    ;if GetKeyState("LControl", "U")
    ;{
    ; The F1 key is not being held down, so execute the command
    ;Send, Hello world!
    ;#if
    ;}
return

; Define the event to close the program when the window's close button is pressed
GuiClose:
    ExitApp
return