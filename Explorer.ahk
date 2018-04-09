#Include, %A_ScriptDir%

#If, WinActive("ahk_class ^CabinetWClass$")

; Create new text file
^+t::
	Send, !h
	Send, w
	Send, {Up}
	Send, {Enter}
	Return

#If,
