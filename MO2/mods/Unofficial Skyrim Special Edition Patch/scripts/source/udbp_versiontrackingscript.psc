Scriptname UDBP_VersionTrackingScript extends Quest  

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
UDBP_Retroactive101Script Property Retro101 Auto
UDBP_Retroactive103Script Property Retro103 Auto
UDBP_Retroactive104Script Property Retro104 Auto
UDBP_Retroactive105Script Property Retro105 Auto
UDBP_Retroactive201Script Property Retro201 Auto
UDBP_Retroactive202Script Property Retro202 Auto
UDBP_Retroactive203Script Property Retro203 Auto
UDBP_Retroactive204Script Property Retro204 Auto
UDBP_Retroactive208Script Property Retro208 Auto
UDBP_Retroactive209Script Property Retro209 Auto
UDBP_Retroactive211Script Property Retro211 Auto
UDBP_Retroactive212Script Property Retro212 Auto

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

	if( LastVersion < 212 )
		if( LastVersion < 101 )
			Retro101.Process()
		ElseIf( LastVersion < 103 )
			Retro103.Process()
		ElseIf( LastVersion < 104 )
			Retro104.Process()
		ElseIf( LastVersion < 105 )
			Retro105.Process()
		ElseIf( LastVersion < 201 )
			Retro201.Process()
		ElseIf( LastVersion < 202 )
			Retro202.Process()
		ElseIf( LastVersion < 203 )
			Retro203.Process()
		ElseIf( LastVersion < 204 )
			Retro204.Process()
		ElseIf( LastVersion < 208 )
			Retro208.Process()
		ElseIf( LastVersion < 209 )
			Retro209.Process()
		ElseIf( LastVersion < 211 )
			Retro211.Process()
		ElseIf( LastVersion < 212 )
			Retro212.Process()
			Stop()
		EndIf
	Else
		Stop()
	endif
EndFunction
