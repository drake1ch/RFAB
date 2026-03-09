Scriptname USSEPRetroactive420Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive421Script Property Retro421 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.2.0 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 420
		Retro421.Process()
		Stop()
		Return
	EndIf

	debug.trace( "USSEP 4.2.0 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 420
	Retro421.Process()
	Stop()
EndFunction
