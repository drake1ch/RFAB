Scriptname USSEPRetroactive424Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive425Script Property Retro425 Auto

Quest Property dunBlindCliffQST Auto
ReferenceAlias Property Petra Auto

Quest Property FreeformMarkarthE Auto
ReferenceAlias Property Lisbet Auto

Function Process()

	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.2.4 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 424
		Retro425.Process()
		Stop()
		Return
	EndIf

	;Bug #29340 - Fix Blind Cliff Bastion quest if Petra is dead, we were checking the wrong stage.
	if( dunBlindCliffQST.IsRunning() )
		if( dunBlindCliffQST.GetStageDone(10) == 1 )
			if( dunBlindCliffQST.GetStage() < 100 )
				if( Petra.GetActorReference().IsDead() && dunBlindCliffQST.GetStageDone(60) == 1 )
					dunBlindCliffQST.SetStage(100)
				endif
			endif
		endif
	endif

	;Bug #29064 - If Lisbet is dead while FreeformMarkarthE is running, stop the quest and fail it.
	if( FreeformMarkarthE.IsRunning() )
		if( Lisbet.GetActorReference().IsDead() )
			if( FreeformMarkarthE.GetStageDone(10) == 1 )
				if( FreeformMarkarthE.GetStageDone(15) == 0 )
					FreeformMarkarthE.SetObjectiveFailed(10)
				else
					FreeformMarkarthE.SetObjectiveFailed(15)
				endif
			endif
			FreeformMarkarthE.Stop()
		endif
	endif

	debug.trace( "USSEP 4.2.4 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 424
	Retro425.Process()
	Stop()
EndFunction
