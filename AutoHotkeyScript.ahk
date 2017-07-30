#InstallKeybdHook
#SingleInstance Force

; ahk_class PotPlayer

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

Capslock::
	SetCapsLockState, Off
	If (Lang = 0)
	{
		PostMessage, 0x50, 0, 0xF0020409,, A
		Lang := 1
	}
	Else
	{
		PostMessage, 0x50, 0, 0xF03A0429,, A
		Lang := 0
	}
	Return

<^Capslock::
	SetCapsLockState, Off
	PostMessage, 0x50, 0, 0xF01A0409,, A
	Return

>^Capslock::
	SetCapsLockState, Off
	PostMessage, 0x50, 0, 0xF01B0409,, A
	Return

!Capslock::
	T := GetKeyboardLayout()
	H := Format("{1:X}", T)
	MsgBox, %T% %H%
	Return

Temp()
{
	;^1:: ; This line is commented out.
		T := GetKeyboardLayout()
		H := Format("{1:X}", T)
		MsgBox, %T% %H%
		Return

	;^2:: ; This line is commented out.
		;ActivateKeyboardLayout(0xF0020409)
		PostMessage, 0x50, 0, 0xF0020409,, A
		MsgBox, Done.
		Return
}
