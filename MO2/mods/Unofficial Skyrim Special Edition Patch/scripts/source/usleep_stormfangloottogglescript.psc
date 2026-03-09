Scriptname USLEEP_StormfangLootToggleScript extends ObjectReference  
{Script for Bug #20185 - Kill the leader of Brodir Grove. Makes sure unique Stormfang weapon does not respawn with the Reaver Lord if the player loots it.}

GlobalVariable Property USLEEPStormfangSpawns Auto
GlobalVariable Property USLEEPStormfangLooted Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if( akNewContainer == Game.GetPlayer() )
		;This may seem backward, but the 100 becomes the "Chance None" value for the leveled list, as does the 0 for the second list.
		USLEEPStormfangSpawns.SetValue(100)
		USLEEPStormfangLooted.SetValue(0)
	endif
EndEvent
