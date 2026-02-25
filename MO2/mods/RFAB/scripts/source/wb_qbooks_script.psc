Scriptname WB_QBooks_Script extends activemagiceffect  

; -----

WB_NewManager_Quest_Script Property WB_NewManager_Quest auto
Int Property WB_QuestID Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Debug.Trace("APOC 7.05 DEBUG: We detected that the player just completed Ritual quest " + WB_QuestID + "!",1)
	 WB_NewManager_Quest.RegisterQuestCompletion(WB_QuestID)

EndEvent

; -----