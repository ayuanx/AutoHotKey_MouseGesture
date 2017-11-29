Goto,MG_X2B_End

MG_X2B_Enable:
	Hotkey,*XButton2,MG_X2B_DownHotkey,On
	Hotkey,*XButton2 up,MG_X2B_UpHotkey,On
return

MG_X2B_Disable:
	Hotkey,*XButton2,MG_X2B_DownHotkey,Off
	Hotkey,*XButton2 up,MG_X2B_UpHotkey,Off
return

MG_X2B_DownHotkey:
	MG_TriggerDown("X2B")
return

MG_X2B_UpHotkey:
	MG_TriggerUp("X2B")
return

MG_X2B_Down:
	SetMouseDelay,-1
	Send,{Blind}{XButton2 Down}
return

MG_X2B_Up:
	SetMouseDelay,-1
	Send,{Blind}{XButton2 Up}
return

MG_X2B_End:
