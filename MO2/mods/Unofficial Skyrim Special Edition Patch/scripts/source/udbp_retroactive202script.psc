Scriptname UDBP_Retroactive202Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive203Script Property Retro203 Auto

Quest Property DLC2WE09 Auto
Quest Property DLC2MQ06 Auto
DLC2_QF_DLC2MQ07_020179D7 Property DLC2MQ06Fragments Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 2.0.2 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 202
		Retro203.Process()
		Stop()
		Return
	EndIf
	
	;After Miraak's death, random cultist encounters might still be out there. Shut them down now.
	DLC2MQ06Fragments.DLC2WE09 = DLC2WE09
	if( DLC2MQ06.GetStageDone(550) == 1 )
		if( DLC2WE09.IsRunning() )
			DLC2WE09.Stop()
		EndIf
	EndIf
	
	debug.trace( "UDBP 2.0.2 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 202
	Retro203.Process()
	Stop()
EndFunction
