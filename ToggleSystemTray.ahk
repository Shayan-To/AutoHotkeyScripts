SystemTrayHidden := 0

Global SystemTrayHidden

ToggleSystemTray() {
	SystemTrayHidden := !SystemTrayHidden
	If (SystemTrayHidden)
	{
		Control, Hide,, ToolbarWindow323, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
		Control, Hide,, SysPager1, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
	}
	Else
	{
		Control, Show,, SysPager1, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
		Control, Show,, ToolbarWindow323, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
	}
}

#Esc::ToggleSystemTray()
