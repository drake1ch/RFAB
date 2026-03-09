Scriptname USKP_VersionTrackingScript extends Quest  

int Property LastVersion Auto

;Official Patches
Quest Property Patch1_4_UpdateQuest Auto
Quest Property Patch1_5_UpdateQuest Auto
Quest Property Patch1_6_UpdateQuest Auto
Quest Property Patch1_9_UpdateQuest Auto

;DLC Initializers
Quest Property DLC1Init Auto
Quest Property DLC2Init Auto
Quest Property BYOHRelationshipAdoptable Auto

;Yes, this list of quests will probably get tedious as time goes on.
USKPOnload02Script Property Retro103 Auto
USKPOnLoad04aScript Property Retro110 Auto
USKPOnLoad05Script Property Retro120 Auto
USKPRetroactive121Script Property Retro121 Auto
USKPRetroactive122Script Property Retro122 Auto
USKPRetroactive123Script Property Retro123 Auto
USKPRetroactive124Script Property Retro124 Auto
USKPRetroactive125Script Property Retro125 Auto
USKPRetroactive126Script Property Retro126 Auto
USKPRetroactive127Script Property Retro127 Auto
USKPRetroactive130Script Property Retro130 Auto
USKPRetroactive131Script Property Retro131 Auto
USKPRetroactive132Script Property Retro132 Auto
USKPRetroactive133Script Property Retro133 Auto
USKPRetroactive200Script Property Retro200 Auto
USKPRetroactive201Script Property Retro201 Auto
USKPRetroactive202Script Property Retro202 Auto
USKPRetroactive203Script Property Retro203 Auto
USKPRetroactive204Script Property Retro204 Auto
USKPRetroactive205Script Property Retro205 Auto
USKPRetroactive206Script Property Retro206 Auto
USKPRetroactive207Script Property Retro207 Auto
USKPRetroactive208Script Property Retro208 Auto
USKPRetroactive209Script Property Retro209 Auto
USKPRetroactive210Script Property Retro210 Auto
USKPRetroactive211Script Property Retro211 Auto
USKPRetroactive212Script Property Retro212 Auto
USKPRetroactive213Script Property Retro213 Auto

Event OnInit()
	;Only fires once, assumes that none of the retro-scripts have fired. They chain-fire each other, so only start the oldest one here.
	LastVersion = 0
	ProcessRetroScripts()
EndEvent

Function ProcessRetroScripts()
	;Let all official patches and DLC Initializers get processed first.
	While( Patch1_4_UpdateQuest.IsRunning() )
		Utility.Wait(1)
	EndWhile

	While( Patch1_5_UpdateQuest.IsRunning() )
		Utility.Wait(1)
	EndWhile

	While( Patch1_6_UpdateQuest.IsRunning() )
		Utility.Wait(1)
	EndWhile

	While( Patch1_9_UpdateQuest.IsRunning() )
		Utility.Wait(1)
	EndWhile

	While( DLC1Init.IsRunning() )
		Utility.Wait(1)
	EndWhile

	While( DLC2Init.GetStageDone(10) == 0 )
		Utility.Wait(1)
	EndWhile

	While( BYOHRelationshipAdoptable.GetStageDone(0) == 0 )
		Utility.Wait(1)
	EndWhile

	if( LastVersion < 213 )
		if( LastVersion < 103 )
			Retro103.Process()
		elseif( LastVersion < 110 )
			Retro110.Process()
		Elseif( LastVersion < 120 )
			Retro120.Process()
		Elseif( LastVersion < 121 )
			Retro121.Process()
		Elseif( LastVersion < 122 )
			Retro122.Process()
		elseif( LastVersion < 123 )
			Retro123.Process()
		Elseif( LastVersion < 124 )
			Retro124.Process()
		Elseif( LastVersion < 125 )
			Retro125.Process()
		Elseif( LastVersion < 126 )
			Retro126.Process()
		Elseif( LastVersion < 127 )
			Retro127.Process()
		Elseif( LastVersion < 130 )
			Retro130.Process()
		Elseif( LastVersion < 131 )
			Retro131.Process()
		Elseif( LastVersion < 132 )
			Retro132.Process()
		Elseif( LastVersion < 133 )
			Retro133.Process()
		Elseif( LastVersion < 200 )
			Retro200.Process()
		Elseif( LastVersion < 201 )
			Retro201.Process()
		Elseif( LastVersion < 202 )
			Retro202.Process()
		Elseif( LastVersion < 203 )
			Retro203.Process()
		Elseif( LastVersion < 204 )
			Retro204.Process()
		Elseif( LastVersion < 205 )
			Retro205.Process()
		Elseif( LastVersion < 206 )
			Retro206.Process()
		Elseif( LastVersion < 207 )
			Retro207.Process()
		Elseif( LastVersion < 208 )
			Retro208.Process()
		Elseif( LastVersion < 209 )
			Retro209.Process()
		Elseif( LastVersion < 210 )
			Retro210.Process()
		Elseif( LastVersion < 211 )
			Retro211.Process()
		Elseif( LastVersion < 212 )
			Retro212.Process()
		Elseif( LastVersion < 213 )
			Retro213.Process()
			Stop()
		EndIf
	Else
		Stop()
	endif
EndFunction
