Goto,MG_X1B_End

MG_X1B_Enable:
	Hotkey,*XButton1,MG_X1B_DownHotkey,On
	Hotkey,*XButton1 up,MG_X1B_UpHotkey,On
return

MG_X1B_Disable:
	Hotkey,*XButton1,MG_X1B_DownHotkey,Off
	Hotkey,*XButton1 up,MG_X1B_UpHotkey,Off
return

MG_X1B_DownHotkey:
	MG_TriggerDown("X1B")
return

MG_X1B_UpHotkey:
	MG_TriggerUp("X1B")
return

MG_X1B_Down:
	SetMouseDelay,-1
	Send,{Blind}{XButton1 Down}
return

MG_X1B_Up:
	SetMouseDelay,-1
	Send,{Blind}{XButton1 Up}
return

MG_X1B_End:
