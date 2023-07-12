#Include, %A_ScriptDir%
#InstallKeybdHook
#SingleInstance, Force

SetTitleMatchMode, RegEx

#F1::
	IfWinActive, ahk_class PotPlayer64
	{
		WinActivate, ahk_id %ActiveWindowId%
	}
	Else
	{
		WinGet, ActiveWindowId, ID, A
		WinActivate, ahk_class PotPlayer64
	}
	Return

#If, WinActive("ahk_exe YACReader.exe")
Up::Send, {WheelUp}
Down::Send, {WheelDown}

#If, WinActive("ahk_exe GoldenDict.exe")
Escape::Send, !{F4}

#If, WinActive("ahk_class ^PotPlayer(64)?$")

$SC00C::-
$SC00D::=

$SC010::q
$SC011::w
$SC012::e
$SC013::r
$SC014::t
$SC015::y
$SC016::u
$SC017::i
$SC018::o
$SC019::p
$SC01A::[
$SC01B::]

$SC01E::a
$SC01F::s
$SC020::d
$SC021::f
$SC022::g
$SC023::h
$SC024::j
$SC025::k
$SC026::l
$SC027::;
$SC028::'

$SC02C::z
$SC02D::x
$SC02E::c
$SC02F::v
$SC030::b
$SC031::n
$SC032::m
$SC033::,
$SC034::.
$SC035::/

#If,
