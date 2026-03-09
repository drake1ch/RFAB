Scriptname UHFP_VersionTrackingScript extends Quest  

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
UHFPRetroactive103Script Property Retro103 Auto
UHFPRetroactive110Script Property Retro110 Auto
UHFPRetroactive111Script Property Retro111 Auto
UHFPRetroactive112Script Property Retro112 Auto
UHFPRetroactive200Script Property Retro200 Auto
UHFPRetroactive201Script Property Retro201 Auto
UHFPRetroactive202Script Property Retro202 Auto
UHFPRetroactive203Script Property Retro203 Auto
UHFPRetroactive204Script Property Retro204 Auto
UHFPRetroactive208Script Property Retro208 Auto

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

	if( LastVersion < 208 )
		if( LastVersion < 103 )
			Retro103.Process()
		elseif( LastVersion < 110 )
			Retro110.Process()
		elseif( LastVersion < 111 )
			Retro111.Process()
		elseif( LastVersion < 112 )
			Retro112.Process()
		elseif( LastVersion < 200 )
			Retro200.Process()
		elseif( LastVersion < 201 )
			Retro201.Process()
		elseif( LastVersion < 202 )
			Retro202.Process()
		elseif( LastVersion < 203 )
			Retro203.Process()
		elseif( LastVersion < 204 )
			Retro204.Process()
		elseif( LastVersion < 208 )
			Retro208.Process()
			Stop()
		EndIf
	Else
		Stop()
	endif
EndFunction
