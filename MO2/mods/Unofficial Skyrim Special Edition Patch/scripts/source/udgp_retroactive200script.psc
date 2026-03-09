Scriptname UDGP_Retroactive200Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive201Script Property Retro201 Auto

Quest Property DLC1DialogueVampireBase Auto
Quest Property DLC1VQ08 Auto
GlobalVariable Property DLC1PlayingVampireLine Auto

PlayerVampireQuestScript Property PlayerVampireQuest Auto
Formlist Property DLC1VampireHateFactions Auto
Spell Property DLC1VampireChange Auto
MagicEffect Property DLC1VampireChangeEffect Auto
MagicEffect Property DLC1VampireChangeFXEffect Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 2.0.0 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 200
		Retro201.Process()
		Stop()
		Return
	EndIf

	;Bug #13387 - Volkihar vampire bodies in the castle never get removed from the game because their base dialogue quest is never stopped to clear the aliases.
	if( DLC1VQ08.GetstageDone(60) == 1 && DLC1PlayingVampireLine.GetValue() == 0 )
		DLC1DialogueVampireBase.Stop()
	EndIf
	
	;Bug 13706 - The USKP accidentally clobbered some necessary properties for vampire feed tracking that DG added.
	PlayerVampireQuest.DLC1CrimeFactions = DLC1VampireHateFactions
	PlayerVampireQuest.DLC1VampireChange = DLC1VampireChange
	PlayerVampireQuest.DLC1VampireChangeEffect = DLC1VampireChangeEffect
	PlayerVampireQuest.DLC1VampireChangeFXEffect = DLC1VampireChangeFXEffect
	
	debug.trace( "UDGP 2.0.0 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 200
	Retro201.Process()
	Stop()
EndFunction
