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

#If, WinOPlayerPlayPause = 1

; #o::
#SC01F::Send, {Media_Play_Pause}

#If, FixPersianSymbolKeys = 1

$+1::Send, {!}
$+2::Send, {@}
$+3::Send, {#}
$+4::Send, {$}
;$+5::Send, {`%}
$+6::Send, {^}
;$+7::Send, {&}
$+8::Send, {*}

#If, DisableInsert = 1

Insert::Return

#If,

; ====================================================================

#If, BackTickLanguageChange = 1 Or FixPersianSymbolKeys = 1

$`::
	Send, {``}
	If (BackTickLanguageChange = 1)
	{
		ToggleKeyboard("")
	}
	Return

#If,

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
	H := Format("{1:016X}", T)
	H := SubStr(H, 9)
	MsgBox, 0x%H%
	Return

Capslock & Tab::
	If (GetKeyState("Capslock", "T") = 1)
	{
		SetCapsLockState, AlwaysOff
	}
	Else
	{
		SetCapsLockState, AlwaysOn
	}
	Return

Capslock & `::
	BackTickLanguageChange := 1 - BackTickLanguageChange
	MsgBox, BackTickLanguageChange = %BackTickLanguageChange%
	Return

Capslock & Insert::
	DisableInsert := 1 - DisableInsert
	MsgBox, DisableInsert = %DisableInsert%
	Return

Capslock & \::
	FixPersianSymbolKeys := 1 - FixPersianSymbolKeys
	MsgBox, FixPersianSymbolKeys = %FixPersianSymbolKeys%
	Return

; ====================================================================

#Include, GitGui.ahk
