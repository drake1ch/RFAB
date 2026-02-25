Scriptname RFAB_BA_DoorTeleport extends ObjectReference  
{Висит на телепорте хаба}

FormList Property StartedQuestList Auto

Event OnTriggerEnter(ObjectReference akRef)
	if akRef == Game.GetPlayer()
		MoveToQuestLocation()
	endif
EndEvent

Function MoveToQuestLocation()
	if StartedQuestList.GetSize() != 0
		string[] Buttons = new string[3]
		Buttons[0] = "В путь"
		Buttons[1] = "По заданию"
		Buttons[2] = "Отойти"

		int iChoiceID = SkyMessage.ShowArray("Куда отправиться?", Buttons, getIndex = true) as int
		if iChoiceID == 0
			BizarreAdventure.GetDungeonScript().GoToNewDungeon()
		elseif iChoiceID == 1
			ShowQuests()
		endif
	else
		string[] Buttons = new string[2]
		Buttons[0] = "В путь"
		Buttons[1] = "Отойти"

		int iChoiceID = SkyMessage.ShowArray("Куда отправиться?", Buttons, getIndex = true) as int
		if iChoiceID == 0
			BizarreAdventure.GetDungeonScript().GoToNewDungeon()
		endif
	endif
EndFunction

Function ShowQuests()
	int Size = StartedQuestList.GetSize()
	string[] Buttons = Utility.CreateStringArray(Size + 1, "")

	int i = 0
	while i < Size
		Quest ThisQuest = StartedQuestList.GetAt(i) as Quest
		ObjectReference LocationMarker = (ThisQuest.GetAliasByName("LocationMarker") as ReferenceAlias).GetReference()
		Buttons[i] = LocationMarker.GetCurrentLocation().GetName() + "\n" + "(" + ThisQuest.GetName() + ")"
		i += 1
	endwhile
	Buttons[i] = "Отойти"

	int iChoiceID = SkyMessage.ShowArray("Куда именно отправиться?", Buttons, getIndex = true) as int
	if iChoiceID != i
		Quest ThisQuest = StartedQuestList.GetAt(iChoiceID) as Quest
		RFAB_BA_Quest QuestScript = ThisQuest as RFAB_BA_Quest

		QuestScript.SetTravelStageIfNeed()
		QuestScript.TeleportToLocation()
		Game.RequestSave()
	endif
EndFunction