Scriptname USSEPRetroactive408Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive413Script Property Retro413 Auto

CWScript Property CW Auto
ObjectReference Property CWSiegeAttackCampEnableMarkerSonsWhiterun Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.0.8 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 408
		Retro413.Process()
		Stop()
		Return
	EndIf

	;Bug #14135 - Stormcloak camp outside Whiterun
	if( CW.WhiterunSiegeFinished == true )
		CWSiegeAttackCampEnableMarkerSonsWhiterun.Disable()
	endif

	debug.trace( "USSEP 4.0.8 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 408
	Retro413.Process()
	Stop()
EndFunction
