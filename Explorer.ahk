#Include, %A_ScriptDir%

#If, WinActive("ahk_class ^CabinetWClass$")

; Create new text file
; Ctrl+Shift+T (Qwerty k)
^+SC025::
	Send, !h
	Send, w
	Send, {Up 1}
	Send, {Enter}
	Return

#If,
