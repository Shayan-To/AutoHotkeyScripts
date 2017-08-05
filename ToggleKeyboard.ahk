#Include %A_ScriptDir%

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
