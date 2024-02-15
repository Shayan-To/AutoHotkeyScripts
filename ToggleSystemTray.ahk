SystemTrayHidden := 0

Global SystemTrayHidden

SetSystemTray(Shown)
{
	If (Shown)
	{
		Control, Show,, SysPager1, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
		Control, Show,, ToolbarWindow323, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
		WinShow, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		Control, Show,, ToolbarWindow321, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		WinHide, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
	}
	Else
	{
		WinShow, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		Control, Hide,, ToolbarWindow321, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		WinHide, ahk_class NotifyIconOverflowWindow ahk_exe Explorer.EXE
		Control, Hide,, ToolbarWindow323, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
		Control, Hide,, SysPager1, ahk_class Shell_TrayWnd ahk_exe Explorer.EXE
	}
}

ToggleSystemTray()
{
	SystemTrayHidden := !SystemTrayHidden
	SetSystemTray(!SystemTrayHidden)
}

#Esc::ToggleSystemTray()

~#^Right::SetSystemTray(0)
~#^Left::SetSystemTray(1)
