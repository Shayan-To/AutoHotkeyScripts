#Include, %A_ScriptDir%

#IfWinActive, ^Git Gui ahk_class ^TkTopLevel$

^+t::
	Send, !c
	Send, {Down 3}
	Send, {Enter}
	Return

^+i::
	Send, !c
	Send, {Down 4}
	Send, {Enter}
#IfWinActive, ahk_class ^#32770$
	Send, y
#IfWinActive, ^Git Gui ahk_class ^TkTopLevel$
	Return

^+u::
	Send, !c
	Send, {Down 5}
	Send, {Enter}
	Return

^+j::
	Send, !c
	Send, {Down 6}
	Send, {Enter}
	Return

#IfWinActive
