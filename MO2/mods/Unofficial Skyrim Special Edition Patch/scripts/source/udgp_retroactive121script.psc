Scriptname UDGP_Retroactive121Script extends Quest  

Quest Property MQ101 Auto
UDGP_Retroactive122Script Property Retro122 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto

Quest Property DLC1RV03 Auto
Keyword Property DLC1RV03KillLocation Auto
LocationAlias Property City Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 1.2.1 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 121
		Retro122.Process()
		Stop()
		Return
	EndIf

	;Bug #12124 - Deceiving the Herd is looking for a victim too soon.
	if( DLC1RV03.IsRunning() )
		if( DLC1RV03.GetStage() < 10 )
			City.GetLocation().setKeywordData(DLC1RV03KillLocation, 0)
		EndIf
	EndIf
	
	debug.trace( "UDGP 1.2.1 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 121
	Retro122.Process()
	Stop()
EndFunction
