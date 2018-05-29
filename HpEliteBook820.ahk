#Include, %A_ScriptDir%
#InstallKeybdHook
#SingleInstance, Force

Capslock & ScrollLock:: Send, {ScrollLock}
Capslock & Pause:: Send, {Pause}
ScrollLock:: Home
Pause:: End

Insert & Backspace:: Send, {AppsKey}
Insert:: Insert
