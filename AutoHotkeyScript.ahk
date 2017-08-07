#Include, %A_ScriptDir%
#InstallKeybdHook
#SingleInstance, Force

#Include, CommonObjectFunctions.ahk
#Include, Win32KeyboardFunctions.ahk
#Include, ToggleKeyboard.ahk

; ====================================================================

#Include, Config.ahk

InitKeyboardsData()

SetTitleMatchMode, RegEx
SetCapsLockState, AlwaysOff

; ====================================================================

; #o::
#SC01F::Send, {Media_Play_Pause}

$+1::Send, {!}
$+2::Send, {@}
$+3::Send, {#}
$+4::Send, {$}
$+5::Send, {`%}
$+6::Send, {^}
;$+7::Send, {&}
$+8::Send, {*}

; ====================================================================

$`::
	Send, {``}
	If (BackTickLanguageChange = 1)
	{
		ToggleKeyboard("")
	}
	Return

Capslock::
	ToggleKeyboard("")
	Return

<^Capslock::
	ToggleKeyboard("Left")
	Return

>^Capslock::
	ToggleKeyboard("Right")
	Return

+Capslock::
	ToggleKeyboard("Normal")
	Return

!Capslock::
	T := GetKeyboardLayout()
	S := GetKeyboardLayoutName()
	H := Format("{1:X}", T)
	MsgBox, %T% %H% %S%
	Return

Capslock & `::
	BackTickLanguageChange := 1 - BackTickLanguageChange
	MsgBox, BackTickLanguageChange = %BackTickLanguageChange%
	Return

; ====================================================================

#Include, GitGui.ahk
