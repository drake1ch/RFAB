Scriptname UDGP_Retroactive206Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive211Script Property Retro211 Auto

Quest Property DLC1RH05 Auto
Quest Property DLC1RH08 Auto
GlobalVariable Property DLC1RH05FinishedAllQuests Auto
GlobalVariable Property DLC1RH08RunCount Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 2.0.6 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 209
		Retro211.Process()
		Stop()
		Return
	EndIf

	;Bug #15167 - Sorine needs to stop giving out quests when Ancient Technology turns in the last schematic.
	if( DLC1RH05.IsRunning() )
		if( DLC1RH05FinishedAllQuests.GetValueInt() == 1 )
			DLC1RH05.SetStage(255)
		EndIf
	EndIf
	
	;Lost Relic needs to stop coming up once the 3rd relic is returned for Florentius.
	if( DLC1RH08.IsRunning() )
		if( DLC1RH08RunCount.GetValueInt() > 3 )
			DLC1RH08.SetStage(255)
		EndIf
	EndIf

	debug.trace( "UDGP 2.0.6 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 209
	Retro211.Process()
	Stop()
EndFunction
