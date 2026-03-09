Scriptname UDGP_Retroactive203Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive204Script Property Retro204 Auto

ReferenceAlias Property Harkon Auto

Spell Property DLC1AbAurielsBow Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 2.0.3 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 203
		Retro204.Process()
		Stop()
		Return
	EndIf

	;Bug #12739 - Cycle the Auriel's Bow effect because previous uses of it could get bugged out and we never took care of this.
	if( Game.GetPlayer().HasSpell(DLC1AbAurielsBow) )
		Game.GetPlayer().RemoveSpell(DLC1AbAurielsBow)
		Utility.Wait(2)
		Game.GetPlayer().AddSpell(DLC1AbAurielsBow)
	EndIf
	
	;Bug #15033 - Harkon's leveling update does not stop after he's dead.
	if( Harkon.GetActorReference().IsDead() )
		Harkon.GetActorReference().UnregisterForUpdateGameTime()
	EndIf

	debug.trace( "UDGP 2.0.3 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 203
	Retro204.Process()
	Stop()
EndFunction
