#Include, %A_ScriptDir%

LastLangId := 0

Global KeyboardsData
Global LastLangId

InitKeyboardsData()
{
	KeyboardsData.RemoveAt(1)
	KeyboardsData.RemoveAt(KeyboardsData.Length())

	KeyboardKinds := ["Normal", "Left", "Right"]

	Loop, % KeyboardsData.Length()
	{
		D := KeyboardsData[A_Index]

		For K In D.Keyboards
		{
			If (Not FindKey(KeyboardKinds, K))
			{
				MsgBox, % "Invalid KeyboardsData.`nAll entries should exactly these keys:`n" . ToStringArray(KeyboardKinds)
				ExitApp, 1
			}
		}

		D.AllKeyboards := []
		D.CurrentKind := ""
		D.KindIndex := {}

		For I, K In KeyboardKinds
		{
			If (Not D.Keyboards.HasKey(K))
			{
				MsgBox, % "Invalid KeyboardsData.`nAll entries should exactly these keys:`n" . ToStringArray(KeyboardKinds)
				ExitApp, 1
			}

			PushRange(D.AllKeyboards, D.Keyboards[K])

			If (Not D.CurrentKind And D.Keyboards[K].Length() <> 0)
			{
				D.CurrentKind := K
			}

			D.KindIndex[K] := 1
		}

		If (D.AllKeyboards.Length() = 0 Or Not D.CurrentKind)
		{
			MsgBox, Invalid KeyboardsData.`nSome entries have no keyboards defined.
			ExitApp, 1
		}

		D.CurrentKeyboard := D.Keyboards[D.CurrentKind][D.KindIndex[D.CurrentKind]]
	}

	LastLangId := KeyboardsData[1].CurrentKeyboard
}

SetKeyboard(LangId)
{
	LastLangId := LangId
	PostMessage, 0x50, 0, %LangId%,, A
}

ToggleKeyboard(Kind)
{
	Loop, % KeyboardsData.Length()
	{
		I := A_Index
		D := KeyboardsData[I]
		If (FindKey(D.AllKeyboards, LastLangId))
		{
			Break
		}
		I := ""
	}

	If (Not I)
	{
		MsgBox, Invalid script state.
		Return
	}

	If (Not Kind)
	{
		I := Mod(I, KeyboardsData.Length()) + 1
		D := KeyboardsData[I]
		If (Not FindKey(D.AllKeyboards, D.CurrentKeyboard))
		{
			MsgBox, Invalid script state.
			Return
		}
		SetKeyboard(D.CurrentKeyboard)
		Return
	}

	S := D.Keyboards[Kind]
	J := D.KindIndex[Kind]

	If (Not J Or Not S)
	{
		MsgBox, Invalid script state.
		Return
	}
	If (S.Length() = 0)
	{
		MsgBox, No keyboards for '%Kind%'.
		Return
	}

	If (D.CurrentKind = Kind)
	{
		J := Mod(J, S.Length()) + 1
	}

	D.CurrentKind := Kind
	D.KindIndex[Kind] := J
	D.CurrentKeyboard := S[J]
	SetKeyboard(S[J])
}
