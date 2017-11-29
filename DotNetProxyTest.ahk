List := [0x04090409
		,0xF0020409
		,0xF01A0409
		,0xF01B0409
		,0x04290429
		,0xF03A0429
		,0x04010401]

DllCall("LoadLibrary", "Str", "DotNetProxy.dll", "Ptr")  

For I, K In List
{
	;Sleep, 500
	Name := DllCall("DotNetProxy\GetName", "Int", K, "WStr")
	;A := DllCall("DotNetProxy\Test", "Int")
	Suc := DllCall("DotNetProxy\SetLanguage", "Int", K, "Int")
	MsgBox, K:%K% E:%ErrorLevel% R:%Name% A:%A% Suc:%Suc%
}
