#Include %A_ScriptDir%
#InstallKeybdHook
#SingleInstance Force
SetTitleMatchMode, RegEx
SetCapsLockState, AlwaysOff

; ====================================================================

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

InitKeyboardLayoutChange()
{
	Static IsInitialized := 0
	If (IsInitialized = 0)
	{
		DllCall("Ole32.dll\OleInitialize", "Ptr", 0, "Int")
		DllCall("LoadKeyboardLayout", "Str", "00020409", "Int")
		IsInitialized = 1
	}
}

ActivateKeyboardLayout(HKL) ; This does not work.
{
	InitKeyboardLayoutChange()
	T := DllCall("ActivateKeyboardLayout", "UInt", HKL, "UInt", 0x00000000, "PTR")
	If (!T)
	{
		MsgBox, Error
	}
}

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

LastLangId := Keybd_Eng_DV

Global Lang_Eng, Lang_Pes, Lang_Arb
Global Keybd_Eng_US, Keybd_Eng_DV, Keybd_Eng_DVL, Keybd_Eng_DVR, Keybd_Pes, Keybd_Pes_Std, Keybd_Arb_101
Global LastLangId

SetKeyboard(LangId)
{
	LastLangId := LangId
	PostMessage, 0x50, 0, %LangId%,, A
}

ToggleLanguage()
{
	Lang := LastLangId & 0xFFFF
	If (Lang = Lang_Eng)
	{
		SetKeyboard(Keybd_Pes_Std)
	}
	Else If (Lang = Lang_Pes Or Lang = Lang_Arb)
	{
		SetKeyboard(Keybd_Eng_DV)
	}
	Else
	{
		MsgBox Unknown language.
	}
}

ToggleKeyboard(Direction)
{
	Lang := LastLangId & 0xFFFF
	If (Lang = Lang_Eng)
	{
		If (Direction <> "")
		{
			If (Direction = "Left")
			{
				SetKeyboard(Keybd_Eng_DVL)
			}
			Else If (Direction = "Right")
			{
				SetKeyboard(Keybd_Eng_DVR)
			}
			Else
			{
				MsgBox Invalid Direction.
			}
		}
		Else
		{
			If (LastLangId = Keybd_Eng_US)
			{
				SetKeyboard(Keybd_Eng_DV)
			}
			Else If (LastLangId = Keybd_Eng_DV Or LastLangId = Keybd_Eng_DVL Or LastLangId = Keybd_Eng_DVR)
			{
				SetKeyboard(Keybd_Eng_US)
			}
			Else
			{
				MsgBox Unknown keyboard.
			}
		}
	}
	Else If (Lang = Lang_Pes Or Lang = Lang_Arb)
	{
		If (Direction <> "")
		{
			MsgBox No directional keyboard defined.
		}
		Else
		{
			If (LastLangId = Keybd_Pes_Std)
			{
				SetKeyboard(Keybd_Pes)
			}
			Else If (LastLangId = Keybd_Pes)
			{
				SetKeyboard(Keybd_Arb_101)
			}
			Else If (LastLangId = Keybd_Arb_101)
			{
				SetKeyboard(Keybd_Pes_Std)
			}
			Else
			{
				MsgBox Unknown keyboard.
			}
		}
	}
	Else
	{
		MsgBox Unknown language.
	}
}

; ====================================================================

BTickLangChange := 1

; ====================================================================

#SC01F::Send {Media_Play_Pause}

$+1::Send {!}
$+2::Send {@}
$+3::Send {#}
$+4::Send {$}
$+5::Send {`%}
$+6::Send {^}
;$+7::Send {&}
$+8::Send {*}

$`::
	Send {``}
	If (BTickLangChange = 1)
	{
		ToggleLanguage()
	}
	Return

; ====================================================================

Capslock::
	ToggleLanguage()
	Return

<^Capslock::
	ToggleKeyboard("Left")
	Return

>^Capslock::
	ToggleKeyboard("Right")
	Return

+Capslock::
	ToggleKeyboard("")
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

; ====================================================================

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
