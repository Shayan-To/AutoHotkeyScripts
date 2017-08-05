#Include %A_ScriptDir%
#InstallKeybdHook
#SingleInstance Force
SetTitleMatchMode, RegEx
SetCapsLockState, AlwaysOff

; ====================================================================

FindKey(Array, Element)
{
	For K, V In Array
	{
		If (Element = V)
		{
			Return K
		}
	}
	Return False
}

Count(Object)
{
	R := 0
	For K In Object
	{
		R += 1
	}
	Return R
}

PushRange(Array, Other)
{
	Loop % Other.Length()
	{
		Array.Push(Other[A_Index])
	}
}

ToString(Obj)
{
	Return ToStringImpl(Obj, "")
}

ToStringImpl(Obj, Indent)
{
	R := ""

	For K, V In Obj
	{
		If (!R)
		{
			R .= "{`n    " . Indent
		}
		Else
		{
			R .= ",`n    " . Indent
		}
		R .= K . ": " . ToStringImpl(V, Indent . "    ")
	}
	If (!R)
	{
		Return Obj
	}
	R .= "`n" . Indent . "}"
	Return R
}

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

KeyboardsData := [{}
	,{Keyboards: {Normal: [Keybd_Eng_DV, Keybd_Eng_US]
			,Left: [Keybd_Eng_DVL]
			,Right: [Keybd_Eng_DVR]}}
	,{Keyboards: {Normal: [Keybd_Pes_Std, Keybd_Pes, Keybd_Arb_101]
			,Left: []
			,Right: []}}
,{}]

LastLangId := 0

Global KeyboardsData
Global LastLangId

InitKeyboardsData()
{
	KeyboardsData.RemoveAt(1)
	KeyboardsData.RemoveAt(KeyboardsData.Length())

	Loop % KeyboardsData.Length()
	{
		D := KeyboardsData[A_Index]

		D.AllKeyboards := []

		If (Not (D.Keyboards.HasKey("Normal") And D.Keyboards.HasKey("Left") And D.Keyboards.HasKey("Right") And Count(D.Keyboards) = 3))
		{
			MsgBox, % "Keyboards does not have all the 'Normal', 'Left' and 'Right' keys or has extra keys."
			ExitApp, 1
		}

		For K, L In D.Keyboards
		{
			PushRange(D.AllKeyboards, L)
		}
	}

	SetKeyboard(KeyboardsData[1].Keyboards["Normal"][1])
}

SetKeyboard(LangId)
{
	LastLangId := LangId
	PostMessage, 0x50, 0, %LangId%,, A
}

ToggleKeyboard(Kind)
{
	Loop % KeyboardsData.Length()
	{
		I := A_Index
		D := KeyboardsData[I]
		If (FindKey(D.AllKeyboards, LastLangId))
		{
			Break
		}
	}

	If (!I)
	{
		MsgBox, Invalid script state.
		Return
	}

	If (!Kind)
	{
		I := Mod(I, KeyboardsData.Length()) + 1
		D := KeyboardsData[I]
		SetKeyboard(D.Keyboards["Normal"][1])
		Return
	}

	S := D.Keyboards[Kind]

	If (S.Length() = 0)
	{
		MsgBox, No keyboards for '%Kind%'.
	}

	J := FindKey(S, LastLangId)
	If (!J)
	{
		J := 0
	}
	J := Mod(J, S.Length()) + 1
	SetKeyboard(S[J])
}

InitKeyboardsData()

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
		ToggleKeyboard("")
	}
	Return

; ====================================================================

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
