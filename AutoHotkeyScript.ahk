#Include, %A_ScriptDir%
#InstallKeybdHook
#SingleInstance, Force

#Include, CommonObjectFunctions.ahk
#Include, Win32KeyboardFunctions.ahk
#Include, ToggleKeyboard.ahk

; ====================================================================

SetTitleMatchMode, RegEx
SetCapsLockState, AlwaysOff

; ====================================================================

Lang_Eng := 0x0409
Lang_Pes := 0x0429
Lang_Arb := 0x0401

Keybd_Eng_US := 0x04090409
Keybd_Eng_DV := 0xF0020409
Keybd_Eng_DVL := 0xF01A0409
Keybd_Eng_DVR := 0xF01B0409
Keybd_Pes := 0x04290429
Keybd_Pes_Std := 0xF03A0429
Keybd_Arb_101 := 0x04010401

KeyboardsData := [{}
	,{Keyboards: {Normal: [Keybd_Eng_DV, Keybd_Eng_US]
			,Left: [Keybd_Eng_DVL]
			,Right: [Keybd_Eng_DVR]}}
	,{Keyboards: {Normal: [Keybd_Pes_Std, Keybd_Pes, Keybd_Arb_101]
			,Left: []
			,Right: []}}
,{}]

InitKeyboardsData()

; ====================================================================

BTickLangChange := 1

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
	If (BTickLangChange = 1)
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
	BTickLangChange := 1 - BTickLangChange
	MsgBox, BTickLangChange = %BTickLangChange%
	Return

; ====================================================================

#Include, GitGui.ahk
