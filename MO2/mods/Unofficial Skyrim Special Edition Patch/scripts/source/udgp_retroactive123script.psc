Scriptname UDGP_Retroactive123Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive124Script Property Retro124 Auto

ObjectReference Property DLC1VQ03HunterStage90DexionStand Auto
DLC1_QF_DLC1VQ03Hunter_010098CB Property DLC1VQ03Hunter Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 1.2.3 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 123
		Retro124.Process()
		Stop()
		Return
	EndIf

	;Bug #6412 - Dexion reads from a phantom Elder Scroll after "Prophet" is done because the property was never defined in the script.
	DLC1VQ03Hunter.DLC1VQ03HunterStage90DexionStand = DLC1VQ03HunterStage90DexionStand
	if( DLC1VQ03Hunter.GetStage() >= 200 )
		DLC1VQ03HunterStage90DexionStand.disable()
	EndIf
	
	debug.trace( "UDGP 1.2.3 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 123
	Retro124.Process()
	Stop()
EndFunction
