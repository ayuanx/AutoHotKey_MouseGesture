MG_Init:

; Default values of manual settings
MG_ExNaviFG=000000
MG_ExNaviBG=
MG_ExNaviSpacing=2
MG_ExNaviPadding=4
MG_ExNaviMargin=8
MG_ExNaviSize=24


#Include *i %A_ScriptDir%\MG_Config.ahk
#Include *i %A_ScriptDir%\MG_User.ahk

Process,Priority,,High
if(MG_TraySubmenu){
	MG_MenuName=MGMenu
	Menu,MGMenu,Add,&Enable Gesture,MG_ToggleEnable
	Menu,MGMenu,Add,Show Gesture &Hints,MG_NaviToggleEnable
	Menu,MGMenu,Add,Edit &User Extension Script,MG_EditUser
	Menu,MGMenu,Add,Gesture &Reload,MG_Reload
	Menu,MGMenu,Add,Gesture &Configuration,MG_Edit
	if(MG_MenuParent){
		MM_Name:=MG_MenuParent
	}
	if(MM_Name){
		Menu,%MM_Name%,Add,&Mouse Gesture,:MGMenu
	}else{
		Menu,Tray,NoStandard
		Menu,Tray,Add,&Mouse Gesture,:MGMenu
		Menu,Tray,Add
		Menu,Tray,Standard
	}
}else{
	MG_MenuName=Tray
	Menu,Tray,NoStandard
	Menu,Tray,Add,&Enable Gesture,MG_ToggleEnable
	Menu,Tray,Add,Show Gesture &Hints,MG_NaviToggleEnable
	Menu,Tray,Add,Edit &User Extension Script,MG_EditUser
	Menu,Tray,Add,Gesture &Reload,MG_Reload
	Menu,Tray,Add,Gesture &Configuration,MG_Edit
	Menu,Tray,Add
	Menu,Tray,Standard
}

; Initial values
MG_TriggerCount=0
MG_Active=0
MG_Executed=0
MG_TimedOut=0
MG_LastTime=0
MG_ORange=0.3926990817
MG_ORange1=0
MG_ORange2=0.2617993878
MG_ORange3=0.3926990817
MG_ORange4=0.5235987756
MG_ORange5=0.7854

GoSub,MG_Enable
if(MG_UseNavi){
	Gosub,MG_NaviToggleEnable
}

if A_ThisLabel=MG_Init
	return
else
	Goto,MG_End

MG_NaviToggleEnable:
	MG_NaviEnabled:=!MG_NaviEnabled
	Menu,%MG_MenuName%,% MG_NaviEnabled ? "Check" : "Uncheck" ,Show Gesture &Hints
	if(MG_UseExNavi){
		if(MG_NaviEnabled){
			MG_CreateExNavi()
		}else{
			MG_DestroyExNavi()
		}
	}else{
		if(MG_NaviEnabled){
			SetTimer,MG_ShowNavi,50
		}else{
			SetTimer,MG_ShowNavi,Off
			Tooltip
		}
	}
return

MG_ShowNavi:
	if(!MG_Active && (A_TickCount>(MG_LastTime+MG_DGInterval+MG_WaitNext))){
		Tooltip
		MG_Tooltip=
	}else if(MG_Tooltip){
		ToolTip,% RegExReplace(MG_Tooltip,"(?<=^|\n)\t+")
	}else if(MG_Tooltip_%MG_Gesture%){
		ToolTip,% MG_Tooltip_%MG_Gesture%
	}else{
		Tooltip,%MG_Gesture%
	}
return


MG_Navi(str){
	global
	MG_Tooltip_%MG_Gesture%=str
}

MG_CreateExNavi(){
	global
	Loop{
		Gui,%A_Index%:+LastFoundExist
		if(!WinExist()){
			MG_ExNaviID:=A_Index
			break
		}
	}
	Gui,%MG_ExNaviID%:+LastFound +0x02000000 -0x0CC00000 -Border +ToolWindow +AlwaysOnTop
	WinGet,MG_ExNaviHwnd,id
	MG_ExNaviFG2:=RegExReplace(MG_ExNaviFG,"([a-zA-Z0-9][a-zA-Z0-9])([a-zA-Z0-9][a-zA-Z0-9])([a-zA-Z0-9][a-zA-Z0-9])","0x$3$2$1")
	if(!MG_ExNaviBG){
		MG_ExNaviBG=FE01FE
		MG_ExNaviBG2=0xFE01FE
		WinSet,TransColor,%MG_ExNaviBG%
	}else{
		MG_ExNaviBG2:=RegExReplace(MG_ExNaviBG,"([a-zA-Z0-9][a-zA-Z0-9])([a-zA-Z0-9][a-zA-Z0-9])([a-zA-Z0-9][a-zA-Z0-9])","0x$3$2$1")
	}
	Gui,%MG_ExNaviID%:Color,%MG_ExNaviBG%,%MG_ExNaviBG%
	SetTimer,MG_UpdateExNavi,50
}
MG_UpdateExNavi:
	MG_UpdateExNavi()
return
MG_UpdateExNavi(){
	local w,h,x,y,hFont,size,hdc,gs,fgc
	static Dir1=0xED,Dir2:=0xEA,DirD=0xEA,Dir3=0xEE,Dir4=0xE7,DirL=0xE7,Dir6=0xE8,DirR=0xE8,Dir7=0xEB,Dir8=0xE9,DirU=0xE9,Dir9=0xEC
	gs=
	RegExMatch(MG_Gesture,"[DLRU12346789]*$",$)
	Loop,Parse,$
	{
		gs .=Chr(Dir%A_LoopField%)
	}
	RegExMatch(MG_Gesture,"(\w+)_",$)
	if(MG_ExNaviFG_%$1%){
		fgc:=RegExReplace(MG_ExNaviFG_%$1%,"([a-zA-Z0-9][a-zA-Z0-9])([a-zA-Z0-9][a-zA-Z0-9])([a-zA-Z0-9][a-zA-Z0-9])","0x$3$2$1")
	}else{
		fgc:=MG_ExNaviFG2
	}
	if(!gs ||(!MG_Active && (A_TickCount>(MG_LastTime+MG_DGInterval+MG_WaitNext)))){
		Gui,%MG_ExNaviID%:Hide
	}else{
		Critical
		hFont:=DllCall("GDI32.DLL\CreateFontA"
				,"Int",-MG_ExNaviSize	;nHeight
				,"Int",0			;nWidth
				,"Int",0			;nEscapement
				,"Int",0			;nOrientation
				,"Int",0			;nWeight
				,"UInt",0			;fdwItalic
				,"UInt",0			;fdwUnderline
				,"UInt",0			;fdwStrikeOut
				,"UInt",2			;fdwCharset
				,"UInt",0			;fdwOutPrecision
				,"UInt",0			;fdwClipPrecision
				,"UInt",0			;fdwQuality
				,"UInt",0			;fdwPitchAndFamily
				,"Str","Wingdings"	;pszFaceName
				,"UInt")
		size:=DllCall("GlobalAlloc",UInt,0x40,UInt,8,UInt)
		hdc:=DllCall("USER32.DLL\GetWindowDC","UInt",MG_ExNaviHwnd,"UInt")
		DllCall("GDI32.DLL\SelectObject","UInt",hdc,"UInt",hFont)
		DllCall("GDI32.DLL\SetTextColor","UInt",hdc,"UInt",fgc)
		DllCall("GDI32.DLL\SetBkColor","UInt",hdc,"UInt",MG_ExNaviBG2)
		DllCall("GDI32.DLL\SetTextCharacterExtra","UInt",hdc,"Int",MG_ExNaviSpacing)

		DllCall("GDI32.DLL\GetTextExtentPoint32","UInt",hdc,"Str",gs,"Int",StrLen(gs),"UInt",size)
		w:=NumGet(size+0)+MG_ExNaviPadding*2
		h:=NumGet(size+4)+MG_ExNaviPadding*2
		if(MG_ExNaviMargin<0){
			x:=MG_X,y:=MG_Y
		}else{
			CoordMode,Mouse,Screen
			MouseGetPos,x,y
			x:=x+MG_ExNaviMargin,y:=y+MG_ExNaviMargin
		}
		Gui,Show,w%w% h%h% x%x% y%y% NA

		DllCall("GDI32.DLL\TextOutA","UInt",hdc,"Int",MG_ExNaviPadding,"Int",MG_ExNaviPadding,"Str",gs,"Int",StrLen(gs))

		DllCall("GDI32.DLL\DeleteObject","UInt",hFont)
		DllCall("USER32.DLL\ReleaseDC", "UInt", MG_ExNaviHwnd, "UInt", hdc)
		DllCall("GlobalFree","UInt",size)
		Critical,Off
	}
}
MG_DestroyExNavi(){
	global
	SetTimer,MG_UpdateExNavi,Off
	Gui,%MG_ExNaviID%:Destroy
}












MG_Enable:
	MG_Enabled=1
	Loop,Parse,MG_Triggers,_
		GoSub,MG_%A_LoopField%_Enable
	Menu,%MG_MenuName%,Check,&Enable Gesture
return

MG_Disable:
	if(MG_Active){
		SetTimer,MG_Disable,-500
	}else if(MG_Enabled){
		MG_Enabled=0
		Loop,Parse,MG_Triggers,_
			GoSub,MG_%A_LoopField%_Disable
		Menu,%MG_MenuName%,Uncheck,&Enable Gesture
	}
return

MG_ToggleEnable:
	if(MG_Enabled){
		Gosub,MG_Disable
	}else{
		GoSub,MG_Enable
	}
return

MG_Edit:
	if(MG_EditCommand){
		Run,%MG_EditCommand%
	}else{
		MG_Edit()
	}
return
MG_Edit(){
	local t1,t2
	FileGetTime,t1,%A_ScriptDir%\MG_Config.ahk
	RunWait,%A_AhkPath% "%A_ScriptDir%\MG_Edit.ahk"
	FileGetTime,t2,%A_ScriptDir%\MG_Config.ahk
	if(t2>t1){
		Reload
	}
}

MG_EditUser:
	if(!FileExist(A_ScriptDir . "\MG_User.ahk")){
		FileAppend,
(%`RTrim0
;;;;;;;;↓↓ Initial Process ↓↓;;;;;;;;;;



;;;;;;;;↑↑ Initial Process ↑↑;;;;;;;;;;
Goto,MG_User_End
;;;;;↓↓ Subroutine Defination ↓↓;;;;;;;



;;;;;↑↑ Subroutine Defination ↑↑;;;;;;;
MG_User_End:
),%A_ScriptDir%\MG_User.ahk
	}
	Run,Notepad %A_ScriptDir%\MG_User.ahk
return

MG_Reload:
	RunWait,%A_AhkPath% "%A_ScriptDir%\MG_Edit.ahk" /ini2ahk
	Reload
return
















MG_Win(mode){
	local n
	WinGet,n,%mode%,ahk_id %MG_HWND%
	return n
}

MG_WinX(hwnd=0){
	global MG_HWND
	WinGetPos,X,,,,ahk_id %MG_HWND%
	return X
}

MG_WinY(hwnd=0){
	global MG_HWND
	WinGetPos,,Y,,,ahk_id %MG_HWND%
	return Y
}

MG_WinW(hwnd=0){
	global MG_HWND
	WinGetPos,,,W,,ahk_id %MG_HWND%
	return W
}

MG_WinH(hwnd=0){
	global MG_HWND
	WinGetPos,,,,H,ahk_id %MG_HWND%
	return H
}

MG_CIndex(){
	global MG_HCTL,MG_HWND,MG_CClass
	WinGet,hl,ControlListHWND,ahk_id %MG_HWND%
	Loop,Parse,hl,`n
	{
		if(A_LoopField=MG_HCTL){
			idx:=A_Index
			break
		}
	}
	WinGet,cl,ControlList,ahk_id %MG_HWND%
	Loop,Parse,cl,`n
	{
		if(A_Index=idx){
			return RegExReplace(A_LoopField,"^" . MG_CClass,"")*1
		}
	}
}
MG_ControlX(){
	global MG_HCTL
	ControlGetPos,X,,,,,ahk_id %MG_HCTL%
	return X
}
MG_ControlY(){
	global MG_HCTL
	ControlGetPos,,Y,,,,ahk_id %MG_HCTL%
	return Y
}
MG_ControlW(){
	global MG_HCTL
	ControlGetPos,,,W,,,ahk_id %MG_HCTL%
	return W
}
MG_ControlH(){
	global MG_HCTL
	ControlGetPos,,,,H,,ahk_id %MG_HCTL%
	return H
}

MG_DumpWinInfo(){
	global MG_HWND,MG_HCTL,MG_Exe,MG_WClass,MG_Title,MG_CClass
	
	WinGetPos,wx,wy,ww,wh,ahk_id %MG_HWND%
	ControlGetPos,cx,cy,cw,ch,,ahk_id %MG_HCTL%
	
	return "MG_Exe	" . MG_Exe
		. "`nMG_ExePath()	"	. MG_ExePath()
		. "`nMG_CommandLine()	"	. MG_CommandLine()
		. "`nMG_HitTest()	" . MG_HitTest()
		. "`nMG_LvHitTest()	" . MG_LvHitTest()
		. "`nMG_TvHitTest()	" . MG_TvHitTest()
		. "`nMG_WClass	" . MG_WClass
		. "`nMG_Title	" . MG_Title
		. "`nMG_WinX()	" . wx
		. "`nMG_WinY()	" . wy
		. "`nMG_WinW()	" . ww
		. "`nMG_WinH()	" . wh
		. "`nMG_CClass	" . MG_CClass
		. "`nMG_CIndex()	" . MG_CIndex()
		. "`nMG_ControlX()	" . cx
		. "`nMG_ControlY()	" . cy
		. "`nMG_ControlW()	" . cw
		. "`nMG_ControlH()	" . ch
}





MG_ExePath(pid=0){
	global MG_PID
	if(!pid){
		pid:=MG_PID
	}
	VarSetCapacity(s,256,0)
	hProc:=DllCall("OpenProcess","UInt",0x410,"UInt",0,"UInt",pid,"UInt")
	if(DllCall("psapi.dll\EnumProcessModules","UInt",hProc,"UInt*",hMod,"Int",4,"UInt*",nd,"Int")<>0){
		DllCall("psapi.dll\GetModuleFileNameExA","UInt",hProc,"UInt",hMod,"Str",s,"Int",255,"Int")
	}
	DllCall("psapi.dll\CloseProcess","UInt",hProc)
	return s
}

MG_HitTest(c=0){
	global
	if(c){
		SendMessage,0x84,0,% MG_Y<<16|MG_X,,ahk_id %MG_HCTL%
	}else{
		SendMessage,0x84,0,% MG_Y<<16|MG_X,,ahk_id %MG_HWND%
	}
	return (ErrorLevel<8)
			? ((ErrorLevel<4)
				? ((ErrorLevel<2)
					? (ErrorLevel=0 ? "Nowhere" : (c ? "Client" : MG_HitTest(1)))
					: (ErrorLevel=2 ? "Caption" : "SysMenu"))
				: ((ErrorLevel<6)
					? (ErrorLevel=4 ? "SizeBox" : "Menu")
					: (ErrorLevel=6 ? "HScroll" : "VScroll")))
			: ((ErrorLevel<10)
				? ((ErrorLevel=8) ? "MinButton" : "MaxButton")
				: ((ErrorLevel<18) ? "SizeBorder" : (ErrorLevel= 18 ? "Border" : (ErrorLevel=20 ? "CloseButton" : "HelpButton"))))
}

MG_LvHitTest(){
	global MG_PID,MG_CClass,MG_HCTL,MG_X,MG_Y
	if(MG_CClass=="SysListView32" || MG_CClass=="TListView"){
		p:=DllCall("kernel32.dll\GlobalAlloc","UInt",0x40,"UInt",8,"UInt")
		NumPut(MG_X,p+0,0)
		NumPut(MG_Y,p+0,4)
		DllCall("user32.dll\ScreenToClient","UInt",MG_HCTL,"UInt",p)
		hp:=DllCall("kernel32.dll\OpenProcess",UInt,0x001F0FFF,UInt,0,UInt,MG_PID,UInt)
		pi:=DllCall("kernel32.dll\VirtualAllocEx",UInt,hp,UInt,0,UInt,24,UInt,0x1000,UInt,0x4,UInt)
		DllCall("kernel32.dll\WriteProcessMemory","Int",hp,"UInt",pi,"UInt",p,"Int",8,"Int",0)
		SendMessage,0x1012,0,%pi%,,ahk_id %MG_HCTL%
		DllCall("kernel32.dll\ReadProcessMemory","UInt",hp,"UInt",pi+8,"UIntP",flag,"UInt",4,"UInt",0)
		DllCall("kernel32.dll\VirtualFreeEx", "UInt",pi, "UInt",0, "UInt",0x8000)
		DllCall("psapi\CloseProcess","UInt",hp)
		DllCall("kernel32.dll\GlobalFree","UInt",p)
		flag:=flag & 15
		return (flag<4) ? ((flag<2) ? 0 : "ItemIcon") : ((flag<8) ? "ItemLabel" : "ItemState")
	}
	
}

MG_TvHitTest(){
	global MG_PID,MG_CClass,MG_HCTL,MG_X,MG_Y
	if(MG_CClass=="SysTreeView32" || MG_CClass=="TTreeView"){
		p:=DllCall("kernel32.dll\GlobalAlloc","UInt",0x40,"UInt",8,"UInt")
		NumPut(MG_X,p+0,0)
		NumPut(MG_Y,p+0,4)
		DllCall("user32.dll\ScreenToClient","UInt",MG_HCTL,"UInt",p)
		hp:=DllCall("kernel32.dll\OpenProcess",UInt,0x001F0FFF,UInt,0,UInt,MG_PID,UInt)
		pi:=DllCall("kernel32.dll\VirtualAllocEx",UInt,hp,UInt,0,UInt,8,UInt,0x1000,UInt,0x4,UInt)
		DllCall("kernel32.dll\WriteProcessMemory","Int",hp,"UInt",pi,"UInt",p,"Int",8,"Int",0)
		SendMessage,0x1111,0,%pi%,,ahk_id %MG_HCTL%
		DllCall("kernel32.dll\ReadProcessMemory","UInt",hp,"UInt",pi+8,"UIntP",flag,"UInt",4,"UInt",0)
		DllCall("kernel32.dll\VirtualFreeEx", "UInt",pi, "UInt",0, "UInt",0x8000)
		DllCall("psapi\CloseProcess","UInt",hp)
		DllCall("kernel32.dll\GlobalFree","UInt",p)
		flag:=flag & 127
		return (flag<16) ? ((flag<4) ? ((flag<2) ? 0 : "ItemIcon") : ((flag<8) ? "ItemLabel" : "Indent")) : ((flag<32) ? "Button" : ((flag<64) ? "Right" : "ItemState"))
	}
}

MG_TreeListHitTest(){
	return MG_LvHitTest() || InStr(MG_TvHitTest(),"Item")
}

MG_GetCursor(){
	global MG_HWND
	mytid:=DllCall("kernel32.dll\GetCurrentThreadId","UInt")
	targettid:=DllCall("user32.dll\GetWindowThreadProcessId","UInt",MG_HWND,"UInt",0,"UInt")
	if(mytid==targettid){
		hcursor:=DllCall("user32.dll\GetCursor","Short")
	}else{
		DllCall("user32.dll\AttachThreadInput","UInt",targettid,"UInt",mytid,"Int",-1)
		hcursor:=DllCall("user32.dll\GetCursor","Short")
		DllCall("user32.dll\AttachThreadInput","UInt",targettid,"UInt",mytid,"Int",0)
	}
	return hcursor
}



MG_CommandLine(pid=0){
	global MG_PID
	static ptr:=0
	if(!pid){
		pid:=MG_PID
	}
	if(!ptr){
		ptr:=(NumGet(DllCall("kernel32.dll\GetProcAddress","UInt",DllCall("kernel32.dll\GetModuleHandle","Str","Kernel32"),"Str","GetCommandLineA","UInt")+1))
	}
	hp:=DllCall("kernel32.dll\OpenProcess",UInt,0x001F0FFF,UInt,0,UInt,pid,UInt)
	VarSetCapacity(res,1024)
	DllCall("kernel32.dll\ReadProcessMemory","UInt",hp,"UInt",ptr,"UIntP",addr,"UInt",4,"UInt",0)
	DllCall("kernel32.dll\ReadProcessMemory","UInt",hp,"UInt",addr,"Str",res,"UInt",1024,"UInt",0)
	DllCall("psapi\CloseProcess","UInt",hp)
	return res
}



MG_Abort(){
	global
	MG_Aborted:=1
}
MG_Cancel(){
	MG_Wait(0)
}
MG_Wait(ms=0){
	global
	MG_Executed--
	MG_WaitNext:=ms
}
MG_Send(btn,mode=""){
	if(IsLabel("MG_" . btn . "_Press")){
		Gosub,MG_%btn%_Press
	}else{
		if(!mode||mode="D"){
			GoSub,MG_%btn%_Down
		}
		if(!mode||mode="U"){
			GoSub,MG_%btn%_Up
		}
	}
}
MG_Move(x=-3200,y=-3200,r=0){
	global
	CoordMode,Mouse,Screen
	SetMouseDelay,-1
	if(x=-3200){
		x:=MG_X
	}
	if(y=-3200){
		y:=MG_Y
	}
	BlockInput,On
	if(r){
		MouseMove,%x%,%y%,0,R
	}else{
		MouseMove,%x%,%y%,0
	}
	BlockInput,Off
}

MG_Scroll(x=0,y=0,hctl=0){
	global
	if(!hctl){
		hctl:=MG_HCTL
	}
	Loop,% Abs(x)
		PostMessage,0x114,% x>=0,0,,ahk_id %hctl%
	Loop,% Abs(y)
		PostMessage,0x115,% y>=0,0,,ahk_id %hctl%
}
MG_InstantScroll(stay=1,ppc_x=8,ppc_y=12,hctl=0){
	global
	local mx,my,cx,cy
	if(!hctl){
		hctl:=MG_HCTL
	}
	CoordMode,Mouse,Screen
	MouseGetPos,mx,my
	Loop,% Abs(cx:=((mx-MG_X)//ppc_x))
		PostMessage,0x114,% cx>=0,0,,ahk_id %hctl%
	Loop,% Abs(cy:=((my-MG_Y)//ppc_y))
		PostMessage,0x115,% cy>=0,0,,ahk_id %hctl%
	if(stay){
		mx:=mx-cx*ppc_x
		my:=my-cy*ppc_y
		MouseMove,%mx%,%my%,0
	}
}

MG_DragScroll(ppc_x=8,ppc_y=12,hctl=0){
	global
	static lx:=0,ly:=0,lmx:=0,lmy:=0,lctl:=0
	if(!hctl){
		hctl:=MG_HCTL
	}
	if(lmx!=MG_X || lmy!=MG_Y || lctl!=hctl){
		lmx:=lx:=MG_X
		lmy:=ly:=MG_Y
		lctl:=hctl
	}
	CoordMode,Mouse,Screen
	MouseGetPos,mx,my
	Loop,% Abs(cx:=(mx-lx)//ppc_x)
		PostMessage,0x114,% cx<0,0,,ahk_id %hctl%
	Loop,% Abs(cy:=(my-ly)//ppc_y)
		PostMessage,0x115,% cy<0,0,,ahk_id %hctl%
	lx:=lx+cx*ppc_x
	ly:=ly+cy*ppc_y
}

MG_DropFiles(fns="",wnd=""){
	global MG_HWND
	if(fns=""){
		fns:=Clipboard
	}
	if(wnd=""){
		wnd=ahk_id %MG_HWND%
	}
	fns:=RegExReplace(RegExReplace(fns,"\n$",""),"\r","")
	hDrop:=DllCall("GlobalAlloc","UInt",0x42,"UInt",20+StrLen(fns)+2)
	p:=DllCall("GlobalLock","UInt",hDrop)
	NumPut(20	,p+0)	;offset
	NumPut(0	,p+4)	;pt.x
	NumPut(0	,p+8)	;pt.y
	NumPut(0	,p+12)	;fNC
	NumPut(0	,p+16)	;fWide
	p2:=p+20
	Loop,Parse,fns,`n,`r
	{
		DllCall("RtlMoveMemory", "UInt",p2,"Str",A_LoopField,"UInt",StrLen(A_LoopField))
		p2+=StrLen(A_LoopField)+1
	}
	DllCall("GlobalUnlock","UInt",hDrop)
	PostMessage,0x233,%hDrop%,0,,%wnd%
}



MG_FilesToClipboard(fns="",isMove=0){
	if(DllCall("OpenClipboard",UInt,0)){
		fns:=RegExReplace(RegExReplace(fns,"\n$",""),"\r","")
		size:=20+StrLen(fns)+2
		hData:=DllCall("kernel32.dll\GlobalAlloc","UInt",0x2042,"UInt",size)
		p:=DllCall("kernel32.dll\GlobalLock","UInt",hData,"UInt")
		NumPut(20	,p+0)	;offset
		NumPut(0	,p+4)	;pt.x
		NumPut(0	,p+8)	;pt.y
		NumPut(0	,p+12)	;fNC
		NumPut(0	,p+16)	;fWide
		p2:=p+20
		Loop,Parse,fns,`n,`r
		{
			DllCall("RtlMoveMemory", "UInt",p2,"Str",A_LoopField,"UInt",StrLen(A_LoopField))
			p2+=StrLen(A_LoopField)+1
		}
		DllCall("user32.dll\EmptyClipboard")
		DllCall("user32.dll\SetClipboardData","UInt",15,"UInt",hData)
		DllCall("kernel32.dll\GlobalUnlock","UInt",hData)
		
		hData:=DllCall("kernel32.dll\GlobalAlloc","UInt",0x2042,"UInt",4)
		p:=DllCall("kernel32.dll\GlobalLock","UInt",hData,"UInt")
		NumPut(isMove ? 2 : 1 , p+0)
		DllCall("user32.dll\SetClipboardData","UInt",DllCall("user32.dll\RegisterClipboardFormat","Str","Preferred DropEffect"),"UInt",hData)
		DllCall("kernel32.dll\GlobalUnlock","UInt",hData)
		DllCall("user32.dll\CloseClipboard")
	}
}








MG_Timer(ms=0){
	global
	if(MG_TimerMode=-1){
		MG_TimerMode=0
		return 0
	}
	MG_TimerGesture:=MG_Gesture
	if(ms){
		if(ms>0){
			MG_TimerMode=1
			SetTimer,MG_TimerExecute,% -ms
		}else{
			MG_TimerMode=2
			MG_Executed--
			MG_WaitNext:=-ms
			SetTimer,MG_TimerExecute,% ms
		}
	}else{
		MG_TimerMode=3
		SetTimer,MG_TimerExecute,% -MG_Interval
	}
	return 1
}
MG_Defer(){
	return !MG_Timer()
}

MG_TimerExecute:
	if((MG_TimerMode=3)&&MG_Active){
		SetTimer,MG_TimerExecute,% -MG_Interval
		return
	}
	if((MG_TimerMode!=2)||(MG_Gesture=MG_TimerGesture)){
		MG_TimerMode=-1
		MG_Check(MG_TimerGesture)
	}else{
		MG_TimerMode=0
	}
return


MG_While(ms=20){
	global
	if(!MG_WhileState){
		MG_WhileGesture:=MG_Gesture
		MG_WhileTrrigers:=MG_Trrigers
		MG_WhileStartTime:=A_TickCount
		if(ms<1){
			MG_WhileInterval:=MG_Interval
			MG_WhileState:=2
		}else{
			MG_WhileInterval:=ms
			MG_WhileState:=1
		}
	}else if(MG_WhileState=-1){
		MG_WhileState:=0
		return 0
	}
	SetTimer,MG_WhileExecute,% -MG_WhileInterval
	return 1
}


MG_WhileExecute:
	if(MG_Active && InStr(MG_Triggers,MG_WhileTrrigers)=1){
		SetTimer,MG_WhileExecute,% -MG_WhileInterval
		if(MG_WhileState=1){
			MG_Check(MG_WhileGesture)
		}
		return
	}else{
		MG_WhileState:=-1
		MG_Check(MG_WhileGesture)
	}
return


MG_Hold(){
	global
	if(MG_HoldState){
		MG_HoldTrrigers=
		return A_TickCount-MG_HoldStart
	}else if(!MG_HoldTrrigers){
		MG_HoldGesture:=MG_Gesture
		MG_HoldTrrigers:=MG_Triggers
		MG_HoldStart:=A_TickCount
		SetTimer,MG_HoldExecute,% -MG_Interval
	}
}
MG_HoldExecute:
	if(MG_Active && InStr(MG_Triggers,MG_HoldTrrigers)=1){
		SetTimer,MG_HoldExecute,% -MG_Interval
	}else{
		MG_HoldState:=1
		MG_Check(MG_HoldGesture)
		MG_HoldState:=0
	}
return



MG_Counter(name="",count=2){
	global
	if(!name){
		name:=MG_Gesture
	}
	if(!MG_Counter_%name%){
		MG_Counter_%name%:=0
	}
	if(count<-1){
		return Mod(MG_Counter_%name%,-count)
	}else if(count=-1){
		return MG_Counter_%name%
	}else if(count=1){
		MG_Counter_%name%:=0
		return 0
	}else if(count=0){
		MG_Counter_%name%++
		return MG_Counter_%name%
	}else{
		MG_Counter_%name%++
		return Mod(MG_Counter_%name%,count)
	}
}




MG_GetFocus(){
	VarSetCapacity(tmp,48)
	NumPut(48,tmp,0)
	return DllCall("user32.dll\GetGUIThreadInfo","UInt",0,"Str",tmp) ? NumGet(tmp,12) : 0
}

; Get cursor position and target information
MG_GetMousePosInfo(){
	global
	local tmp
	MG_TickCount:=A_TickCount
	CoordMode,Mouse,Screen
	MouseGetPos,MG_X,MG_Y,MG_HWND,MG_HCTL,3
	SendMessage,0x84,0,% MG_Y<<16|MG_X,,ahk_id %MG_HCTL%
	If ErrorLevel=4294967295
		MouseGetPos,,,,MG_HCTL,2
	if(MG_ActiveAsTarget){
		WinGet,MG_HWND,ID,A
		MG_HCTL:=MG_GetFocus()
	}
	IfWinExist,ahk_id %MG_HWND%,,,,{
		WinGetClass,MG_WClass
		WinGet,MG_PID,PID
		WinGet,MG_Exe,ProcessName
		WinGetTitle,MG_Title
	}WinGetClass,MG_CClass,ahk_id %MG_HCTL%
}

; Process trigger-down actions
MG_TriggerDown(name){
	global
	Critical
	if(!InStr(MG_CurTriggers,name . "_")){
		MG_TriggerCount++
		MG_CurTriggers=%MG_CurTriggers%%name%_
		if(MG_Active && MG_TimedOut){
			GoSub,MG_%name%_Down
		}else if(MG_TriggerCount=1){
			; Begin to process gesture at first trigger-down
			if(A_TickCount>(MG_LastTime+MG_DGInterval+MG_WaitNext)){
				MG_Gesture=%name%_
			}else{
				MG_Gesture=%MG_Gesture%%name%_
			}
			MG_GetMousePosInfo()
			if(MG_IsDisable()){
				GoSub,MG_%name%_Down
			}else{
				MG_Aborted=0
				MG_Check()
				if(MG_Aborted){
					GoSub,MG_%name%_Down
				}else{
					MG_Gesture(name)
				}
			}
		}else{
			; Otherwise execute gesture
			MG_Gesture=%MG_Gesture%%name%_
			MG_Check()
		}
	}
}

; Process trigger-up actions
MG_TriggerUp(name){
	local px,py
	Critical
	MG_TriggerCount:=(MG_TriggerCount>0) ? (MG_TriggerCount-1) : 0, MG_CurTriggers:=RegExReplace(MG_CurTriggers,"(?<=_|^)" . name . "_")
	if(!MG_Active || MG_TimedOut){
		GoSub,MG_%name%_Up
	}else{
		MG_Gesture=%MG_Gesture%_
		MG_Check()
		if((MG_TriggerCount<1) && !MG_Executed){
			; Emulate trigger if gesture is not executed
			CoordMode,Mouse,Screen
			SetMouseDelay,-1
			BlockInput,On
			MouseGetPos,px,py
			MouseMove,%MG_X%,%MG_Y%,0
			GoSub,MG_%name%_Down
			MouseMove,%px%,%py%,0
			Sleep,1
			GoSub,MG_%name%_Up
			BlockInput,Off
		}
	}
}
; Process button-press actions
MG_ButtonPress(name){
	global
	if(MG_Active && MG_TimedOut){
		Gosub,MG_%name%_Press
	}else{
		if(!MG_Active && (A_TickCount>(MG_LastTime+MG_DGInterval+MG_WaitNext))){
			MG_GetMousePosInfo()
			if(MG_IsDisable()){
				Gosub,MG_%name%_Press
			}else{
				MG_Gesture=%name%_
				MG_Aborted:=0,MG_WaitNext:=0,MG_Executed:=0,MG_TimedOut:=0
				if(!MG_Check()){
					Gosub,MG_%name%_Press
				}
			}
		}else{
			MG_Gesture=%MG_Gesture%%name%_
			if(!MG_Check()){
				Gosub,MG_%name%_Press
			}
		}
	}
}

; Check gesture updates
MG_Check(g=""){
	local ges,ex,tmp
	MG_LastTime:=A_TickCount
	if(StrLen(MG_Gesture)>MG_MaxLength){
		; Gesture is too long
		MG_Gesture=%MG_CurTriggers%
	}else{
		if(g){
			ges:=g
		}else{
			ges:=MG_Gesture
		}
		if(IsLabel("MG_Gesture_" . ges)){
			IfWinExist,ahk_id %MG_HWND%,,,,{
			} ex:=MG_Executed++
			Gosub,MG_Gesture_%ges%
			if(ex!=MG_Executed){
				if(!g){
					MG_Gesture:=MG_CurTriggers
				}
				return 1
			}else{
				return MG_WaitNext!=0
			}
		}
	}
}

; Recognition function
MG_Gesture(trigger){
	global
	local px,py,px2,py2,dx,dy,powx,powy,d1,d2,next_timeout,orange
	MG_Active:=1,MG_Aborted:=0,MG_WaitNext:=0,MG_Executed:=0,MG_TimedOut:=0,px:=px2:=MG_X,py:=py2:=MG_Y,orange:=MG_ORange%MG_ORangeDefault%,next_timeout:=A_TickCount+MG_Timeout
	Loop,Parse,MG_SubTriggers,_
		GoSub,MG_%A_LoopField%_Enable
	CoordMode,Mouse,Screen
	Critical,Off
	loop{
		MouseGetPos,dx,dy
		if(MG_TriggerCount<1){
			; Release all triggers
			MG_Active:=0,MG_TriggerCount:=0,MG_CurTriggers:=""
			Loop,Parse,MG_SubTriggers,_
				GoSub,MG_%A_LoopField%_Disable
			break
		}else if((MG_X-dx)**2+(MG_Y-dy)**2<MG_TimeoutThreshold**2){
			; Tiny movement
			next_timeout:=A_TickCount+MG_Timeout
		}else if(!MG_TimedOut && (MG_Aborted||((A_TickCount>next_timeout) && (MG_Executed=0)))){
			; Time out when moving
			Critical
			SetMouseDelay,-1
			MG_TimedOut=1
			BlockInput,On
			MouseMove,%MG_X%,%MG_Y%,0
			Loop,Parse,MG_CurTriggers,_
				If A_LoopField<>
					GoSub,MG_%A_LoopField%_Down
			MouseMove,%dx%,%dy%,0
			BlockInput,Off
			Critical,Off
		}else if(!MG_TimedOut && ((powx:=(dx-px)**2)+(powy:=(dy-py)**2)>MG_Threshold**2)){
			; Check movement
			if((d1!=(d2:=(MG_8Dir 
							? ((orange>Abs(0.7853981634-Abs(ATan((dx-px)/(dy-py)))))
								? ((dx>px) ? ((dy>py) ? 3 : 9) : ((dy>py) ? 1 : 7))
								: ((powx>powy) ? ((dx>px) ? 6 : 4) : ((dy>py) ? 2 : 8)))
							: ((powx>powy) ? ((dx>px) ? "R":"L"):((dy>py) ? "D":"U")) )))
					|| (MG_8Dir ? ((dx-px2)**2+(dy-py2)**2>MG_LongThreshold**2) : ((powx>powy) ? (Abs(dx-px2)>MG_LongThresholdX) : (Abs(dy-py2)>MG_LongThresholdY)))){
				MG_Gesture=%MG_Gesture%%d2%
				if(MG_8Dir && (d2 & 1)){
					orange:=MG_ORange%MG_ORangeB%
				}else{
					orange:=MG_ORange%MG_ORangeA%
				}
				px2:=px,py2:=py,d1:=MG_Check() ? "" : d2
			}
			MouseGetPos,px,py
			next_timeout:=A_TickCount+MG_Timeout
		}
		Sleep,%MG_Interval%
	}
	return 1
}

MG_End:
#NoEnv
