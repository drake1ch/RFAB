Scriptname RFAB_BA_Quests extends Quest  

FormList Property ActiveQuests Auto

RFAB_BA_Quest Property ActiveQuest
	RFAB_BA_Quest Function Get()
		return _ActiveQuest
	EndFunction
EndProperty

RFAB_BA_Quest _ActiveQuest

Event OnInit()
	RegisterListener()
EndEvent

Function RegisterListener()
	RegisterForModEvent("RFAB_BA_Event_QuestStart", "OnBizarreQuestStart")
	RegisterForModEvent("RFAB_BA_Event_QuestStop", "OnBizarreQuestStop")
	RegisterForModEvent("RFAB_BA_Event_LocationEntry", "OnQuestLocationEntry")
EndFunction

Event OnBizarreQuestStart(Form akQuest)
	ActiveQuests.AddForm(akQuest)
EndEvent

Event OnBizarreQuestStop(Form akQuest)
	ActiveQuests.RemoveAddedForm(akQuest)
EndEvent

Event OnQuestLocationEntry(Form akQuest)
	_ActiveQuest = akQuest as RFAB_BA_Quest
EndEvent