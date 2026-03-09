Scriptname UDGP_Retroactive11Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive111Script Property Retro111 Auto
Actor Property PlayerRef Auto

Quest Property DLC01SoulCairnHorseQuest2 Auto
MiscObject Property sc_ArvakSkullUNIQUE Auto

Quest Property FreeformHighHrothgarA Auto
Location Property ArcwindPoint Auto
LocationAlias Property WordLocAlias Auto
DLC1WordWallTriggerScript Property WallTrigger Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 1.1 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 110
		Retro111.Process()
		Stop()
		Return
	EndIf
	
	;Bugzilla #3446 - Arvak's skull is not removed from the player.
	if( DLC01SoulCairnHorseQuest2.GetStageDone(200) == 1 )
		PlayerRef.RemoveItem(sc_ArvakSkullUNIQUE)
	EndIf
	
	;Bugzilla #4515 - Arcwind Point word wall is stuck in the journal after learning the word.
	if( FreeformHighHrothgarA.IsRunning() )
		if( WordLocAlias.Getlocation() == ArcwindPoint )
			if( WallTrigger.WordLearned == true )
				FreeformHighHrothgarA.SetStage(20)
			EndIf
		EndIf
	EndIf
	
	debug.trace( "UDGP 1.1 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 110
	Retro111.Process()
	Stop()	
EndFunction
