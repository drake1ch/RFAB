Scriptname RFAB_BA_QuestDungeonExit extends ObjectReference  

Quest Property DungeonQuest Auto
Int Property StageToExit = 50 Auto

Event OnLoad()
    SetDisplayName("Выход")
EndEvent

Event OnTriggerEnter(ObjectReference akRef)
	if akRef == Game.GetPlayer()
		Exit()
	endif
EndEvent

Event OnActivate(ObjectReference akRef)
	if akRef == Game.GetPlayer()
		Exit()
	endif
EndEvent

Function Exit()
	if (DungeonQuest as RFAB_BA_Quest).IsAllowedToEspace()
		BizarreAdventure.GetRadiantScript().ShowExit()
	else		
		Debug.Notification("Сначала мне нужно разобраться с врагами")
	endif
EndFunction