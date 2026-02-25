Scriptname RFAB_BA_DungeonEscape extends ActiveMagicEffect  

Location Property HubLocation Auto

RFAB_BA_Quests Property ScriptQuests Auto
RFAB_BA_Radiant Property ScriptRadiant Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (akTarget.GetCurrentLocation() == HubLocation)
		return
	endif

	if (akTarget.IsInCombat())
		Debug.Notification("Сначала мне надо разобраться с врагами")
		return
	endif

	if (ScriptQuests.ActiveQuest.IsInQuestLocation())
		if (ScriptQuests.ActiveQuest.IsAllowedToEspace())
			ScriptRadiant.ShowExit()
		else
			Debug.Notification("Мне надо выполнить задание")
		endif
		return
	endif

	if (ScriptRadiant.IsRadiantCompleted())
		ScriptRadiant.ShowExit()
	else
		Debug.Notification("Мне надо изучить локацию")
	endif
EndEvent