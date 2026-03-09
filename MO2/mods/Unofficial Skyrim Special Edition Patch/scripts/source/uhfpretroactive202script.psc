Scriptname UHFPRetroactive202Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive203Script Property Retro203 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 2.0.2 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 202
		Retro203.Process()
		Stop()
		Return
	EndIf

	debug.trace( "UHFP 2.0.2 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 202
	Retro203.Process()
	Stop()
EndFunction
