#Include, %A_ScriptDir%
#InstallKeybdHook
#SingleInstance, Force

#Include, CommonObjectFunctions.ahk
#Include, Win32KeyboardFunctions.ahk
#Include, ToggleKeyboard.ahk
#Include, DirectionalFormatting.ahk

; ====================================================================

#Include, Config.ahk

ToggleKeyboard2(Kind)
{
	FileAppend, BToggle %LastLangId%`n, Log.log
	ToggleKeyboard(Kind)
	FileAppend, AToggle %LastLangId%`n, Log.log
	; SaveStateToFile("State.txt")
	; Reload
}

InitKeyboardsData()

FileAppend, Begin %LastLangId%`n, Log.log

If (FileExist("State.txt"))
{
	LoadStateFromFile("State.txt")
	FileAppend, After load %LastLangId%`n, Log.log
	; FileDelete, State.txt
}

SetTitleMatchMode, RegEx
SetCapsLockState, AlwaysOff

; ====================================================================

#If, WinZPlayerPlayPause = 1

; Win+; (Qwerty Z)
$#SC02C::Send, {Media_Play_Pause}
; Win+A
; $#SC01E::Send, {Media_Play_Pause}

#If, FixPersianSymbolKeys = 1

$+SC029:: Send, {~}
$+SC002:: Send, {!}
$+SC003:: Send, {@}
$+SC004:: Send, {#}
$+SC005:: Send, {$}
;$+SC006:: Send, {`%}
$+SC007:: Send, {^}
;$+SC008:: Send, {&}
$+SC009:: Send, {*}

#If, DisableInsert = 1

Insert::Return

#If,

; ====================================================================

#If, BackTickLanguageChange = 1 Or FixPersianSymbolKeys = 1

; BackTick (`)
$SC029::
	Send, {``}
	If (BackTickLanguageChange = 1)
	{
		ToggleKeyboard2("")
	}
	Return

#If,

CapsLock & Left:: InsertDirectionalMark("Left")
CapsLock & Right:: InsertDirectionalMark("Right")
CapsLock & Down:: InsertDirectionalMark("Down")
CapsLock & Up:: InsertDirectionalMark("Up")

Global CapsDownTime

*CapsLock::
	CapsDownTime := A_TickCount
	Return

; *CapsLock Down:: Return

*CapsLock Up::
	If (A_PriorHotkey <> "*CapsLock" Or A_TickCount - CapsDownTime > 300) ;A_TimeSincePriorHotkey > 300)
	{
		Return
	}

	S := 1
	LC := 2
	RC := 4
	A := 8
	Modifiers := GetKeyState("Alt") * A + GetKeyState("LControl") * LC + GetKeyState("RControl") * RC + GetKeyState("Shift") * S

	If (Modifiers = 0)
	{
		ToggleKeyboard2("")
	}
	Else If (Modifiers = S)
	{
		ToggleKeyboard2("Normal")
	}
	Else If (Modifiers = LC)
	{
		ToggleKeyboard2("Left")
	}
	Else If (Modifiers = RC)
	{
		ToggleKeyboard2("Right")
	}
	Else If (Modifiers = A)
	{
		; T := GetKeyboardLayout()
		; H := Format("{1:016X}", T)
		; H := SubStr(H, 9)
		; MsgBox, 0x%H%
		T := Lyt.GetList()
		H := ""
		Loop % T.MaxIndex()
			H .= A_Index ": " T[A_Index].LocName " - " T[A_Index].LayoutName
				. "`n" Format("{:#010x}", T[A_Index].hkl) "`n"
		H .= "`n`n" ToString(KeyboardsData)
		MsgBox, %H%
	}

	Return

CapsLock & Tab::
	If (GetKeyState("CapsLock", "T") = 1)
	{
		SetCapsLockState, AlwaysOff
	}
	Else
	{
		SetCapsLockState, AlwaysOn
	}
	Return

; CL + BackTick (`)
CapsLock & SC029::
	BackTickLanguageChange := 1 - BackTickLanguageChange
	MsgBox, BackTickLanguageChange = %BackTickLanguageChange%
	Return

CapsLock & Insert::
	DisableInsert := 1 - DisableInsert
	MsgBox, DisableInsert = %DisableInsert%
	Return

CapsLock & \::
	FixPersianSymbolKeys := 1 - FixPersianSymbolKeys
	MsgBox, FixPersianSymbolKeys = %FixPersianSymbolKeys%
	Return

; ====================================================================

; CapsLock & Space:: Send {Blind}{Enter}
; CapsLock & SC028:: Send {Blind}{Enter}

; CapsLock & SC022:: Send {Blind}{sc014}
; CapsLock & SC023:: Send {Blind}{sc015}

; CapsLock & SC01E:: Send {Blind}{sc02C}
; CapsLock & SC01F:: Send {Blind}{sc02D}
; CapsLock & SC020:: Send {Blind}{sc02E}

; CapsLock & SC01B:: Send {Blind}{sc02B}

; CapsLock & SC025:: Send {Blind}{sc033}
; CapsLock & SC026:: Send {Blind}{sc034}

; ^+SC035:: Send ^{sc034}

; ====================================================================

;#Include, GitGui.ahk
#Include, Explorer.ahk
