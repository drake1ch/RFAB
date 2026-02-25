Scriptname BizarreAdventure

RFAB_BA_Dungeons Function GetDungeonScript() global
	return Quest.GetQuest("RFAB_BA_TQ_Dungeons") as RFAB_BA_Dungeons
EndFunction

RFAB_BA_Quests Function GetQuestScript() global
	return Quest.GetQuest("RFAB_BA_TQ_Dungeons") as RFAB_BA_Quests
EndFunction

RFAB_BA_XP Function GetXPScript() global
	return Quest.GetQuest("RFAB_BA_TQ_Dungeons") as RFAB_BA_XP
EndFunction

RFAB_BA_Radiant Function GetRadiantScript() global
	return Quest.GetQuest("RFAB_BA_TQ_Dungeons") as RFAB_BA_Radiant
EndFunction