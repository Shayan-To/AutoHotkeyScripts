#InstallKeybdHook
#SingleInstance Force
SetTitleMatchMode, RegEx
SetCapsLockState, AlwaysOff

Lang := 0
BTickLangChange := 1

#SC01F::Send {Media_Play_Pause}

$+1::Send {!}
$+2::Send {@}
$+3::Send {#}
$+4::Send {$}
$+5::Send {`%}
$+6::Send {^}
;$+7::Send {&}
$+8::Send {*}

GetKeyboardLayout()
{
	HKL := DllCall("GetKeyboardLayout", "UInt", 0, "Ptr")
	Return HKL
}

GetKeyboardLayoutName()
{
	VarSetCapacity(Str, 1000)
	DllCall("GetKeyboardLayoutName", "Str", Str, "Int")
	Return Str
}

ActivateKeyboardLayout(HKL) ; This does not work.
{
	; For initialization, necessary to run only once.
	DllCall("Ole32.dll\OleInitialize", "Ptr", 0, "Int")
	DllCall("LoadKeyboardLayout", "Str", "00020409", "Int")


	T := DllCall("ActivateKeyboardLayout", "UInt", HKL, "UInt", 0x00000000, "PTR")
	If (!T)
	{
		MsgBox, Error
	}
}

ToggleLanguage()
{
	Global Lang
	Lang := 1 - Lang
	If (Lang = 0)
	{
		PostMessage, 0x50, 0, 0xF0020409,, A
	}
	Else
	{
		PostMessage, 0x50, 0, 0xF03A0429,, A
	}
}

$`::
	Send {``}
	If (BTickLangChange = 1)
	{
		ToggleLanguage()
	}
	Return

Capslock::
	ToggleLanguage()
	Return

<^Capslock::
	PostMessage, 0x50, 0, 0xF01A0409,, A
	Lang := 0
	Return

>^Capslock::
	PostMessage, 0x50, 0, 0xF01B0409,, A
	Lang := 0
	Return

!Capslock::
	T := GetKeyboardLayout()
	S := GetKeyboardLayoutName()
	H := Format("{1:X}", T)
	MsgBox, %T% %H% %S%
	Return

Capslock & `::
	BTickLangChange := 1 - BTickLangChange
	MsgBox BTickLangChange = %BTickLangChange%
	Return

#IfWinActive, ^Git Gui ahk_class ^TkTopLevel$

^+t::
	Send !c
	Send {Down 3}
	Send {Enter}
	Return
^+i::
	Send !c
	Send {Down 4}
	Send {Enter}
#IfWinActive, ahk_class ^#32770$
	Send y
#IfWinActive, ^Git Gui ahk_class ^TkTopLevel$
	Return
^+u::
	Send !c
	Send {Down 5}
	Send {Enter}
	Return
^+j::
	Send !c
	Send {Down 6}
	Send {Enter}
	Return

#IfWinActive
