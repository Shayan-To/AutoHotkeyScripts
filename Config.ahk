#Include, %A_ScriptDir%

; ====================================================================

WinZPlayerPlayPause := 1
GitGuiHotkeysFix := 1
ReverseDirectionalFormattingChars := 0

DisableInsert := 1
FixPersianSymbolKeys := 1
BackTickLanguageChange := 1

; ====================================================================

Lang_Eng := 0x0409
Lang_Pes := 0x0429
Lang_Arb := 0x0401

Prefix := ~0x1FFFFFFFF | 0x100000000

Keybd_Eng_US := 0x04090409
Keybd_Eng_DV := Prefix | 0xF0020409
Keybd_Eng_DVL := Prefix | 0xF01A0409
Keybd_Eng_DVR := Prefix | 0xF01B0409
Keybd_Pes := 0x04290429
Keybd_Pes_Std := Prefix | 0xF03A0429
Keybd_Arb_101 := 0x04010401

KeyboardsData := [{}
	,{Keyboards: {Normal: [Keybd_Eng_DV, Keybd_Eng_US]
			,Left: [Keybd_Eng_DVL]
			,Right: [Keybd_Eng_DVR]}}
	,{Keyboards: {Normal: [Keybd_Pes_Std, Keybd_Pes, Keybd_Arb_101]
			,Left: []
			,Right: []}}
,{}]
