#Include, %A_ScriptDir%

FindKey(Object, Element)
{
	For K, V In Object
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
	Loop, % Other.Length()
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
		; Return Obj
		Return Format("0x{1:016X}", Obj)
	}
	R .= "`n" . Indent . "}"
	Return R
}

ToStringArray(Array)
{
	R := "["

	Bl := 0

	Loop % Array.Length()
	{
		If (Bl = 1)
		{
			R .= ", "
		}
		Bl := 1
		R .= ToStringImpl(Array[A_Index], "    ")
	}

	Return R . "]"
}

ReadLine(File)
{
    T :=  File.ReadLine()
    If (SubStr(T, StrLen(T)) = "`n")
    {
        T := SubStr(T, 1, StrLen(T) - 1)
    }
    If (SubStr(T, StrLen(T)) = "`r")
    {
        T := SubStr(T, 1, StrLen(T) - 1)
    }
    Return T
}
