#Include, %A_ScriptDir%
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

F3:: Send, {Up}{End}{Left 2}
F4:: Send, {Down}{End}{Left 2}
