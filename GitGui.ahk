#Include, %A_ScriptDir%

#If, GitGuiHotkeysFix = 1 And WinActive("^Git Gui ahk_class ^TkTopLevel$")

; Stage file
^+t::
	Send, !c
	Send, {Down 3}
	Send, {Enter}
	Return

; Stage all files
^+i::
	Send, !c
	Send, {Down 4}
	Send, {Enter}
	Sleep, 100
	If (WinActive("ahk_class ^#32770$"))
	{
		Send, y
	}
	Return

; Unstage file
^+u::
	Send, !c
	Send, {Down 5}
	Send, {Enter}
	Return

; Revert changes
^+j::
	Send, !c
	Send, {Down 6}
	Send, {Enter}
	Return

#If,
