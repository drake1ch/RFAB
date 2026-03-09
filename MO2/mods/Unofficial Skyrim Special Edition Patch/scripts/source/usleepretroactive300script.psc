Scriptname USLEEPRetroactive300Script extends Quest  

Quest Property MQ101 Auto
USLEEP_VersionTrackingScript Property USLEEPTracking Auto
USLEEPRetroactive301Script Property Retro301 Auto

Quest Property USLEEPDA06EssentialSlotForGularzob Auto
Quest Property USLEEPDLC2SV02Preessentials Auto
Quest Property DLC2SV02 Auto
Quest Property DA06 Auto

DA04QuestScript Property DA04 Auto
QF_DA04_0002D512 Property DA04Stages Auto
Quest Property pDLC1VQElderHandler Auto
Race Property HighElfRaceVampire Auto
Race Property WoodElfRaceVampire Auto
Race Property DarkElfRaceVampire Auto
Race Property OrcRaceVampire Auto

DLC1SeranaLevelingScript Property Harkon Auto
Spell Property LightningBoltLeftHand Auto
Spell Property ChainLightningLeftHand Auto
Spell Property IceSpikeLeftHand Auto
Spell Property IceStormLeftHand Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USLEEP 3.0.0 Retroactive Updates Complete" )
		USLEEPTracking.LastVersion = 300
		Retro301.Process()
		Stop()
		Return
	EndIf

	if( DA06.GetStage() > 0 || ( DA06.GetStage() == 0 && DA06.IsRunning() ) )
		USLEEPDA06EssentialSlotForGularzob.Stop()
	EndIf

	if( DLC2SV02.GetStage() > 0 )
		USLEEPDLC2SV02Preessentials.Stop()
	EndIf

	Harkon.LightningBoltLeftHand = LightningBoltLeftHand
	Harkon.ChainLightningLeftHand = ChainLightningLeftHand
	Harkon.IceSpikeLeftHand = IceSpikeLeftHand
	Harkon.IceStormLeftHand = IceStormLeftHand

	;Bug #18682 - Ensure properties are not lost due to dirty edit issues in DA04.
	DA04.AltmerVampire = HighElfRaceVampire
	DA04.BosmerVampire = WoodElfRaceVampire
	DA04.DunmerVampire = DarkElfRaceVampire
	DA04.OrsimerVampire = OrcRaceVampire
	DA04Stages.pDLC1VQElderHandler = pDLC1VQElderHandler

	debug.trace( "USLEEP 3.0.0 Retroactive Updates Complete" )
	USLEEPTracking.LastVersion = 300
	Retro301.Process()
	Stop()
EndFunction
