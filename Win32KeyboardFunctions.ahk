#Include, %A_ScriptDir%

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
		MsgBox, Error.
	}
}
