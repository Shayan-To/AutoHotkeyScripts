#Include, %A_ScriptDir%
#InstallKeybdHook
#SingleInstance, Force

SetTitleMatchMode, RegEx

#If, WinActive("ahk_class ^PotPlayer$")

$SC00C::Send, {-}
$SC00D::Send, {=}

$SC010::Send, {q}
$SC011::Send, {w}
$SC012::Send, {e}
$SC013::Send, {r}
$SC014::Send, {t}
$SC015::Send, {y}
$SC016::Send, {u}
$SC017::Send, {i}
$SC018::Send, {o}
$SC019::Send, {p}
$SC01A::Send, {[}
$SC01B::Send, {]}

$SC01E::Send, {a}
$SC01F::Send, {s}
$SC020::Send, {d}
$SC021::Send, {f}
$SC022::Send, {g}
$SC023::Send, {h}
$SC024::Send, {j}
$SC025::Send, {k}
$SC026::Send, {l}
$SC027::Send, {;}
$SC028::Send, {'}

$SC02C::Send, {z}
$SC02D::Send, {x}
$SC02E::Send, {c}
$SC02F::Send, {v}
$SC030::Send, {b}
$SC031::Send, {n}
$SC032::Send, {m}
$SC033::Send, {,}
$SC034::Send, {.}
$SC035::Send, {/}

#If,
