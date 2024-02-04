#Include, %A_ScriptDir%
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

; SendMode Input

CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen

SetMouseDelay, 20
; SetDefaultMouseSpeed, 100

ShowTooltip(N, Msg)
{
	Global
	ToolTip % Msg . ": " . X%N% . ", " . Y%N%, X%N%, Y%N%, 1
	SetTimer, RemoveTooltip, 500
}

GetLocation(N)
{
	Global
	MouseGetPos, X%N%, Y%N%
	ShowTooltip(N, "Got location")
}

SetLocation(N)
{
	Global
	If (X%N% = "")
	{
		X%N% := 0
		Y%N% := 0
	}
	MouseMove % X%N%, Y%N%
	ShowTooltip(N, "Moved to location")
}

ClickLocation(N)
{
    WinGet, ActiveWin, ID , A
    MouseGetPos, X, Y
    SetLocation(N)
    Click, 10
    MouseMove % X, Y
    WinActivate, ahk_id %ActiveWin%
}

^+F1:: GetLocation(1)
^+F2:: GetLocation(2)
^+F3:: GetLocation(3)
^+F4:: GetLocation(4)
^+F5:: GetLocation(5)
^+F6:: GetLocation(6)
^+F7:: GetLocation(7)
^+F8:: GetLocation(8)
^+F9:: GetLocation(9)
^+F10:: GetLocation(10)
^+F11:: GetLocation(11)
^+F12:: GetLocation(12)

^!F1:: SetLocation(1)
^!F2:: SetLocation(2)
^!F3:: SetLocation(3)
^!F4:: SetLocation(4)
^!F5:: SetLocation(5)
^!F6:: SetLocation(6)
^!F7:: SetLocation(7)
^!F8:: SetLocation(8)
^!F9:: SetLocation(9)
^!F10:: SetLocation(10)
^!F11:: SetLocation(11)
^!F12:: SetLocation(12)

^F1:: ClickLocation(1)
^F2:: ClickLocation(2)
^F3:: ClickLocation(3)
^F4:: ClickLocation(4)
^F5:: ClickLocation(5)
^F6:: ClickLocation(6)
^F7:: ClickLocation(7)
^F8:: ClickLocation(8)
^F9:: ClickLocation(9)
^F10:: ClickLocation(10)
^F11:: ClickLocation(11)
^F12:: ClickLocation(12)

RemoveTooltip:
	ToolTip,,,, 1
	Return
