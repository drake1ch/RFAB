Scriptname UDGP_Retroactive120Script extends Quest  

Quest Property MQ101 Auto
UDGP_Retroactive121Script Property Retro121 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto

Quest Property DLC1HunterBaseStage2 Auto
ObjectReference Property UDGPFortDawnguardDiningMarker Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 1.2.0 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 120
		Retro121.Process()
		Stop()
		Return
	EndIf

	;Bug #11961 - Fort Dawnguard dining area is never fully enabled.
	if( DLC1HunterBaseStage2.GetStageDone(200) == 1 )
		UDGPFortDawnguardDiningMarker.Disable() ; Yes, this is correct because the controlling marker starts enabled.
	EndIf
	
	debug.trace( "UDGP 1.2.0 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 120
	Retro121.Process()
	Stop()
EndFunction
