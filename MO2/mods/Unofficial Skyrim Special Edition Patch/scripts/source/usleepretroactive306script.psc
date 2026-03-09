Scriptname USLEEPRetroactive306Script extends Quest  

Quest Property MQ101 Auto
USLEEPRetroactive307Script Property Retro307 Auto
USLEEP_VersionTrackingScript Property USLEEPTracking Auto

ActorBase Property OlfridBattleBorn  Auto
Quest Property TGTQ03 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USLEEP 3.0.6 Retroactive Updates Complete" )
		USLEEPTracking.LastVersion = 306
		Retro307.Process()
		Stop()
		Return
	EndIf

	;Bug #21164 - Olfrid should not be essential once this is done
	if( TGTQ03.GetStageDone(200) == 1 )
		OlfridBattleBorn.SetEssential(False)
	endif

	debug.trace( "USLEEP 3.0.6 Retroactive Updates Complete" )
	USLEEPTracking.LastVersion = 306
	Retro307.Process()
	Stop()
EndFunction
