scriptName DLC1VQ03MothPriestBleedoutScript extends referenceAlias
{This script is on the mothpriest to watch for when he enters bleedout to communicate with the fight script}

DLC1VQ03MothpriestFightScript property FightController auto

Event OnEnterBleedout()
	;UDGP 2.0.1 - Prevent this from running until the appropriate stage or Dexion could become permanently hostile to the player.
	if( FightController.GetStage() >= 65 && FightController.GetStage() < 70 )
		FightController.MothpriestEnteredBleedout()
	EndIf
endEvent
