!F12:: ;console
Print("hello world")
Print(1+2+3+4)
return

Print(vOutput)
{
	static hGui, hEdit, vWinW := 400, vWinH := 400
	if !hGui
	{
		Gui, New, +HwndhGui
		Gui, Font, s18 w700 cC0C0C0, Courier New
		;Gui, Font, cC0C0C0, Fixedsys
		Gui, Color,, 000000
		Gui, Add, Edit, % Format("+HwndhEdit x0 y0 w{} h{}", vWinW, vWinH)
		Gui, Show, % Format("w{} h{}", vWinW, vWinH)
	}
	vOutput .= "`r`n"
	SendMessage, 0xE, 0, 0,, % "ahk_id " hEdit ;WM_GETTEXTLENGTH := 0xE
	vLen := ErrorLevel
	SendMessage, 0xB1, % vLen, % vLen,, % "ahk_id " hEdit ;EM_SETSEL := 0xB1
	SendMessage, 0xC2, 0, % &vOutput,, % "ahk_id " hEdit ;EM_REPLACESEL := 0xC2
	;PostMessage, 0xB7, 0, 0,, % "ahk_id " hEdit ;EM_SCROLLCARET := 0xB7
}
