#Include, %A_ScriptDir%

; ====================================================================

InsertDirectionalMark(Key)
{
	S := 1
	C := 2
	A := 3
	Modifiers := GetKeyState("Alt") * A + GetKeyState("Control") * C + GetKeyState("Shift") * S

	If (Modifiers = 0)
	{
		If (Key = "Left")
		{
			Send, {U+200E} ; LRM  LEFT-TO-RIGHT MARK
		}
		Else If (Key = "Right")
		{
			Send, {U+200F} ; RLM  RIGHT-TO-LEFT MARK
		}
	}
	Else If (Modifiers = S)
	{
		If (Key = "Left")
		{
			Send, {U+202A} ; LRE  LEFT-TO-RIGHT EMBEDDING
		}
		Else If (Key = "Right")
		{
			Send, {U+202B} ; RLE  RIGHT-TO-LEFT EMBEDDING
		}
		Else If (Key = "Up")
		{
			Send, {U+202C} ; PDF  POP DIRECTIONAL FORMATTING
		}
	}
	Else If (Modifiers = C)
	{
		If (Key = "Left")
		{
			Send, {U+2066} ; LRI  LEFT-TO-RIGHT ISOLATE
		}
		Else If (Key = "Right")
		{
			Send, {U+2067} ; RLI  RIGHT-TO-LEFT ISOLATE
		}
		Else If (Key = "Down")
		{
			Send, {U+2068} ; FSI  FIRST STRONG ISOLATE
		}
		Else If (Key = "Up")
		{
			Send, {U+2069} ; PDI  POP DIRECTIONAL ISOLATE
		}
	}
	Else If (Modifiers = A)
	{
		If (Key = "Left")
		{
			Send, {U+202D} ; LRO  LEFT-TO-RIGHT OVERRIDE
		}
		Else If (Key = "Right")
		{
			Send, {U+202E} ; RLO  RIGHT-TO-LEFT OVERRIDE
		}
		Else If (Key = "Up")
		{
			Send, {U+202C} ; PDF  POP DIRECTIONAL FORMATTING
		}
	}
}

; Abbr.    Code Point    Name                          Description
; LRE      U+202A        LEFT-TO-RIGHT EMBEDDING       Treat the following text as embedded left-to-right.
; RLE      U+202B        RIGHT-TO-LEFT EMBEDDING       Treat the following text as embedded right-to-left.

; LRO      U+202D        LEFT-TO-RIGHT OVERRIDE        Force following characters to be treated as strong left-to-right characters.
; RLO      U+202E        RIGHT-TO-LEFT OVERRIDE        Force following characters to be treated as strong right-to-left characters.

; PDF      U+202C        POP DIRECTIONAL FORMATTING    End the scope of the last LRE, RLE, RLO, or LRO.

; LRI      U+2066        LEFT-TO-RIGHT ISOLATE         Treat the following text as isolated and left-to-right.
; RLI      U+2067        RIGHT-TO-LEFT ISOLATE         Treat the following text as isolated and right-to-left.
; FSI      U+2068        FIRST STRONG ISOLATE          Treat the following text as isolated and in the direction of its first strong directional character that is not inside a nested isolate.

; PDI      U+2069        POP DIRECTIONAL ISOLATE       End the scope of the last LRI, RLI, or FSI.

; LRM      U+200E        LEFT-TO-RIGHT MARK            Left-to-right zero-width character.
; RLM      U+200F        RIGHT-TO-LEFT MARK            Right-to-left zero-width non-Arabic character.
; ALM      U+061C        ARABIC LETTER MARK            Right-to-left zero-width Arabic character.
