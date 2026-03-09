Scriptname USSEPRetroactive413Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive414Script Property Retro414 Auto

Quest Property DA09 Auto
ReferenceAlias Property Dawnbreaker Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.1.3 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 413
		Retro414.Process()
		Stop()
		Return
	EndIf

	if( DA09.IsRunning() )
		Dawnbreaker.GetReference().Disable()
	endif

	debug.trace( "USSEP 4.1.3 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 413
	Retro414.Process()
	Stop()
EndFunction
