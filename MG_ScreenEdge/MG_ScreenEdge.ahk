
MG_Edge_Monitor_Set()

Goto,MG_ScrenEdge_End

MG_Edge_Monitor_Set(on=1){
	global
	if(on){
		SysGet,MG_Edge_Width,0
		SysGet,MG_Edge_Height,1
		MG_Edge_Right:=MG_Edge_Width-1
		MG_Edge_Bottom:=MG_Edge_Height-1
		SetTimer,MG_Edge_Monitor,20
	}else{
		SetTimer,MG_Edge_Monitor,OFF
	}
}

MG_Edge_Monitor:
	CoordMode,Mouse,Screen
	MouseGetPos,MG_Edge_X,MG_Edge_Y
	MG_Edge_State:=""
	if(MG_Edge_X=0){
		if(MG_Edge_Y=0 && MG_Edge_CLT_Enabled){
			MG_Edge_State=CLT
		}else if(MG_Edge_Y=MG_Edge_Bottom && MG_Edge_CLB_Enabled){
			MG_Edge_State=CLB
		}else if(MG_Edge_Y<(MG_Edge_Height/3) && MG_Edge_EL1_Enabled){
			MG_Edge_State=EL1
		}else if(MG_Edge_Y>=(MG_Edge_Height/3) && MG_Edge_Y<(MG_Edge_Height*2/3) && MG_Edge_EL2_Enabled){
			MG_Edge_State=EL2
		}else if(MG_Edge_Y>=(MG_Edge_Height*2/3) && MG_Edge_EL3_Enabled){
			MG_Edge_State=EL3
		}else if(MG_Edge_Y<(MG_Edge_Height/2) && MG_Edge_ELA_Enabled){
			MG_Edge_State=ELA
		}else if(MG_Edge_Y>=(MG_Edge_Height/2) && MG_Edge_ELB_Enabled){
			MG_Edge_State=ELB
		}else if(MG_Edge_EL_Enabled){
			MG_Edge_State=EL
		}
	}else if(MG_Edge_X=MG_Edge_Right){
		if(MG_Edge_Y=0 && MG_Edge_CRT_Enabled){
			MG_Edge_State=CRT
		}else if(MG_Edge_Y=MG_Edge_Bottom && MG_Edge_CRB_Enabled){
			MG_Edge_State=CRB
		}else if(MG_Edge_Y<(MG_Edge_Height/3) && MG_Edge_ER1_Enabled){
			MG_Edge_State=ER1
		}else if(MG_Edge_Y>=(MG_Edge_Height/3) && MG_Edge_Y<(MG_Edge_Height*2/3) && MG_Edge_ER2_Enabled){
			MG_Edge_State=ER2
		}else if(MG_Edge_Y>=(MG_Edge_Height*2/3) && MG_Edge_ER3_Enabled){
			MG_Edge_State=ER3
		}else if(MG_Edge_Y<(MG_Edge_Height/2) && MG_Edge_ERA_Enabled){
			MG_Edge_State=ERA
		}else if(MG_Edge_Y>=(MG_Edge_Height/2) && MG_Edge_ERB_Enabled){
			MG_Edge_State=ERB
		}else if(MG_Edge_ER_Enabled){
			MG_Edge_State=ER
		}
	}else if(MG_Edge_Y=0){
		if(MG_Edge_X<(MG_Edge_Width/3) && MG_Edge_ET1_Enabled){
			MG_Edge_State=ET1
		}else if(MG_Edge_X>=(MG_Edge_Width/3) && MG_Edge_X<(MG_Edge_Width*2/3) && MG_Edge_ET2_Enabled){
			MG_Edge_State=ET2
		}else if(MG_Edge_X>=(MG_Edge_Width*2/3) && MG_Edge_ET3_Enabled){
			MG_Edge_State=ET3
		}else if(MG_Edge_X<(MG_Edge_Width/2) && MG_Edge_ETA_Enabled){
			MG_Edge_State=ETA
		}else if(MG_Edge_X>=(MG_Edge_Width/2) && MG_Edge_ETB_Enabled){
			MG_Edge_State=ETB
		}else if(MG_Edge_ET_Enabled){
			MG_Edge_State=ET
		}
	}else if(MG_Edge_Y=MG_Edge_Bottom){
		if(MG_Edge_X<(MG_Edge_Width/3) && MG_Edge_EB1_Enabled){
			MG_Edge_State=EB1
		}else if(MG_Edge_X>=(MG_Edge_Width/3) && MG_Edge_X<(MG_Edge_Width*2/3) && MG_Edge_EB2_Enabled){
			MG_Edge_State=EB2
		}else if(MG_Edge_X>=(MG_Edge_Width*2/3) && MG_Edge_EB3_Enabled){
			MG_Edge_State=EB3
		}else if(MG_Edge_X<(MG_Edge_Width/2) && MG_Edge_EBA_Enabled){
			MG_Edge_State=EBA
		}else if(MG_Edge_X>=(MG_Edge_Width/2) && MG_Edge_EBB_Enabled){
			MG_Edge_State=EBB
		}else if(MG_Edge_EB_Enabled){
			MG_Edge_State=EB
		}
	}else{
		if(MG_Edge_Active){
			MG_Edge_State:=MG_Edge_Active
			MG_Edge_Active:=""
			MG_TriggerUp(MG_Edge_State)
		}
		MG_Edge_State:=""
	}
	if(!MG_Edge_Active && MG_Edge_State && MG_Edge_State!=MG_Edge_Active){
		MG_Edge_Active:=MG_Edge_State
		SetTimer,MG_Edge_TriggerTimer,-1
	}
return
MG_Edge_TriggerTimer:
	MG_TriggerDown(MG_Edge_Active)
return


MG_ScrenEdge_End:
