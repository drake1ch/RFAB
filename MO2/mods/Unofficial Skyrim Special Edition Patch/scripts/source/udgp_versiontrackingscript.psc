Scriptname UDGP_VersionTrackingScript extends Quest  

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
UDGP_Retroactive11Script Property Retro110 Auto
UDGP_Retroactive111Script Property Retro111 Auto
UDGP_Retroactive112Script Property Retro112 Auto
UDGP_Retroactive113Script Property Retro113 Auto
UDGP_Retroactive120Script Property Retro120 Auto
UDGP_Retroactive121Script Property Retro121 Auto
UDGP_Retroactive122Script Property Retro122 Auto
UDGP_Retroactive123Script Property Retro123 Auto
UDGP_Retroactive124Script Property Retro124 Auto
UDGP_Retroactive200Script Property Retro200 Auto
UDGP_Retroactive201Script Property Retro201 Auto
UDGP_Retroactive202Script Property Retro202 Auto
UDGP_Retroactive203Script Property Retro203 Auto
UDGP_Retroactive204Script Property Retro204 Auto
UDGP_Retroactive206Script Property Retro206 Auto
UDGP_Retroactive211Script Property Retro211 Auto

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

	if( LastVersion < 211 )
		if( LastVersion < 110 )
			Retro110.Process()
		Elseif( LastVersion < 111 )
			Retro111.Process()
		Elseif( LastVersion < 112 )
			Retro112.Process()
		Elseif( LastVersion < 113 )
			Retro113.Process()
		Elseif( LastVersion < 120 )
			Retro120.Process()
		Elseif( LastVersion < 121 )
			Retro121.Process()
		Elseif( LastVersion < 122 )
			Retro122.Process()
		Elseif( LastVersion < 123 )
			Retro123.Process()
		Elseif( LastVersion < 124 )
			Retro124.Process()
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
		Elseif( LastVersion < 206 )
			Retro206.Process()
		Elseif( LastVersion < 211 )
			Retro211.Process()
			Stop()
		EndIf
	Else
		Stop()
	endif
EndFunction
