Scriptname USSEPRetroactive406Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive407Script Property Retro407 Auto

ReferenceAlias Property Vald  Auto

CWScript Property CW Auto
LeveledItem Property CWRankRewardSons Auto

Quest Property DA04 Auto
ReferenceAlias Property Extractor Auto

FreeformFalkreathQuest03Script Property FFQ3 Auto
FreeformFalkreathQuest03Script Property FFQ3B Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.0.6 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 406
		Retro407.Process()
		Stop()
		Return
	EndIf

	;Bug #21893 - Vald's body never cleans up.
	if( Vald.GetActorReference().IsDead() )
		(Vald.GetActorReference() as WIDeadBodyCleanupScript).CleanupBody()
	endif

	;Bug #21338 - Incorrect Stormcloak reward
	CW.CWRank1RewardSons = CWRankRewardSons

	;Bug #21755 - Essence Extractor is never enabled. Can only guarantee a valid reference while DA04 is still running.
	if( DA04.IsRunning() )
		if( DA04.GetStage() >= 40 )
			Extractor.GetReference().Enable()
		endif
	endif

	;Bug #21864 - Incorrect map marker
	FFQ3B.LairMapMarker = FFQ3.LairMapMarker

	debug.trace( "USSEP 4.0.6 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 406
	Retro407.Process()
	Stop()
EndFunction
