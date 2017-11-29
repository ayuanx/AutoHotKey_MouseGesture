;;;;;;;;¡ý¡ý Initial Process ¡ý¡ý;;;;;;;;;;



;;;;;;;;¡ü¡ü Initial Process ¡ü¡ü;;;;;;;;;;
Goto,MG_User_End
;;;;;¡ý¡ý Subroutine Defination ¡ý¡ý;;;;;;;


; -- Self --  # Win, + Shift, ^ Ctrl, ! Alt

#\::Menu, TRAY, Show

#+\::
RunWait, Notepad %A_ScriptDir%\MG_User.ahk
Reload
Return

~CapsLock::		; Show CapsLock state on screen
if GetKeyState("CapsLock", "T")
	Progress, B1 W200 H28 ZH0 FS11 Y700 WS900 CTFF0000, CAPS LOCK ON
else
	Progress, B1 W200 H28 ZH0 FS11 WS900 Y700 CT0000FF, CAPS LOCK OFF
SetTimer, OSD_OFF, -2000
Return

~NumLock::		; Show NumLock state on screen
if GetKeyState("NumLock", "T")
	Progress, 0 B1 W200 H28 ZH0 FS11 WS900 Y700 CTFF0000, NUM LOCK ON
else
	Progress, 0 B1 W200 H28 ZH0 FS11 WS900 Y700 CT0000FF, NUM LOCK OFF
SetTimer, OSD_OFF, -2000
Return

OSD_OFF:
Progress, off
Return


; -- Mouse --

XButton2::Send ^c	; Copy
XButton1::Send ^v	; Paste

~MButton & WheelUp::Send, {WheelLeft}
~MButton & WheelDown::Send, {WheelRight}

+WheelUp::				; Scroll window under cursor without changing focus
MouseGetPos, , , , _id, 2
Loop 10  ; <-- Increase this value to scroll faster.
PostMessage, 0x115, 0, 0, , ahk_id %_id%  ; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.
Return

+WheelDown::				; Scroll window under cursor without changing focus
MouseGetPos, , , , _id, 2
Loop 10  ; <-- Increase this value to scroll faster.
PostMessage, 0x115, 1, 0, , ahk_id %_id%  ; 0x115 is WM_VSCROLL and the 1 after it is SB_LINEDOWN.
Return


; -- Win --

^!#k::WinKill, A		; Kill a process

#y::				; Show text from window for copy
WinGetText, _text, A
Clipboard := _text
Gui, Add, Edit, , %_text%
Gui, Show
Return
GuiEscape:
GuiClose:
Gui, Destroy
Return

#o::                ; Synchorinize dialog path
_path := ""
if WinExist("ahk_class CabinetWClass") {
    ControlGetText, _path, ToolbarWindow322
    _path := SubStr(_path, 10)
}
if _path {
    if WinExist("ahk_class #32770") {
        ControlGetText, _text, ToolbarWindow323
        if ErrorLevel {
            ControlFocus, Edit1
            ControlSetText, Edit1, %_path%
            ; ControlSend, Edit1, {Enter}
        }
        else if _text {
            ControlFocus, ToolbarWindow323
            ControlSend, ToolbarWindow323, {Space}
            ControlSetText, Edit2, %_path%
            ; ControlSend, Edit2, {Enter}
        }
        else {
            ControlFocus, ToolbarWindow322
            ControlSend, ToolbarWindow322, {Space}
            ControlSetText, Edit2, %_path%
            ; ControlSend, Edit2, {Enter}
        }
    }
    else
        Clipboard := _path
}
Return

#s::
WinGetClass, _path, A
if (_path = CabinetWClass) {	; Explorer
	ControlGetText, _path, ToolbarWindow322, A	
	_path := SubStr(_path, 10)
}
else
	_path := "C:\"
Run, cmd.exe, %_path%			; Command shell
Return

#+s::				; Open a CMD Window at current path as Elevated Admin
_path := "C:\"
if WinExist("ahk_class CabinetWClass") {
	ControlGetText, _path, ToolbarWindow322
	_path := SubStr(_path, 10)
}
Run, %A_ScriptDir%\_Admin_CMD.lnk /k pushd %_path%
Return

#z::Run, notepad.exe		; Notepad
#c::Run, calc.exe		; Caculator
#v::Run, sndvol.exe		; Volume Control
#g::Run, SnippingTool.exe	; Sinppling
#+g::Run, mspaint.exe		; Paint
#q::Run, regedit.exe		; Regedit

;;;;;¡ü¡ü Subroutine Defination ¡ü¡ü;;;;;;;
MG_User_End:
