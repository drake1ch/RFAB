Scriptname UDBP_Retroactive103Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive104Script Property Retro104 Auto

Quest Property DLC2CultistAmbush Auto
Quest Property DLC2MQ01 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 1.0.3 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 103
		Retro104.Process()
		Stop()
		Return
	EndIf

	;Bug #11926 - Cultist bodies are never cleaned up.
	if( DLC2MQ01.GetStageDone(200) == 1 )
		DLC2CultistAmbush.SetStage(255)
	EndIf
	
	debug.trace( "UDBP 1.0.3 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 103
	Retro104.Process()
	Stop()
EndFunction
