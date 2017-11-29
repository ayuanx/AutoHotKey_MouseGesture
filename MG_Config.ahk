MG_Interval:=20
MG_TimeoutThreshold:=10
MG_Timeout:=1000
MG_Threshold:=30
MG_DGInterval:=0
MG_LongThresholdX:=800
MG_LongThresholdY:=600
MG_LongThreshold:=700
MG_8Dir:=1
MG_UseNavi:=0
MG_UseExNavi:=0
MG_EditCommand:=
MG_ActiveAsTarget:=0
MG_TraySubmenu:=0
MG_ORangeDefault:=4
MG_ORangeA:=1
MG_ORangeB:=5
MG_MaxLength=6
MG_Triggers=MB
MG_SubTriggers=LB_RB_WU_WD


Goto,MG_MB_End

MG_MB_Enable:
	Hotkey,*MButton,MG_MB_DownHotkey,On
	Hotkey,*MButton up,MG_MB_UpHotkey,On
return

MG_MB_Disable:
	Hotkey,*MButton,MG_MB_DownHotkey,Off
	Hotkey,*MButton up,MG_MB_UpHotkey,Off
return

MG_MB_DownHotkey:
	MG_TriggerDown("MB")
return

MG_MB_UpHotkey:
	MG_TriggerUp("MB")
return

MG_MB_Down:
	SetMouseDelay,-1
	Send,{Blind}{MButton Down}
return

MG_MB_Up:
	SetMouseDelay,-1
	Send,{Blind}{MButton Up}
return

MG_MB_End:


Goto,MG_LB_End

MG_LB_Enable:
	Hotkey,*LButton,MG_LB_DownHotkey,On
	Hotkey,*LButton up,MG_LB_UpHotkey,On
return

MG_LB_Disable:
	Hotkey,*LButton,MG_LB_DownHotkey,Off
	Hotkey,*LButton up,MG_LB_UpHotkey,Off
return

MG_LB_DownHotkey:
	MG_TriggerDown("LB")
return

MG_LB_UpHotkey:
	MG_TriggerUp("LB")
return

MG_LB_Down:
	SetMouseDelay,-1
	Send,{Blind}{LButton Down}
return

MG_LB_Up:
	SetMouseDelay,-1
	Send,{Blind}{LButton Up}
return

MG_LB_End:


Goto,MG_RB_End

MG_RB_Enable:
	Hotkey,*RButton,MG_RB_DownHotkey,On
	Hotkey,*RButton up,MG_RB_UpHotkey,On
return

MG_RB_Disable:
	Hotkey,*RButton,MG_RB_DownHotkey,Off
	Hotkey,*RButton up,MG_RB_UpHotkey,Off
return

MG_RB_DownHotkey:
	MG_TriggerDown("RB")
return

MG_RB_UpHotkey:
	MG_TriggerUp("RB")
return

MG_RB_Down:
	SetMouseDelay,-1
	Send,{Blind}{RButton Down}
return

MG_RB_Up:
	SetMouseDelay,-1
	Send,{Blind}{RButton Up}
return

MG_RB_End:


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


Goto,MG_WD_End

MG_WD_Enable:
	Hotkey,*WheelDown,MG_WD_Hotkey,On
return

MG_WD_Disable:
	Hotkey,*WheelDown,MG_WD_Hotkey,Off
return

MG_WD_Hotkey:
	MG_ButtonPress("WD")
return

MG_WD_Press:
	SetMouseDelay,-1
	Send,{Blind}{WheelDown}
return

MG_WD_End:


Goto,MG_Config_End


MG_IsDisable(){
	global
	return (0)
}

MG_IsEditor(){
	global
	return ((MG_CClass="Edit")||(MG_CClass="TEdit"))
}

MG_IsBrowser(){
	global
	return ((MG_CClass="Internet Explorer_Server")||(MG_CClass="MozillaWindowClass")||(MG_CClass="OperaWindowClass")||(MG_CClass="WebViewWindowClass")||(MG_CClass="Chrome_RenderWidgetHostHWND"))
}

MG_IsCommandPrompt(){
	global
	return ((MG_WClass="ConsoleWindowClass"))
}

MG_IsMenu(){
	global
	return ((MG_WClass="#32768"))
}

MG_IsFileDialog(){
	global
	return ((MG_WClass="#32770"))
}

MG_IsMaximized(){
	global
	return ((MG_Win("MinMax")=1))
}

MG_IsExScroll(){
	global
	return ((MG_WClass="MozillaWindowClass")||(MG_WClass="MozillaDialogClass")||(MG_WClass="MediaPlayerClassicW")||(MG_WClass="wxWindowClassNR")||(MG_WClass="OpusApp")||(MG_WClass="Vim")||(MG_WClass="TTelnetForm")||(MG_WClass="fengyue")||(MG_CClass="DirectUIHWND"))
}

MG_IsExMinimize(){
	global
	return ((MG_WClass="TTelnetForm"))
}

MG_IsVNC(){
	global
	return ((MG_Exe="vcxsrv.exe")||(MG_WClass="VcXsrv/x"))
}

MG_Gesture_MB_8_:
	Send,{Home}
return

MG_Gesture_MB_2_:
	Send,{End}
return

MG_Gesture_MB_82_:
	Send,{F5}
return

MG_Gesture_MB_4_:
	Send,^{c}
return

MG_Gesture_MB_6_:
	Send,^{v}
return

MG_Gesture_MB_46_:
	Send,^{x}
return

MG_Gesture_MB_7_:
	Send,^{c}
return

MG_Gesture_MB_3_:
	Send,^{v}
return

MG_Gesture_MB_73_:
	Send,^{x}
return

MG_Gesture_MB_9_:
	if(MG_IsVNC()){
		Send,!{F10}
	}else if(MG_IsMaximized()){
		WinRestore
	}else{
		WinMaximize
	}
return

MG_Gesture_MB_1_:
	if(MG_IsVNC()){
		MG_Abort()
	}else if(MG_IsExMinimize()){
		PostMessage, 0x112, 0xF020, , , A
	}else{
		WinMinimize
	}
return

MG_Gesture_MB_19_:
	Send,#{d}
return

MG_Gesture_MB_84_:
	Send,!{Left}
return

MG_Gesture_MB_86_:
	Send,!{Right}
return

MG_Gesture_MB_24_:
	Send,^{F4}
return

MG_Gesture_MB_26_:
	if(MG_IsVNC()){
		Send,!{F4}
	}else{
		WinClose
	}
return

MG_Gesture_MB_LB_:
	Send,{PgDn}
return

MG_Gesture_MB_RB_:
	Send,{PgUp}
return

MG_Gesture_MB_WU_:
	Send,{WheelLeft}
return

MG_Gesture_MB_WD_:
	Send,{WheelRight}
return


MG_Config_end: