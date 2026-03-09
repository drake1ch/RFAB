Scriptname USKPRetroactive210Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive211Script Property Retro211 Auto

LocationAlias Property UtteringHillsCampAlias Auto
Location Property UtteringHillsCampLocation Auto
Quest Property TGTQ04 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.1.0 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 210
		Retro211.Process()
		Stop()
		Return
	EndIf

	;Bug #18661 - Uttering Hills Camp needs to be reserved if TGTQ04 has not run yet.
	if( TGTQ04.GetStage()  < 200 )
		UtteringHillsCampAlias.ForceLocationTo(UtteringHillsCampLocation)
	EndIf

	debug.trace( "USKP 2.1.0 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 210
	Retro211.Process()
	Stop()
EndFunction
