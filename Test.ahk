; *F1::
; 	return

; *F1 Up::
; 	MsgBox, % A_PriorHotkey
; 	return

A := ~0x1FFFFFFFF | 0x100000000

Pre = ~0x1FFFFFFFF | 0x100000000

Keybd_Eng_US := 0x04090409
Keybd_Eng_DV := Pre | 0xF0020409
Keybd_Eng_DVL := Pre | 0xF01A0409
Keybd_Eng_DVR := Pre | 0xF01B0409
Keybd_Pes := 0x04290429
Keybd_Pes_Std := Pre | 0xF03A0429
Keybd_Arb_101 := 0x04010401

H := Format("{1:016X}", Pre)
MsgBox %H%
