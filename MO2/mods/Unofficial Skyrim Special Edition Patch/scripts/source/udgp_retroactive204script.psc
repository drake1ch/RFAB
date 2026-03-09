Scriptname UDGP_Retroactive204Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive206Script Property Retro206 Auto

Quest Property DLC1DialogueVampireCuredBlock Auto
Quest Property DLC1VQ08 Auto
GlobalVariable Property DLC1PlayingVampireLine Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 2.0.4 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 205
		Retro206.Process()
		Stop()
		Return
	EndIf

	;Bug #15169 - Volkihar vampire bodies in the castle never get removed from the game because their base dialogue quest is never stopped to clear the aliases.
	if( DLC1VQ08.GetstageDone(60) == 1 && DLC1PlayingVampireLine.GetValue() == 0 )
		DLC1DialogueVampireCuredBlock.Stop()
	EndIf
	
	debug.trace( "UDGP 2.0.4 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 205
	Retro206.Process()
	Stop()
EndFunction
