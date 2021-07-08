#Include, %A_ScriptDir%
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

CoordMode, Mouse, Screen
CoordMode, ToolTip, Screen

StartX := 0
StartY := 0
EndX := 0
EndY := 0
IsOn := 0

^F1::
	MouseGetPos, StartX, StartY
	Gosub, ShowTooltip
	Return

^+F1::
	MouseGetPos, EndX, EndY
	Gosub, ShowTooltip
	Return

^F2::
	IsOn := 1 - IsOn
	If (IsOn = 1)
	{
		SetTimer, DoDrag, 0
	}
	Return

DoDrag:
	If (IsOn = 0)
	{
		ToolTip,,,, 3
		Return
	}
	ToolTip, Dragging, 0, 0, 3
	MouseClickDrag, Left, %StartX%, %StartY%, %EndX%, %EndY%
	SetTimer, DoDrag, 100
	Return

ShowTooltip:
	ToolTip, Start: %StartX% %StartY%, %StartX%, %StartY%, 1
	ToolTip, End: %EndX% %EndY%, %EndX%, %EndY%, 2
	SetTimer, RemoveTooltip, 1000
	Return

RemoveTooltip:
	ToolTip,,,, 1
	ToolTip,,,, 2
	Return
