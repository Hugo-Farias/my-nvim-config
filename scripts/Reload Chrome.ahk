; save currently focused window
; WinGet, prevWin, ID, A

; do your chrome stuff
; ControlFocus, Chrome_RenderWidgetHostHWND1, ahk_exe chrome.exe
; ControlSend, ahk_parent, {F5}, ahk_exe chrome.exe
; ControlFocus, CASCADIA_HOSTING_WINDOW_CLASS, ahk_exe WindowsTerminal.exe

; restore focus
; WinActivate, ahk_id %prevWin%

; Send: F21+L, F21+K, F5, F21+H

Send, {F21 down}l{F21 up}

Send, {F21 down}k{F21 up}

Send, {F5}

Send, {F21 down}j{F21 up}
Send, {F21 down}h{F21 up}
