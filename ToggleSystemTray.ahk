SystemTrayHidden := 0

Global SystemTrayHidden

ToggleSystemTray() {
	SystemTrayHidden := !SystemTrayHidden
	If (SystemTrayHidden)
	{
		WinShow, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		Control, Hide,, ToolbarWindow321, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		WinHide, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		Control, Hide,, ToolbarWindow323, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
		Control, Hide,, SysPager1, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
	}
	Else
	{
		Control, Show,, SysPager1, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
		Control, Show,, ToolbarWindow323, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
		WinShow, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		Control, Show,, ToolbarWindow321, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		WinHide, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
	}
}

#Esc::ToggleSystemTray()
