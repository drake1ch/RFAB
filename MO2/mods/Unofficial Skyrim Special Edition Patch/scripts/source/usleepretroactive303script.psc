Scriptname USLEEPRetroactive303Script extends Quest  

Quest Property MQ101 Auto
USLEEP_VersionTrackingScript Property USLEEPTracking Auto
USLEEPRetroactive304Script Property Retro304 Auto

Faction Property CR08ExclusionFaction Auto
Quest Property CR08 Auto
ReferenceAlias Property CR08Victim Auto
ReferenceAlias Property DLC2Gjalund Auto

Quest Property dunAlftandQST Auto
ReferenceAlias Property Sulla Auto
ReferenceAlias Property Umana Auto
ReferenceAlias Property Jdarr Auto

Quest Property MS07Rumor Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USLEEP 3.0.3 Retroactive Updates Complete" )
		USLEEPTracking.LastVersion = 303
		Retro304.Process()
		Stop()
		Return
	EndIf

	;Bug #19926 - Gjaland should not be getting picked for CR08 or it will break the Dragonborn opening quest.
	DLC2Gjalund.GetActorReference().AddToFaction(CR08ExclusionFaction)

	if( CR08.IsRunning() )
		if( CR08Victim.GetActorReference() == DLC2Gjalund.GetActorReference() )
			CR08.SetStage(250)
		EndIf
	EndIf

	;Bug #19921 - Bodies of the raiders in Alftand are never disposed of. Quest never terminates.
	if( dunAlftandQST.IsRunning() )
		if( Sulla.GetActorReference().IsDead() )
			dunAlftandQST.SetStage(91)
		EndIf

		if( Umana.GetActorReference().IsDead() )
			dunAlftandQST.SetStage(92)
		EndIf

		if( Jdarr.GetActorReference().IsDead() )
			dunAlftandQST.SetStage(93)
		EndIf
	EndIf

	;Bug #19969 - MS07Rumor is never terminated.
	if( MS07Rumor.GetStageDone(20) == 1 )
		MS07Rumor.Stop()
	EndIf

	debug.trace( "USLEEP 3.0.3 Retroactive Updates Complete" )
	USLEEPTracking.LastVersion = 303
	Retro304.Process()
	Stop()
EndFunction
