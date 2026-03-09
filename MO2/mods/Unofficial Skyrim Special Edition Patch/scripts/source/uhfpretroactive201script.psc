Scriptname UHFPRetroactive201Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive202Script Property Retro202 Auto

Quest Property BYOHHouseBanditAttack2 Auto
ReferenceAlias Property Spouse Auto
Faction Property dunPrisonerFaction Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 2.0.1 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 201
		Retro202.Process()
		Stop()
		Return
	EndIf

	;Bug #9154 - Spouse AI issues after being rescued from bandits.
	if( !BYOHHouseBanditAttack2.IsRunning() )
		if( Spouse.GetActorReference() )
			Spouse.GetActorReference().SetRestrained(false)
			Spouse.TryToRemoveFromFaction(dunPrisonerFaction)
			Spouse.TryToEvaluatePackage()
		EndIf
	EndIf

	debug.trace( "UHFP 2.0.1 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 201
	Retro202.Process()
	Stop()
EndFunction
