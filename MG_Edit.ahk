Critical

Configs=Interval`nTimeoutThreshold`nTimeout`nThreshold`nDGInterval`nLongThresholdX`nLongThresholdY`nLongThreshold`n8Dir`nUseNavi`nUseExNavi`nEditCommand`nActiveAsTarget`nTraySubmenu

ListConf=ORangeDefault`nORangeA`nORangeB

reset()
Config_Interval=20
Config_TimeoutThreshold=12
Config_Timeout=400
Config_Threshold=60
Config_DGInterval=0
Config_LongThresholdX=800
Config_LongThresholdY=600
Config_LongThreshold=700
Config_8Dir=0
Config_ORangeDefault=3
Config_ORangeA=3
Config_ORangeB=3
Config_UseNavi=0
Config_UseExNavi=1
Config_TraySubmenu=0
Config_ActiveAsTarget=0
Config_EdgeMode=1

loadIniFile(A_ScriptDir . "\MouseGesture.ini")


RuleType_WClass=1
RuleType_CClass=2
RuleType_Exe=3
RuleType_Title=4
RuleType_Custom=5
RuleType_Include=6

RuleType_1=WClass
RuleType_2=CClass
RuleType_3=Exe
RuleType_4=Title
RuleType_5=Custom
RuleType_6=Include

HT:=AddCustomTemplateSub("","Window Elements","HT")
AddCustomTemplate(HT,"Titlebar","MG_HitTest()=""Caption""")
AddCustomTemplate(HT,"Titlebar Icon","MG_HitTest()=""SysMenu""")
AddCustomTemplate(HT,"Minimize Button","MG_HitTest()=""MinButton""")
AddCustomTemplate(HT,"Maximize Button","MG_HitTest()=""MaxButton""")
AddCustomTemplate(HT,"Close Button","MG_HitTest()=""CloseButton""")
AddCustomTemplate(HT,"Help Button","MG_HitTest()=""HelpButton""")
AddCustomTemplate(HT,"","")
AddCustomTemplate(HT,"Menubar","MG_HitTest()=""Menu""")
AddCustomTemplate(HT,"Vertical Scrollbar","MG_HitTest()=""VScroll""")
AddCustomTemplate(HT,"Horizontal Scrollbar","MG_HitTest()=""HScroll""")
AddCustomTemplate(HT,"Window Frame","MG_HitTest()=""Border""")
AddCustomTemplate(HT,"Resizable Corner","MG_HitTest()=""SizeBorder""")
AddCustomTemplate(HT,"Other Area","MG_HitTest()=""Client""")
AddCustomTemplate(HT,"","")
AddCustomTemplate(HT,"Tree/List","MG_TreeListHitTest()")

CS:=AddCustomTemplateSub("","Mouse Cursor","CS")
AddCustomTemplate(CS,"Normal (Arrow)","MG_GetCursor()=0x10011")
AddCustomTemplate(CS,"Line (Text Input)","MG_GetCursor()=0x10013")
AddCustomTemplate(CS,"Finger (Link Hover)","MG_GetCursor()=0x1002d")
AddCustomTemplate(CS,"Sand Glass","MG_GetCursor()=0x10015")
AddCustomTemplate(CS,"Cross","MG_GetCursor()=0x10017")
AddCustomTemplate(CS,"Disabled","MG_GetCursor()=0x10025")
AddCustomTemplate(CS,"Arrow + Sand Glass","MG_GetCursor()=0x10027")
AddCustomTemplate(CS,"Arrow + Question Mark","MG_GetCursor()=0x10029")
AddCustomTemplate(CS,"4-Direction Arrow","MG_GetCursor()=0x10023")
AddCustomTemplate(CS,"Up-Down Arrow","MG_GetCursor()=0x10021")
AddCustomTemplate(CS,"Left-Right Arrow","MG_GetCursor()=0x1001f")
AddCustomTemplate(CS,"UL-DR Arrow","MG_GetCursor()=0x1001b")
AddCustomTemplate(CS,"UR-DL Arrow","MG_GetCursor()=0x1001d")
AddCustomTemplate(CS,"","")
AddCustomTemplate(CS,"Any of the above curors","MG_GetCursor()<0x10030")
AddCustomTemplate(CS,"Default (Application Specified)","MG_GetCursor()>0x10030")


WS:=AddCustomTemplateSub("","Window Status","WS")
AddCustomTemplate(WS,"Maximized","MG_Win(""MinMax"")=1")
AddCustomTemplate(WS,"Normal","MG_Win(""MinMax"")=0")
AddCustomTemplate(WS,"Transparent","MG_Win(""Transparent"")<255")
AddCustomTemplate(WS,"Opaque","MG_Win(""Transparent"")=""""")
AddCustomTemplate(WS,"Topmost","MG_Win(""ExStyle"")&0x08")
AddCustomTemplate(WS,"Non-Topmost","!(MG_Win(""ExStyle"")&0x08)")
KS:=AddCustomTemplateSub("","Keyboard Status","KS")
AddCustomTemplate(KS,"Shift Key Down","GetKeyState(""Shift"")")
AddCustomTemplate(KS,"Shift Key Up","!GetKeyState(""Shift"")")
AddCustomTemplate(KS,"Ctrl Key Down","GetKeyState(""Ctrl"")")
AddCustomTemplate(KS,"Ctrl Key Up","!GetKeyState(""Ctrl"")")
AddCustomTemplate(KS,"Alt Key Down","GetKeyState(""Alt"")")
AddCustomTemplate(KS,"Alt Key Up","!GetKeyState(""Alt"")")


Buttons=LB`nRB`nMB`nX1B`nX2B`nWU`nWD
Button_LB=Left-Button Down
Button_RB=Right-Button Down
Button_MB=Middle-Button Down
Button_X1B=Button-4 Down
Button_X2B=Button-5 Down
Button_WU=Wheel-Up
Button_WD=Wheel-Down

Button_X3B=Button-6 Down
Button_X4B=Button-7 Down
Button_X5B=Button-8 Down
Button_X6B=Button-9 Down
Button_X7B=Button-10 Down
Button_X8B=Button-11 Down
Button_X9B=Button-12 Down
Button_LT=Left-Trigger Down
Button_RT=Right-Trigger Down

Button_ET=Touch Screen Top (All)
Button_ETA=Touch Screen Top (Left Half)
Button_ETB=Touch Screen Top (Right Half)
Button_ET1=Touch Screen Top (Left 1/3)
Button_ET2=Touch Screen Top (Center 1/3)
Button_ET3=Touch Screen Top (Right 1/3)
Button_EB=Touch Screen Bottom (All)
Button_EBA=Touch Screen Bottom (Left Half)
Button_EBB=Touch Screen Bottom (Right Half)
Button_EB1=Touch Screen Bottom (Left 1/3)
Button_EB2=Touch Screen Bottom (Center 1/3)
Button_EB3=Touch Screen Bottom (Right 1/3)
Button_EL=Touch Screen Bottom (All)
Button_ELA=Touch Screen Bottom (Upper Half)
Button_ELB=Touch Screen Bottom (Lower Half)
Button_EL1=Touch Screen Bottom (Upper 1/3)
Button_EL2=Touch Screen Bottom (Middle 1/3)
Button_EL3=Touch Screen Bottom (Lower 1/3)
Button_ER=Touch Screen Bottom (All)
Button_ERA=Touch Screen Bottom (Upper Half)
Button_ERB=Touch Screen Bottom (Lower Half)
Button_ER1=Touch Screen Bottom (Upper 1/3)
Button_ER2=Touch Screen Bottom (Middle 1/3)
Button_ER3=Touch Screen Bottom (Lower 1/3)
Button_CRT=Touch Screen Right-Top Corner
Button_CLT=Touch Screen Left-Top Corner
Button_CRB=Touch Screen Right-Bottom Corner
Button_CLB=Touch Screen Left-Bottom Corner

#Include *i %A_ScriptDir%\MG_MyButtonNames.ahk


LBButtons=
loadButtons()



if 1=/ini2ahk
{
	FileDelete,%A_ScriptDir%\MG_Config.ahk
	FileAppend,% ToAhk(),%A_ScriptDir%\MG_Config.ahk
	ExitApp
}





GoSub,CreateGui

GuiControl,,LBButtons,`n%LBButtons%

AddActionTemplate("Key Stroke","Send,%[Format: +^!#{Key}`nModifier: + Shift、^ Ctrl、! Alt、# Win`nThe { } surrounding the key can be omitted`n{Key Down} for Press Down、{Key Up} for Press Up]%")
AddActionTemplate("Execute Toolbar Button Command","ButtonIDPicker")
AddActionTemplate("Execute Menubar Commond","WinMenuSelectItem,,,%[Menu Item (Delimiter: [,] Max: 6 Level Deep)]%")
AddActionTemplate("Run Program","Run,%[Input Program Command Line:]%")
AddActionTemplate("Copy to Clipboard","Clipboard=`n(%`RTrim0`n%[Input Text to be copied:]%`n)")
AddActionTemplate("Move Cursor to Position","MG_Move()")
AddActionTemplate("Activate Window","WinActivate")
AddActionTemplate("Minimize Window","WinMinimize")
AddActionTemplate("Maximize Window","WinMaximize")
AddActionTemplate("Restore Window","WinRestore")
AddActionTemplate("Close Window","WinClose")
AddActionTemplate("Send Window to Bottom","WinSet,Bottom")
AddActionTemplate("Kill Process","Process,Close,% MG_Win(""pid"")")
AddActionTemplate("Change Window Transparency","WinSet,Trans,%[Transparency (0-255):]%")
AddActionTemplate("Turn off Window Transparency","WinSet,Trans,Off")
AddActionTemplate("Turn on Window Topmost","WinSet,Topmost,On")
AddActionTemplate("Turn off Window Topmost","WinSet,Topmost,Off")
AddActionTemplate("Toggle Window Topmost","WinSet,Topmost,Toggle")
AddActionTemplate("Post Message","PostMessage,,,")
AddActionTemplate("Send Message","SendMessage,,,")
AddActionTemplate("Scroll Window","if(MG_While()){`nMG_InstantScroll()`n}")
AddActionTemplate("Scroll Window (IE Style)","if(MG_While()){`nMG_InstantScroll(0)`n}")
AddActionTemplate("Drag-Scroll","if(MG_While()){`nMG_DragScroll(%[Format: ppc_x,ppc_y`nCursor movement quantum (Pixel)`nDefault: 12,8]%)`n}")
AddActionTemplate("Sound Volume","SoundSet,%[0 ... 100: Set absolute value`n+1 ... +100/-1 ... -100: Increment/Decrement]%,MASTER,VOLUME")
AddActionTemplate("Mute Sound","SoundSet,%[[+]: Toggle ON/OFF`n[0]: OFF`n[1]: ON]%,MASTER,MUTE")
AddActionTemplate("Play a Sound","SoundPlay,%[Input WAVE File Path:]%")
AddActionTemplate("Timer","if(MG_Timer(-500))`n	return`n")
AddActionTemplate("Wait for Input","MG_Wait(500)")
AddActionTemplate("Repeat until Button Up","if(MG_While(%[Input Interval: (Millisecond)]%)){`n`n}")
AddActionTemplate("Abort Current Gesture","MG_Abort()")
AddActionTemplate("Show Text as Tooltip","MG_Tooltip=`n(`n)")

ShowTargets()
ShowGestures()
ShowConfig()

Critical,Off
Gui,Show,,Mouse Gesture 2 Configuration


return






CreateGui:

/*
Menu,FileMenu,Add,クリップボードからインポート(&C),ImportFromClipboard
Menu,FileMenu,Add,
Menu,FileMenu,Add,保存(&S),MenuSave
Menu,FileMenu,Add,終了(&X),MenuExit

Menu,AppMenu,Add,新規作成(&N),TargetNew
Menu,AppMenu,Add,削除(&D),TargetDelete
Menu,AppMenu,Add,定義`テキストをコピー(&C),CopyTarget

Menu,GestureMenu,Add,新規作成(&N),GestureNew
Menu,GestureMenu,Add,削除(&D),GestureDelete
Menu,GestureMenu,Add,定義`テキストをコピー(&C),CopyGesture
;Menu,GestureMenu,Add,関連する条件定義`もコピー(&C),Dummy


Menu,MainMenu,Add,ファイル(&F),:FileMenu
Menu,MainMenu,Add,条件定義`(&F),:AppMenu
Menu,MainMenu,Add,ジェスチ`ャ定義`(&F),:GestureMenu
Gui,Menu,MainMenu

*/



Gui,+Delimiter`n
Gui,Add,Tab,x8 y2 w376 h340,Condition Definition`nGesture Definition`nAction Binding`nOptions


Gui,Add,Button,Section w20 h20 gTargetNew,+
Gui,Add,Button,x+0 w20 h20 gTargetDelete vBTargetDelete,-
Gui,Add,Button,x+0 w20 h20 gCopyTarget,C
Gui,Add,Button,x+0 w20 h20 gTargetUp,↑
Gui,Add,Button,x+0 w20 h20 gTargetDown,↓

Gui,Add,ListBox,xs y+1 w100 h280 Section vLBTarget gLBTargetSelect AltSubmit

Gui,Add,Text,vLabel1 ys x+8 Section w40,&Name
Gui,Add,Edit,x+2 w126 vETargetName gETargetNameChange
Gui,Add,Button,x+2 w50 h20 Disabled gTargetRename vBTargetRename,Change

Gui,Add,ListView,xs y+4 w220 h178 section NoSortHdr vLVRule gLVRuleSelect AltSubmit,Type`nCondition Value
LV_ModifyCol(1,65)
LV_ModifyCol(2,150)
Gui,Add,Button,x+1 w20 h20 gRuleUp vBRuleUp Disabled,↑
Gui,Add,Button,y+60 w20 h20 gRuleDelete vBRuleDelete Disabled,×
Gui,Add,Button,y+60 w20 h20 gRuleDown vBRuleDown Disabled,↓

Gui,Add,DropDownList,xs y+2 w138 vDDLAnd gDDLAndChoose AltSubmit,Match Any Rule`nMatch All Rules
Gui,Add,Button,x+2 yp h20 vBAddRule gBAddRulePress Disabled,Add
Gui,Add,Button,x+2 h20 vBUpdateRule gBUpdateRulePress Disabled,Update

Gui,Add,Text,vLabel2 xs y+4 w40,&Type
Gui,Add,DropDownList,x+2 w134 vDDLRuleType AltSubmit,Window Class`nControl Class`nFile Name`nTitle`nCustom Condition`nMatch Other Rules
Gui,Add,Button,x+2 h20 gBRulePicker,Helper
Gui,Add,Text,vLabel3 xs y+4 w40,&Value
Gui,Add,Edit,x+2 w178 vERuleValue,

; Gesture Definition
Gui,Tab,2

Gui,Add,Button,Section w20 h20 gGestureNew,+
Gui,Add,Button,x+0 w20 h20 gGestureDelete,-
Gui,Add,Button,x+0 w20 h20 gCopyGesture,C
Gui,Add,Button,x+0 w20 h20 gGestureUp,↑
Gui,Add,Button,x+0 w20 h20 gGestureDown,↓
Gui,Add,ListBox,xs y+2 w100 h280 Section vLBGesture1 gLBGestureSelect1 AltSubmit

Gui,Add,Text,vLabel4 ys x+8 Section w40,&Name
Gui,Add,Edit,x+2 w126 vEGestureName1
Gui,Add,Button,x+2 w50 h20 Disabled gGestureRename1 vBGestureRename1,Change


Gui,Add,ListBox,xs y+4 w220 h80 section vLBGesturePattern gLBGesturePatternSelect  AltSubmit,
Gui,Add,Button,x+1 w20 h20 gGesturePatternUp vBGesturePatternUp Disabled,↑
Gui,Add,Button,y+5 w20 h20 gGesturePatternDelete vBGesturePatternDelete Disabled,×
Gui,Add,Button,y+5 w20 h20 gGesturePatternDown vBGesturePatternDown Disabled,↓
Gui,Add,Edit,xs y+4 h20 w138 vEGesture gEGestureChange
Gui,Add,Button,x+2 h20 vBAddGesturePattern gBAddGesturePattern Disabled,Add
Gui,Add,Button,x+2 h20 vBUpdateGesturePattern gBUpdateGesturePattern Disabled,Update

Gui,Add,Text,vLabel5 xs y+4 Section,Movement
Gui,Add,Button,xs ys+24 w24 h24 gDir7 Disabled vBStrokeUL,＼
Gui,Add,Button,x+1 w24 h24 gDir8 Disabled vBStrokeU,↑
Gui,Add,Button,x+1 w24 h24 gDir9 Disabled vBStrokeUR,／
Gui,Add,Button,xs y+2 w24 h24 gDir4 Disabled vBStrokeL,←
Gui,Add,Button,x+26 w24 h24 gDir6 Disabled vBStrokeR,→
Gui,Add,Button,xs y+2 w24 h24 gDir1 Disabled vBStrokeDL,／
Gui,Add,Button,x+1 w24 h24 gDir2 Disabled vBStrokeD,↓
Gui,Add,Button,x+1 w24 h24 gDir3 Disabled vBStrokeDR,＼
Gui,Add,Button,xs y+16 w73 h36 gGesturePatternBS vBGesturePatternBS,Remove Last Input in List

Gui,Add,ListBox,x+12 ys+2 w132 h132 vLBButtons gLBButtons AltSubmit,

Gui,Add,Button,xp+0 y+4 w132 h20 gBButtonUp vBButtonUp Disabled,Any Button Up



; Action Binding
Gui,Tab,3
Gui,Add,Button,Section w20 h20 gGestureNew,+
Gui,Add,Button,x+0 w20 h20 gGestureDelete,-
Gui,Add,Button,x+0 w20 h20 gCopyGesture,C
Gui,Add,Button,x+0 w20 h20 gGestureUp,↑
Gui,Add,Button,x+0 w20 h20 gGestureDown,↓
Gui,Add,ListBox,xs y+2 w100 h280 Section vLBGesture2 gLBGestureSelect2 AltSubmit

Gui,Add,Text,vLabel7 ys x+8 Section w40,&Name
Gui,Add,Edit,x+2 w126 vEGestureName2
Gui,Add,Button,x+2 w50 h20 Disabled gGestureRename2 vBGestureRename2,Change


Gui,Add,ListView,xs y+4 w220 h110 section NoSortHdr vLVAction gLVActionSelect AltSubmit,Condition`nAction
LV_ModifyCol(1,75)
LV_ModifyCol(2,140)
Gui,Add,Button,x+1 w20 h20 gActionUp vBActionUp Disabled,↑
Gui,Add,Button,y+25 w20 h20 gActionDelete vBActionDelete Disabled,×
Gui,Add,Button,y+25 w20 h20 gActionDown vBActionDown Disabled,↓

Gui,Add,Text,vLabel8 xs y+4 w48,&Condition
Gui,Add,DropDownList,x+2 h20 w88 vDDLTarget r8
Gui,Add,Button,x+2 h20 Disabled vBAddAction gBAddActionPress,Add
Gui,Add,Button,x+2 h20 Disabled vBUpdateAction gBUpdateActionPress,Update

Gui,Add,Edit,xs w220 h86 -Wrap vEAction WantTab T16
Gui,Add,DropDownList,xp+0 y+4 h20 w188 r16 vDDLActionTemplate AltSubmit
Gui,Add,Button,x+2 h20 vBAddActionLine gBAddActionLinePress,Add





; Options
Gui,Tab,4



Gui,Add,GroupBox,y+4 w224 h142 Section,Detection Threshold (Pixel)
Gui,Add,Text,xs+4 yp+16 w160 vLabel14,Detection Start
Gui,Add,Edit,x+2 w48 vConfig_TimeoutThreshold
Gui,Add,UpDown

Gui,Add,Text,xs+4 y+4 w160 vLabel10,Normal Stroke
Gui,Add,Edit,x+2 w48 vConfig_Threshold
Gui,Add,UpDown

Gui,Add,Text,xs+4 y+4 w160 vLabel11,4-Direction Horizontal [LL] [RR]
Gui,Add,Edit,x+2 w48 vConfig_LongThresholdX
Gui,Add,UpDown

Gui,Add,Text,xs+4 y+4 w160 vLabel12,4-Direction Vertical [UU] [DD]
Gui,Add,Edit,x+2 w48  vConfig_LongThresholdY
Gui,Add,UpDown

Gui,Add,Text,xs+4 y+4 w160 vLabel13,8-Direction Long Diagonal
Gui,Add,Edit,x+2 w48 vConfig_LongThreshold
Gui,Add,UpDown

Gui,Add,GroupBox,xs y+8 w224 h92 ,Time Threshold (Millisecond)
Gui,Add,Text,xs+4 yp+16 w160 vLabel15,Gesture Timeout
Gui,Add,Edit,x+2 w48 vConfig_Timeout
Gui,Add,UpDown

Gui,Add,Text,xs+4 y+4 w160 vLabel16,Double Gesture Interval
Gui,Add,Edit,x+2 w48 vConfig_DGInterval
Gui,Add,UpDown

Gui,Add,Text,xs+4 y+4 w160 vLabel17,Stroke Sampling Period
Gui,Add,Edit,x+2 w48 vConfig_Interval
Gui,Add,UpDown

Gui,Add,CheckBox,xs y+12 vConfig_ActiveAsTarget,Always Use Active Window as Target

Gui,Add,CheckBox,xs y+8 vConfig_TraySubmenu,Cascade Mouse Gesture Tray Menu

Gui,Add,CheckBox,xs y+8 vConfig_UseNavi,Show Gesture Hints by Default
Gui,Add,CheckBox,x+4 vConfig_UseExNavi,Show Hints as Arrows (32-bit only)


Gui,Add,CheckBox,ys+8 xs+230 w120 Section vConfig_8Dir,8-Direction Mode

Gui,Add,GroupBox,y+6 w122 h114 Section,Diagonal Angle

Gui,Add,Text,xs+4 yp+16 w66 vLabel18,First Stroke
Gui,Add,DDL,x+6 w38 vConfig_ORangeDefault AltSubmit,0`n30`n45`n60`n90

Gui,Add,Text,xs+4 y+10 w66 vLabel19,After Orthogonal
Gui,Add,DDL,x+6 w38 vConfig_ORangeA AltSubmit,0`n30`n45`n60`n90

Gui,Add,Text,xs+4 y+10 w66 vLabel20,After Diagonal
Gui,Add,DDL,x+6 w38 vConfig_ORangeB AltSubmit,0`n30`n45`n60`n90


Gui,Add,GroupBox,xs Section y+30 w122 h68,Define New Button
Gui,Add,Text,xs+4 yp+16 w32 vLabel21,Name
Gui,Add,Edit,x+0 w44 vNewButtonName
Gui,Add,Button,x+2 w32 h20 gDefineNewButton,Add

Gui,Add,Text,xs+4 yp+24 w32 vLabel22,Key
Gui,Add,Edit,x+0 w76 vNewButtonKey




Gui,Tab



Gui,Add,Button,x8 y350 w130 gImportFromClipboard,&Import from Clipboard
Gui,Add,Button,x240 y350 w64 gSaveExit,&OK
Gui,Add,Button,x+4 w64 gExit,&Cancel

Loop,40{
	GuiControlGet,pos,pos,Label%A_Index%
	if(!ErrorLevel){
		posY+=4
		posX+=2
		GuiControl,Move,Label%A_Index%,x%posX% y%posY%
	}
}
return



GuiClose:
GuiEscape:
Exit:
ExitApp




Dummy:
return






Dir1:
Gui,Submit,NoHide
if(Config_8Dir){
	GuiControl,,EGesture,%EGesture%1
}
return
Dir2:
Gui,Submit,NoHide
if(Config_8Dir){
	GuiControl,,EGesture,%EGesture%2
}else{
	GuiControl,,EGesture,%EGesture%D
}
return
Dir3:
Gui,Submit,NoHide
if(Config_8Dir){
	GuiControl,,EGesture,%EGesture%3
}
return
Dir4:
Gui,Submit,NoHide
if(Config_8Dir){
	GuiControl,,EGesture,%EGesture%4
}else{
	GuiControl,,EGesture,%EGesture%L
}
return
Dir6:
Gui,Submit,NoHide
if(Config_8Dir){
	GuiControl,,EGesture,%EGesture%6
}else{
	GuiControl,,EGesture,%EGesture%R
}
return
Dir7:
Gui,Submit,NoHide
if(Config_8Dir){
	GuiControl,,EGesture,%EGesture%7
}
return
Dir8:
Gui,Submit,NoHide
if(Config_8Dir){
	GuiControl,,EGesture,%EGesture%8
}else{
	GuiControl,,EGesture,%EGesture%U
}
return
Dir9:
Gui,Submit,NoHide
if(Config_8Dir){
	GuiControl,,EGesture,%EGesture%9
}
return

LBButtons:
if(A_GuiEvent="DoubleClick"){
	Gui,Submit,NoHide
	GuiControl,,EGesture,% EGesture . Button_%LBButtons% . "_"
}
return

BButtonUp:
	Gui,Submit,NoHide
	GuiControl,,EGesture,%EGesture%_
return


MenuSave:

return













TargetNew:
	Target_Count++
	Target_%Target_Count%_Name=Target_%Target_Count%
	Target_%Target_Count%_Count=0
	Target_%Target_Count%_IsAnd=0
	ShowTargets()
	ShowTarget(Target_Count)
return

TargetUp:
	if(Target_Editing>1){
		TargetSwap(Target_Editing-1,Target_Editing)
		ShowTargets()
		ShowTarget(Target_Editing-1)
	}
return
TargetDown:
	if(Target_Editing<Target_Count){
		TargetSwap(Target_Editing,Target_Editing+1)
		ShowTargets()
		ShowTarget(Target_Editing+1)
	}
return

TargetDelete:
/*
	Loop,%Target_Count%{
		if(A_Index>Target_Editing){
			TargetSwap(A_Index-1,A_Index)
		}
	}
	Target_Count--
	ShowTargets()
	ShowTarget(Target_Editing)
return
*/
	TargetDelete(Target_Editing)
	ShowTargets()
	ShowTarget((Target_Editing>Target_Count) ? Target_Count : Target_Editing)
return
TargetDelete(idx){
	global
	if(Target_%idx%_Name="Disable"){
		MsgBox,Disable Condition Can NOT be deleted
		return
	}
	Msgbox,1,Delete Confirm,% "Are you sure to delete Conditon: " . Target_%idx%_Name
	IfMsgBox,OK
	{
		Loop{
			idx++
			TargetMove(idx,idx-1)
			if(idx>=Target_Count){
				break
			}
		}
		Target_Count--
	}
}

TargetMove(from,to){
	global
	Target_%to%_Name:=Target_%from%_Name
	Target_%to%_IsAnd:=Target_%from%_IsAnd
	Target_%to%_Count:=Target_%from%_Count
	Loop,% Target_%from%_Count
	{
		Target_%to%_%A_Index%_Type:=Target_%from%_%A_Index%_Type
		Target_%to%_%A_Index%_Value:=Target_%from%_%A_Index%_Value
	}
}
TargetSwap(a,b){
	TargetMove(a,"tmp")
	TargetMove(b,a)
	TargetMove("tmp",b)
}

TargetRename:
	Gui,Submit,NoHide
	idx:=0
	flag:=0
	Loop,% Gesture_Count{
		idx++
		jdx:=0
		Loop,% Gesture_%idx%_Count{
			jdx++
			if(Gesture_%idx%_%jdx%_Target==Target_%Target_Editing%_Name){
				flag:=1
				break
			}
		}
		if(flag){
			break
		}
	}
	if(flag){
		MsgBox,3,Change Condition Name,This condition is in use,`nChange all the instance names of this condition?
		IfMsgBox,Yes
		{
			idx:=0
			Loop,% Gesture_Count{
				idx++
				jdx:=0
				Loop,% Gesture_%idx%_Count{
					jdx++
					if(Gesture_%idx%_%jdx%_Target==Target_%Target_Editing%_Name){
						Gesture_%idx%_%jdx%_Target:=ETargetName
					}
				}
			}
			ShowGestures()
			ShowGesture(Gesture_Editing)
		}
		else IfMsgBox,Cancel
			return
	}
	Target_%Target_Editing%_Name=%ETargetName%
	ShowTargets()
	ShowTarget(Target_Editing)
return

ETargetNameChange:
	Gui,Submit,NoHide
	if(Target_Editing && !RegExMatch(ETargetName,"^(|WClass|CClass|Title|Exe|Custom|Include|And|G|Default)$|[^\w]")){
		Loop,%Target_Count%{
			if(Target_%A_Index%_Name=ETargetName){
				GuiControl,Disable,BTargetRename
				return
			}
		}
		GuiControl,Enable,BTargetRename
	}else{
		GuiControl,Disable,BTargetRename
	}
return


; Show All Targets
ShowTargets(){
	global
	local str,str2
	Menu,TargetList,Add
	Menu,TargetList,DeleteAll
	Loop,%Target_Count%{
		Join(str,Target_%A_Index%_Name)
		if(Target_%A_Index%_Name!="Disable"){
			Join(str2,Target_%A_Index%_Name)
		}
		Menu,TargetList,Add,% Target_%A_Index%_Name,TargetListMenuSelect
	}
	GuiControl,,LBTarget,`n%str%
	GuiControl,,DDLTarget,`nDefault`n%Str2%
	GuiControl,Choose,DDLTarget,1
}
; Select Target
LBTargetSelect:
	Gui,Submit,NoHide
	ShowTarget(LBTarget)
	ClearRule()
return
ShowTarget(idx){
	local v
	Target_Editing:=idx
	GuiControl,,ETargetName,% Target_%idx%_Name
	Gui,ListView,LVRule
	GuiControl,-Redraw,LVRule
	LV_Delete()
	Loop,% Target_%idx%_Count {
		LV_Add("",Target_%idx%_%A_Index%_Type,Target_%idx%_%A_Index%_Value)
	}
	GuiControl,+Redraw,LVRule
	if(Target_%idx%_Name="Disable"){
		GuiControl,Disable,BTargetDelete
		GuiControl,Disable,BTargetRename
	}else{
		GuiControl,Enable,BTargetDelete
		GuiControl,Enable,BTargetRename
	}
	GuiControl,Enable,BAddRule
	GuiControl,Choose,DDLAnd,% Target_%idx%_IsAnd ? 2 : 1
	GuiControlGet,v,FocusV
	if(v!="LBTarget"){
		GuiControl,Choose,LBTarget,%idx%
	}
}
DDLAndChoose:
	Gui,Submit,NoHide
	Target_%Target_Editing%_IsAnd:=(DDLAnd=2)
return







RuleUp:
	if(Rule_Editing>1){
		RuleSwap(Target_Editing,Rule_Editing-1,Rule_Editing)
		ShowTarget(Target_Editing)
		ShowRule(Target_Editing,Rule_Editing-1)
	}
return
RuleDown:
	if(Rule_Editing<Target_%Target_Editing%_Count){
		RuleSwap(Target_Editing,Rule_Editing,Rule_Editing+1)
		ShowTarget(Target_Editing)
		ShowRule(Target_Editing,Rule_Editing+1)
	}
return

RuleDelete:
	RuleDelete(Target_Editing,Rule_Editing)
	ShowTarget(Target_Editing)
	ShowRule(Target_Editing,(Rule_Editing>Target_%Target_Editing%_Count) ? Target_%Target_Editing%_Count : Rule_Editing)
return

RuleDelete(target,idx){
	global
	Loop{
		idx++
		RuleMove(target,idx,idx-1)
		if(idx>=Target_%Target_Editing%_Count){
			break
		}
	}
	Target_%Target_Editing%_Count--
}

RuleSwap(target,a,b){
	RuleMove(target,a,"tmp")
	RuleMove(target,b,a)
	RuleMove(target,"tmp",b)
}
RuleMove(target,from,to){
	global
	Target_%target%_%to%_Type:=Target_%target%_%from%_Type
	Target_%target%_%to%_Value:=Target_%target%_%from%_Value
}




; Select Rule
LVRuleSelect:
	if(A_EventInfo && Rule_Editing!=A_EventInfo){
		ShowRule(Target_Editing,A_EventInfo)
	}
return
ShowRule(target,idx){
	local t,v
	Rule_Editing:=idx
	t:=Target_%target%_%idx%_Type
	GuiControl,Choose,DDLRuleType,% RuleType_%t%
	GuiControl,,ERuleValue,% Target_%target%_%idx%_Value
	GuiControl,Enable,BUpdateRule
	GuiControl,Enable,BRuleUp
	GuiControl,Enable,BRuleDelete
	GuiControl,Enable,BRuleDown
	if(Target_Editing=target){
		Gui,ListView,LVRule
		LV_Modify(idx,"Select")
	}
}
ClearRule(){
	global
	Rule_Editing=0
	GuiControl,Choose,DDLRuleType,1
	GuiControl,,ERuleValue,
	GuiControl,Disable,BUpdateRule
	GuiControl,Disable,BRuleUp
	GuiControl,Disable,BRuleDelete
	GuiControl,Disable,BRuleDown
}

BAddRulePress:
	Gui,Submit,NoHide
	AddRule(Target_Editing,DDLRuleType,ERuleValue)
return
AddRule(tgt,type,val){
	local idx
	idx:=++Target_%tgt%_Count
	UpdateRule(tgt,idx,type,val)
}

BUpdateRulePress:
	Gui,Submit,NoHide
	UpdateRule(Target_Editing,Rule_Editing,DDLRuleType,ERuleValue)
return
UpdateRule(tgt,idx,type,val){
	global
	Target_%tgt%_%idx%_Type:=RuleType_%type%
	Target_%tgt%_%idx%_Value:=val
	if(Target_Editing=tgt){
		ShowTarget(tgt)
		ShowRule(tgt,idx)
	}
}


; Rule Picker Button
BRulePicker:
Gui,Submit,NoHide
if(DDLRuleType<5){
	SetTimer,RulePickerTimer,100
	Hotkey,RButton up,RulePickerHotkey,On
}else if(DDLRuleType=5){
	Menu,CustomExpressions,Show
}else if(DDLRuleType=6){
	Menu,TargetList,Show
}
return

RulePickerTimer:
Tooltip,Right-Click on Target Window
return


RulePickerHotkey:
	CoordMode,Mouse,Screen
	MouseGetPos,MG_X,MG_Y,MG_HWND,MG_HCTL,3
	SendMessage,0x84,0,% MG_Y<<16|MG_X,,ahk_id %MG_HCTL%
	If ErrorLevel=4294967295
		MouseGetPos,,,,MG_HCTL,2
	if(DDLRuleType=1){
		WinGetClass,ERuleValue,ahk_id %MG_HWND%
	}else if(DDLRuleType=2){
		WinGetClass,ERuleValue,ahk_id %MG_HCTL%
	}else if(DDLRuleType=3){
		WinGet,ERuleValue,ProcessName,ahk_id %MG_HWND%
	}else{
		WinGetTitle,ERuleValue,ahk_id %MG_HWND%
	}
	GuiControl,,ERuleValue,%ERuleValue%
	SetTimer,RulePickerTimer,Off
	Hotkey,RButton up,Off
	Tooltip
return


AddCustomTemplate(submenu,title="",value=""){
	local c
	Menu,CustomExpressions%submenu%,Add,%title%,CustomExpressionsMenuSelect
	if(CustomExpressions%submenu%_Count){
		c:=++CustomExpressions%submenu%_Count
	}else{
		c:=CustomExpressions%submenu%_Count:=1
	}
	CustomExpressions%submenu%_%c%:=value
}
AddCustomTemplateSub(submenu,title,name){
	local nn
	nn=%submenu%_%name%
	Menu,CustomExpressions%nn%,Add
	Menu,CustomExpressions%nn%,DeleteAll
	Menu,CustomExpressions%submenu%,Add,%title%,:CustomExpressions%nn%
	return nn
}
CustomExpressionsMenuSelect:
	if(IsLabel(%A_ThisMenu%_%A_ThisMenuItemPos%)){
		GoSub,% %A_ThisMenu%_%A_ThisMenuItemPos%
	}else{
		SetRuleValue(%A_ThisMenu%_%A_ThisMenuItemPos%)
	}
return
SetRuleValue(val){
	GuiControl,,ERuleValue,%val%
}

TargetListMenuSelect:
	GuiControl,,ERuleValue,%A_ThisMenuItem%
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Gesture Routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GestureNew:
	Gesture_Count++
	Gesture_%Gesture_Count%_Name=Gesture_%Gesture_Count%
	Gesture_%Gesture_Count%_Count=0
	ShowGestures()
	ShowGesture(Gesture_Count)
return

GestureUp:
	if(Gesture_Editing>1){
		GestureSwap(Gesture_Editing-1,Gesture_Editing)
		ShowGestures()
		ShowGesture(Gesture_Editing-1)
	}
return
GestureDown:
	if(Gesture_Editing<Gesture_Count){
		GestureSwap(Gesture_Editing,Gesture_Editing+1)
		ShowGestures()
		ShowGesture(Gesture_Editing+1)
	}
return

GestureDelete:
	GestureDelete(Gesture_Editing)
	ShowGestures()
	ShowGesture((Gesture_Editing>Gesture_Count) ? Gesture_Count : Gesture_Editing)
return
GestureDelete(idx){
	global
	Msgbox,1,Delete Confirm,% "Are you sure to delete Gesture/Action: " . Gesture_%idx%_Name
	IfMsgBox,OK
	{
		Loop{
			idx++
			GestureMove(idx,idx-1)
			if(idx>=Gesture_Count){
				break
			}
		}
		Gesture_Count--
	}
}

GestureMove(from,to){
	global
	Gesture_%to%_Name:=Gesture_%from%_Name
	Gesture_%to%_Patterns:=Gesture_%from%_Patterns
	Gesture_%to%_Count:=Gesture_%from%_Count
	Loop,% Gesture_%from%_Count
	{
		Gesture_%to%_%A_Index%_Target:=Gesture_%from%_%A_Index%_Target
		Gesture_%to%_%A_Index%_Action:=Gesture_%from%_%A_Index%_Action
	}
	
}
GestureSwap(a,b){
	GestureMove(a,"tmp")
	GestureMove(b,a)
	GestureMove("tmp",b)
}
GestureRename1:
	Gui,Submit,NoHide
	Gesture_%Gesture_Editing%_Name=%EGestureName1%
	ShowGestures()
	ShowGesture(Gesture_Editing)
return

GestureRename2:
	Gui,Submit,NoHide
	Gesture_%Gesture_Editing%_Name=%EGestureName2%
	ShowGestures()
	ShowGesture(Gesture_Editing)
return


ShowGestures(){
	global
	local str
	Loop,%Gesture_Count%{
		Join(str,Gesture_%A_Index%_Name)
	}
	GuiControl,,LBGesture1,`n%str%
	GuiControl,,LBGesture2,`n%str%
}

LBGestureSelect1:
	Gui,Submit,NoHide
	ShowGesture(LBGesture1)
	ClearAction()
	GuiControl,Enable,BAddGesturePattern
return

LBGestureSelect2:
	Gui,Submit,NoHide
	ShowGesture(LBGesture2)
	ClearAction()
	GuiControl,Enable,BAddGesturePattern
return

ShowGesture(idx){
	local v
	Gesture_Editing:=idx
	GuiControlGet,v,FocusV
	if(v!="LBGesture1"){
		GuiControl,Choose,LBGesture1,%idx%
	}
	if(v!="LBGesture2"){
		GuiControl,Choose,LBGesture2,%idx%
	}
	GuiControl,,EGestureName1,% Gesture_%idx%_Name
	GuiControl,,EGestureName2,% Gesture_%idx%_Name
	GuiControl,Enable,BGestureRename1
	GuiControl,Enable,BGestureRename2
	GuiControl,,LBGesturePattern,% "`n" . Gesture_%idx%_Patterns
	
	Gui,ListView,LVAction
	GuiControl,-Redraw,LVAction
	LV_Delete()
	Loop,% Gesture_%idx%_Count {
		LV_Add("",Gesture_%idx%_%A_Index%_Target,Gesture_%idx%_%A_Index%_Action)
	}
	GuiControl,+Redraw,LVAction
	GuiControl,Enable,BAddAction
	GuiControl,Choose,LBGesturePattern,%GesturePattern_Editing%
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Gesture Pattern
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GesturePatternUp:
if(GesturePatternSwap(Gesture_Editing,GesturePattern_Editing-1,GesturePattern_Editing)){
	ShowGesture(Gesture_Editing)
	ShowGesturePattern(Gesture_Editing,GesturePattern_Editing-1)
}
return

GesturePatternDown:
if(GesturePatternSwap(Gesture_Editing,GesturePattern_Editing,GesturePattern_Editing+1)){
	ShowGesture(Gesture_Editing)
	ShowGesturePattern(Gesture_Editing,GesturePattern_Editing+1)
}
return

GesturePatternDelete:
	GesturePatternDelete(Gesture_Editing,GesturePattern_Editing)
	ShowGesture(Gesture_Editing)
	ShowGesturePattern(Gesture_Editing,GesturePattern_Editing)
return

GesturePatternDelete(g,idx){
	local tmp,cnt
	Loop,Parse,Gesture_%g%_Patterns,`n
	{
		if(A_Index!=idx){
			Join(tmp,A_LoopField)
			cnt++
		}
	}
	Gesture_%g%_Patterns:=tmp
}

GesturePatternSwap(g,a,b){
	local tmp
	StringSplit,tmp,Gesture_%g%_Patterns,`n
	if((a<1)||(b<1)||(a>tmp0)||(b>tmp0)){
		return
	}
	tmp:=tmp%a%
	tmp%a%:=tmp%b%
	tmp%b%:=tmp
	tmp=
	Loop,%tmp0%{
		Join(tmp,tmp%A_Index%)
	}
	Gesture_%g%_Patterns:=tmp
	return 1
}


LBGesturePatternSelect:
	Gui,Submit,NoHide
	ShowGesturePattern(Gesture_Editing,LBGesturePattern)
return

ShowGesturePattern(g,idx){
	global
	Loop,Parse,Gesture_%g%_Patterns,`n
	{
		if(A_Index=idx){
			GuiControl,,EGesture,% A_LoopField
			break
		}
	}
	GesturePattern_Editing:=idx
	GuiControl,Choose,LBGesturePattern,%idx%
	GuiControl,Enable,BUpdateGesturePattern
	GuiControl,Enable,BGesturePatternUp
	GuiControl,Enable,BGesturePatternDelete
	GuiControl,Enable,BGesturePatternDown
}
EGestureChange:
	Gui,Submit,NoHide
	if(!EGesture){
		GuiControl,Disable,BStrokeUR
		GuiControl,Disable,BStrokeU
		GuiControl,Disable,BStrokeUL
		GuiControl,Disable,BStrokeR
		GuiControl,Disable,BStrokeL
		GuiControl,Disable,BStrokeDR
		GuiControl,Disable,BStrokeD
		GuiControl,Disable,BStrokeDL
		GuiControl,Disable,BGesturePatternBS
		GuiControl,Disable,BButtonUp
	}else{
		GuiControl,Enable,BStrokeU
		GuiControl,Enable,BStrokeR
		GuiControl,Enable,BStrokeL
		GuiControl,Enable,BStrokeD
		GuiControl,Enable,BGesturePatternBS
		GuiControl,Enable,BButtonUp
		if(Config_8Dir){
			GuiControl,Enable,BStrokeUR
			GuiControl,Enable,BStrokeDR
			GuiControl,Enable,BStrokeDL
			GuiControl,Enable,BStrokeUL
		}
	}
	Loop,%Gesture_Count%{
		if(!EGesture || RegExMatch("`n" Gesture_%A_Index%_Patterns "`n","`n" EGesture "`n") || !RegExMatch(EGesture,"^([DLRU_12346789]|(" ButtonRegEx ")_)+$")){
			GuiControl,Disable,BAddGesturePattern
			GuiControl,Disable,BUpdateGesturePattern
			return
		}
	}
	if(Gesture_Editing){
		GuiControl,Enable,BAddGesturePattern
		if(GesturePattern_Editing){
			GuiControl,Enable,BUpdateGesturePattern
		}
	}
return

GesturePatternBS:
	Gui,Submit,NoHide
	GuiControl,,EGesture,% RegExReplace(EGesture,"((" ButtonRegEx ")_|[DLRU_12346789])$")
return

BAddGesturePattern:
	Gui,Submit,NoHide
	AddGesturePattern(Gesture_Editing,EGesture)
return
AddGesturePattern(g,p){
	global
	Join(Gesture_%Gesture_Editing%_Patterns,p)
	if(Gesture_Editing=g){
		ShowGesture(g)
	}
}

BUpdateGesturePattern:
	Gui,Submit,NoHide
	UpdateGesturePattern(Gesture_Editing,GesturePattern_Editing,EGesture)
return
UpdateGesturePattern(g,idx,p){
	local tmp
	Loop,Parse,Gesture_%g%_Patterns,`n
	{
		if(A_Index=idx){
			Join(tmp,p)
		}else{
			Join(tmp,A_LoopField)
		}
	}
	Gesture_%g%_Patterns:=tmp
	if(Gesture_Editing=g){
		ShowGesture(g)
	}
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Action Routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ActionUp:
	if(Action_Editing>1){
		ActionSwap(Gesture_Editing,Action_Editing-1,Action_Editing)
		ShowGesture(Gesture_Editing)
		ShowAction(Gesture_Editing,Action_Editing-1)
	}
return
ActionDown:
	if(Action_Editing<Gesture_%Gesture_Editing%_Count){
		ActionSwap(Gesture_Editing,Action_Editing,Action_Editing+1)
		ShowGesture(Gesture_Editing)
		ShowAction(Gesture_Editing,Action_Editing+1)
	}
return

ActionDelete:
	ActionDelete(Gesture_Editing,Action_Editing)
	ShowGesture(Gesture_Editing)
	ShowAction(Gesture_Editing,(Action_Editing>Gesture_%Gesture_Editing%_Count) ? Gesture_%Gesture_Editing%_Count : Action_Editing)
return

ActionDelete(g,idx){
	global
	Loop{
		idx++
		ActionMove(g,idx,idx-1)
		if(idx>=Gesture_%Gesture_Editing%_Count){
			break
		}
	}
	Gesture_%Gesture_Editing%_Count--
}

ActionSwap(g,a,b){
	ActionMove(g,a,"tmp")
	ActionMove(g,b,a)
	ActionMove(g,"tmp",b)
}
ActionMove(g,from,to){
	global
	Gesture_%g%_%to%_Target:=Gesture_%g%_%from%_Target
	Gesture_%g%_%to%_Action:=Gesture_%g%_%from%_Action
}



LVActionSelect:
	if(A_EventInfo && A_EventInfo!=Action_Editing){
		ShowAction(Gesture_Editing,A_EventInfo)
	}
return
ShowAction(g,idx){
	local t,a
	Action_Editing:=idx
	GuiControl,ChooseString,DDLTarget,% Gesture_%g%_%idx%_Target
	GuiControl,,EAction,% RegExReplace(Gesture_%g%_%idx%_Action,"(?<!\t)\t","`n")
	if(g=Gesture_Editing){
		Gui,ListView,LVAction
		LV_Modify(idx,"Select")
	}
	GuiControl,Enable,BUpdateAction
	GuiControl,Enable,BActionUp
	GuiControl,Enable,BActionDelete
	GuiControl,Enable,BActionDown
}
ClearAction(){
	global
	GesturePattern_Editing=0
	Action_Editing=0
	GuiControl,,EGesture,
	GuiControl,ChooseString,DDLTarget,1
	GuiControl,,EAction,
	GuiControl,Disable,BUpdateAction
	GuiControl,Disable,BUpdateGesturePattern
	GuiControl,Disable,BGesturePatternUp
	GuiControl,Disable,BGesturePatternDelete
	GuiControl,Disable,BGesturePatternDown
	GuiControl,Disable,ActionUp
	GuiControl,Disable,ActionDelete
	GuiControl,Disable,ActionDown
}

BAddActionPress:
	Gui,Submit,NoHide
	AddAction(Gesture_Editing,DDLTarget,EAction)
return
AddAction(g,t,s){
	local idx
	idx:=++Gesture_%g%_Count
	UpdateAction(g,idx,t,s)
	
}

BUpdateActionPress:
	Gui,Submit,NoHide
	UpdateAction(Gesture_Editing,Action_Editing,DDLTarget,EAction)
return
UpdateAction(g,a,t,s){
	global
	Gesture_%g%_%a%_Target:=t
	Gesture_%g%_%a%_Action:=RegExReplace(s,"\n","	")
	if(Gesture_Editing=g){
		ShowGesture(g)
		ShowAction(g,a)
	}
}

AddActionTemplate(title,script){
	global
	static ActionTemplate_Count=0
	ActionTemplate_Count++
	ActionTemplate_%ActionTemplate_Count%:=script
	GuiControl,,DDLActionTemplate,%title%
}
BAddActionLinePress:
	Gui,Submit,NoHide
	if(IsLabel(ActionTemplate_%DDLActionTemplate%)){
		Gosub,% ActionTemplate_%DDLActionTemplate%
	}else{
		ActionLine:=ActionTemplate_%DDLActionTemplate%
		loop{
			if(RegExMatch(ActionLine,"%\[(.+?)\]%",$)){
				InputBox,ActionLineOption,Input Parameters,%$1%
				if(ErrorLevel){
					return
				}
				ActionLine:=RegExReplace(ActionLine,"%\[(.+?)\]%",ActionLineOption)
			}else{
				break
			}
		}
		AddScript(ActionLine)
	}
return

AddScript(script,pos=""){
	global
	Gui,Submit,NoHide
	if(pos="top"){
		EAction=%script%`n%EAction%
	}else{
		Join(EAction,script)
	}
	GuiControl,,EAction,%EAction%
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Get Button ID
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Rule Picker Button
ButtonIDPicker:
	Hotkey,RButton up,ButtonIDPickerHotkey,On
	SetTimer,ButtonIDPickerTimer,100
return

ButtonIDPickerTimer:
	Tooltip,Right-Click on Tartget Button
return


ButtonIDPickerHotkey:
	Hotkey,RButton up,Off
	SetTimer,ButtonIDPickerTimer,Off
	Tooltip
	if(ButtonIDPicker_ID:=GetButtonCID()){
		AddScript("SendMessage,0x111," ButtonIDPicker_ID ",0")
	}
return


GetButtonCID(){
	CoordMode,Mouse,Screen
	MouseGetPos,MG_X,MG_Y,MG_HWND,MG_HCTL,3
	SendMessage,0x84,0,% MG_Y<<16|MG_X,,ahk_id %MG_HCTL%
	If ErrorLevel=4294967295
		MouseGetPos,,,,MG_HCTL,2
	;mouse position on control
	WinGetPos,wx,wy,,,ahk_id %MG_HWND%
	ControlGetPos,cx,cy,,,,ahk_id %MG_HCTL%
	cmx:=MG_X-cx-wx
	cmy:=MG_Y-cy-wy
	;count
	SendMessage,0x0418,0,0,,ahk_id %MG_HCTL%
	c=%ErrorLevel%
	if(c>0){
		WinGet,pid,pid,ahk_id %MG_HWND%
		hProc:=DllCall("OpenProcess",UInt,0x1F0FFF,UInt,0,UInt,pid,UInt)
		lpTB:=DllCall("VirtualAllocEx",UInt,hProc,UInt,0,UInt,20,UInt,0x1000,UInt,0x4,UInt)
		Loop,%c%{
			;button struct
			SendMessage,0x417,% A_Index-1,%lpTB%,,ahk_id %MG_HCTL%
			DllCall("ReadProcessMemory",UInt,hProc,UInt,lpTB+8,UIntP,stt,UInt,4,UInt,0)
			if(!(stt&8)){
				;not hidden
				DllCall("ReadProcessMemory",UInt,hProc,UInt,lpTB+4,UIntP,cid,UInt,4,UInt,0)
				SendMessage,0x433,cid,%lpTB%,,ahk_id %MG_HCTL%
				DllCall("ReadProcessMemory",UInt,hProc,UInt,lpTB,UIntP,x1,UInt,4,UInt,0)
				DllCall("ReadProcessMemory",UInt,hProc,UInt,lpTB+4,UIntP,y1,UInt,4,UInt,0)
				DllCall("ReadProcessMemory",UInt,hProc,UInt,lpTB+8,UIntP,x2,UInt,4,UInt,0)
				DllCall("ReadProcessMemory",UInt,hProc,UInt,lpTB+12,UIntP,y2,UInt,4,UInt,0)
				if((x1<=cmx)&&(x2>=cmx)&&(y1<=cmy)&&(y2>=cmy)){
					;under the cursor
					break
				}
			}
		}
		DllCall("VirtualFreeEx", UInt,lpTB, UInt,0, UInt,0x8000)
		DllCall("psapi\CloseProcess",UInt,hProc)
		return cid
	}
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Option Routines
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



ShowConfig(){
	global
	Loop,Parse,Configs,`n
		GuiControl,,Config_%A_LoopField%,% Config_%A_LoopField%
	Loop,Parse,ListConf,`n
		GuiControl,Choose,Config_%A_LoopField%,% Config_%A_LoopField%
}
GetConfig(){
}

reset(){
	global
	Target_Count=0
	Gesture_Count=0
	Loop,Parse,Configs,`n
	{
		Config_%A_LoopField%=
	}
}
loadIniFile(fn){
	FileRead,str,%fn%
	loadIni(str)
}

ImportFromClipboard:
	loadIni(RegExReplace(Clipboard,"【TAB】","	"))
	ShowTargets()
	ShowGestures()
	ShowConfig()
return

loadIni(str){
	global
	local line,$,$1,$2,com,SName,tidx,gidx,rcount,acount,isg,tmp
	str=%str%`n[EndOfIni]`n
	Loop,parse,str,`n,`r%A_Tab%%A_Space%
	{
		; Lines
		line:=RegExReplace(A_LoopField,"\s+#.*$")
		if(RegExMatch(line,"^\s*\/\*")){
			; Start comments
			if(!RegExMatch(line,"\*\/\s*$")){
				com=1
			}
		}else if(RegExMatch(line,"\*\/\s*$")){
			; End comments
			com=0
		}else if(RegExMatch(line,"^\s*#")||com){
			; Skip other comments
		}else if(RegExMatch(line,"^\[(.+)\]$",$)){
			; Section
			if(isg){
				; Previous section is gesture
				Gesture_%gidx%_Count:=acount
				if(!Gesture_%gidx%_Name){
					Gesture_%gidx%_Name:=SName
					Gesture_Count++
				}
			}else if(SName!="Settings" && SName!=""){
				; Previous section is application
				Target_%tidx%_Count:=rcount
				if(!Target_%tidx%_Name){
					Target_%tidx%_Name:=SName
					Target_Count++
				}
			}
			SName:=$1
			if(tidx:=TargetIndexOf(SName)){
				rcount:=Target_%tidx%_Count
			}else{
				tidx:=Target_Count+1
				Target_%tidx%_Name=
				Target_%tidx%_IsAnd=0
				rcount=0
			}
			if(gidx:=GestureIndexOf(SName)){
				acount:=Gesture_%gidx%_Count
			}else{
				gidx:=Gesture_Count+1
				Gesture_%gidx%_Name=
				Gesture_%gidx%_Patterns=
				Gesture_%gidx%_Default=
				acount=0
			}
			isg:=Gesture_%gidx%_Patterns ? 1 : 0
		}else if(RegExMatch(line,"^(.+?)\s*=\s*(.*?)$",$)){
			; Entry
			if(SName="Settings"){
				Config_%$1%:=$2
			}else if(RegExMatch($1,"^(WClass|CClass|Title|Exe|Custom|Include)$")){
				; Target rule
				rcount++
				Target_%tidx%_%rcount%_Type:=$1
				Target_%tidx%_%rcount%_Value:=$2
			}else if($1="And"){
				; Target rule and mode
				Target_%tidx%_IsAnd:=$2
			}else if($1="G"){
				; Gesture
				Join(Gesture_%gidx%_Patterns,$2)
				isg=1
			}else{
				; Condition
				acount++
				Gesture_%gidx%_%acount%_Target:=$1
				Gesture_%gidx%_%acount%_Action:=$2
			}
		}
	}
}
TargetIndexOf(name){
	global
	Loop,%Target_Count%{
		if(Target_%A_Index%_Name=name){
			return A_Index
		}
	}
	return 0
}
GestureIndexOf(name){
	global
	Loop,%Gesture_Count%{
		if(Gesture_%A_Index%_Name=name){
			return A_Index
		}
	}
	return 0
}

DefVal(val,def){
	return (val="") ? def : val
}
IndexOf(ByRef list,value,delim="`n"){
	Loop,Parse,%delim%
	{
		if(A_LoopField=value){
			return A_Index
		}
	}
	return 0
}
Join(ByRef list,value,delim="`n"){
	list:=list ? (list . delim . value) : value
}

SaveExit:
	FileDelete,%A_ScriptDir%\MouseGesture.ini
	FileAppend,% ToIni(),%A_ScriptDir%\MouseGesture.ini
	FileDelete,%A_ScriptDir%\MG_Config.ahk
	FileAppend,% ToAhk(),%A_ScriptDir%\MG_Config.ahk
ExitApp

saveIniFile(fn){
}
ToIni(){
	local tmp
	tmp:=ConfigToIni()
	Loop,%Target_Count%
		tmp:=tmp . "`n" . TargetToIni(A_Index)
	Loop,%Gesture_Count%
		tmp:=tmp . "`n" . GestureToIni(A_Index)
	return tmp
}

ConfigToIni(){
	local res
	Gui,Submit,NoHide
	res=[Settings]`n
	Loop,Parse,Configs,`n
		res:=res . "" . A_LoopField . "=" . Config_%A_LoopField% . "`n"
	Loop,Parse,ListConf,`n
		res:=res . "" . A_LoopField . "=" . Config_%A_LoopField% . "`n"
	return res
}
TargetToIni(idx){
	local res,delim
	res:="[" . Target_%idx%_Name . "]`n"
	if(Target_%idx%_IsAnd){
		res:=res . "And=1`n"
	}
	Loop,% Target_%idx%_Count
		res:=res . Target_%idx%_%A_Index%_Type "=" Target_%idx%_%A_Index%_Value "`n"
	return res
}
CopyTarget:
	Clipboard:=RegExReplace(TargetToIni(Target_Editing),"\n","`r`n")
return

GestureToIni(idx){
	local gr,res,def
	res:="[" . Gesture_%idx%_Name . "]`n" . RegExReplace(Gesture_%idx%_Patterns,"(^|\n)","$1G=") . "`n"
	Loop,% Gesture_%idx%_Count
		res:=res . Gesture_%idx%_%A_Index%_Target . "=" Gesture_%idx%_%A_Index%_Action . "`n"
	return res
}

CopyGesture:
	Clipboard:=RegExReplace(RegExReplace(GestureToIni(Gesture_Editing),"\t","【TAB】"),"\n","`r`n")
return

loadButtons(){
	global
	Loop,%A_ScriptDir%\MG_Buttons\*.ahk
	{
		if(RegExMatch(A_LoopFileName,"^([a-zA-Z0-9]+)\.ahk$",$) && !InStr("`n" . Buttons . "`n","`n" . $1 . "`n")){
			Join(Buttons,$1)
		}
	}
	LBButtons=
	Loop,Parse,Buttons,`n
	{
		if(Button_%A_LoopField%){
			Join(LBButtons,Button_%A_LoopField%)
		}else{
			Join(LBButtons,A_LoopField)
		}
		Join(ButtonRegEx,A_LoopField,"|")
		Button_%A_Index%=%A_LoopField%
	}
}

DefineNewButton:
	Gui,Submit,NoHide
	DefineButton(NewButtonName,NewButtonKey)
return

DefineButton(name,key){
	global
	local key2
	
	key2:=RegExReplace("^~","",key)
	if(!FileExist(A_ScriptDir . "MG_Buttons\" . name . ".ahk")){
		FileAppend,
(
Goto,MG_%name%_End

MG_%name%_Enable:
	Hotkey,*%key%,MG_%name%_DownHotkey,On
	Hotkey,*%key% up,MG_%name%_UpHotkey,On
return

MG_%name%_Disable:
	Hotkey,*%key%,MG_%name%_DownHotkey,Off
	Hotkey,*%key% up,MG_%name%_UpHotkey,Off
return

MG_%name%_DownHotkey:
	MG_TriggerDown("%name%")
return

MG_%name%_UpHotkey:
	MG_TriggerUp("%name%")
return

MG_%name%_Down:
	SetMouseDelay,-1
	Send,{Blind}{%key2% Down}
return

MG_%name%_Up:
	SetMouseDelay,-1
	Send,{Blind}{%key2% Up}
return

MG_%name%_End:

),%A_ScriptDir%\MG_Buttons\%name%.ahk
		Join(Buttons,name)
		LBButtons=
		Loop,Parse,Buttons,`n
		{
			if(Button_%A_LoopField%){
				Join(LBButtons,Button_%A_LoopField%)
			}else{
				Join(LBButtons,A_LoopField)
			}
			Join(ButtonRegEx,A_LoopField,"|")
			Button_%A_Index%=%A_LoopField%
		}
		GuiControl,,LBButtons,`n%LBButtons%
		MsgBox,Button [%name%] is added sucessfully 
	}
}


ToAhk(){
	local MaxLen,AG,Triggers,SubTriggers,ahk,BT2
	tmp:=ConfigToAhk()
	Loop,%Gesture_Count%{
		Loop,Parse,Gesture_%A_Index%_Patterns,`n
		{
			Join(AG,A_LoopField)
			MaxLen:=(MaxLen<StrLen(A_LoopField)) ? StrLen(A_LoopField) : MaxLen
		}
	}
	AG=`n%AG%`n
	tmp:=tmp . "MG_MaxLength=" . MaxLen . "`n"
	
	Loop,Parse,Buttons,`n
	{
		if(RegExMatch(AG,"`n" . A_LoopField . "_")){
			Join(Triggers,A_LoopField,"_")
			Use_%A_LoopField%=1
		}else{
			Join(BT2,A_LoopField)
		}
	}
	tmp:=tmp . "MG_Triggers=" . Triggers . "`n"
	
	AG:=RegExReplace(AG,"_","`n")
	Loop,Parse,BT2,`n
	{
		if(RegExMatch(AG,"`n" . A_LoopField . "`n")){
			Join(SubTriggers,A_LoopField,"_")
			Use_%A_LoopField%=1
		}
	}
	tmp:=tmp . "MG_SubTriggers=" . SubTriggers . "`n"
	
	Triggers=%Triggers%_%SubTriggers%
	Loop,Parse,Triggers,_
	{
		FileRead,ahk,%A_ScriptDir%\MG_Buttons\%A_LoopField%.ahk
		tmp:=tmp . "`n`n" . ahk
	}
	tmp:=tmp . "`n`nGoto,MG_Config_End`n`n"
	
	Loop,%Target_Count%
		tmp:=tmp . "`n" . TargetToAhk(A_Index)
	Loop,%Gesture_Count%
		tmp:=tmp . "`n" . GestureToAhk(A_Index)
	
	tmp:=tmp . "`n`nMG_Config_end:"
	return tmp
}
ConfigToAhk(){
	local res
	Loop,Parse,Configs,`n
		res:=res . "MG_" . A_LoopField . ":=" . Config_%A_LoopField% . "`n"
	Loop,Parse,ListConf,`n
		res:=res . "MG_" . A_LoopField . ":=" . Config_%A_LoopField% . "`n"
	return res
}
TargetToAhk(idx){
	local res,delim
	delim:=Target_%idx%_IsAnd ? "&&" : "||"
	Loop,% Target_%idx%_Count
	{
		if(Target_%idx%_%A_Index%_Type="Custom"){
			Join(res,"(" . Target_%idx%_%A_Index%_Value . ")",delim)
		}else if(Target_%idx%_%A_Index%_Type="Include"){
			Join(res,"(MG_Is" . Target_%idx%_%A_Index%_Value . "())",delim)
		}else{
			Join(res,"(MG_" . Target_%idx%_%A_Index%_Type . "=""" . Target_%idx%_%A_Index%_Value . """)",delim)
		}
	}
	if(!res){
		res=0
	}
	res:="MG_Is" . Target_%idx%_Name . "(){`n	global`n	return (" . res . ")`n}`n"
	return res
}
GestureToAhk(idx){
	local gr,res,def
	gr:=RegExReplace(RegExReplace(Gesture_%idx%_Patterns,"(^|\n)","$1MG_Gesture_"),"\n|$",":`n")
	
	Loop,% Gesture_%idx%_Count
	{
		if(Gesture_%idx%_%A_Index%_Target="Default"){
			def:=RegExReplace(Gesture_%idx%_%A_Index%_Action,"(?<!\t)\t","`n		")
		}else if(res){
			res:=res . "else if(MG_Is" . Gesture_%idx%_%A_Index%_Target . "()){`n		" . RegExReplace(Gesture_%idx%_%A_Index%_Action,"(?<!\t)\t","`n		") . "`n	}"
		}else{
			res:="if(MG_Is" . Gesture_%idx%_%A_Index%_Target . "()){`n		" . RegExReplace(Gesture_%idx%_%A_Index%_Action,"(?<!\t)\t","`n		") . "`n	}"
		}
	}
	if(res){
		if(!def){
			def=MG_Cancel()
		}
		res=%gr%	%res%else{`n		%def%`n	}`n
	}else{
		res=%gr%	%def%`n
	}
	res=%res%return`n
	return res
}

#NoEnv
#Singleinstance force
;#NoTrayIcon

