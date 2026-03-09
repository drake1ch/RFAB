Scriptname UDGP_Retroactive201Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive202Script Property Retro202 Auto

Quest Property DLC1VQ03Hunter Auto
Quest Property DLC1VQ03Vampire Auto
Actor Property DexionRef Auto
Faction Property dunPrisonerFaction Auto
Faction Property DLC1VQ03FightFaction Auto
Spell Property DLC1AbMothpriestThrallFX2 Auto
ReferenceAlias property CurrentFollower auto
ReferenceAlias property CurrentAnimalFollower auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 2.0.1 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 201
		Retro202.Process()
		Stop()
		Return
	EndIf

	;Bug #14522 - Dexion turns permanently hostile, outside the barrier, etc.
	if( DLC1VQ03Hunter.IsRunning() )
		if( DLC1VQ03Hunter.GetStage() < 65 )
			DexionRef.AddToFaction(dunPrisonerFaction)
			DexionRef.SetAV("Aggression", 0)
			DexionRef.StopCombat()
		EndIf
	EndIf
	
	if( DLC1VQ03Vampire.IsRunning() )
		if( DLC1VQ03Vampire.GetStage() < 65 )
			DexionRef.AddToFaction(dunPrisonerFaction)
			DexionRef.SetAV("Aggression", 0)
			DexionRef.StopCombat()
		EndIf
	EndIf

	if( DLC1VQ03Hunter.GetStage() >= 70	|| DLC1VQ03Vampire.GetStage() >= 70 )
		DexionRef.RemoveFromFaction(DLC1VQ03FightFaction)
		DexionRef.RemoveSpell(DLC1AbMothpriestThrallFX2)
		DexionRef.setAV("Aggression", 0)
		DexionRef.StopCombat()
		CurrentFollower.TryToStopCombat()
		CurrentAnimalFollower.TryToStopCombat()
		DexionRef.SetNoBleedoutRecovery(False)
	EndIf
	
	debug.trace( "UDGP 2.0.1 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 201
	Retro202.Process()
	Stop()
EndFunction
