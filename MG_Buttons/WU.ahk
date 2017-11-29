Goto,MG_WU_End

MG_WU_Enable:
	Hotkey,*WheelUp,MG_WU_Hotkey,On
return

MG_WU_Disable:
	Hotkey,*WheelUp,MG_WU_Hotkey,Off
return

MG_WU_Hotkey:
	MG_ButtonPress("WU")
return

MG_WU_Press:
	SetMouseDelay,-1
	Send,{Blind}{WheelUp}
return

MG_WU_End:
