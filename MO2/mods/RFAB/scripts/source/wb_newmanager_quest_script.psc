Scriptname WB_NewManager_Quest_Script extends Quest  

; -----

ObjectReference[] Property WB_VendorChest Auto
LeveledItem[] Property WB_MGRitualBooks Auto
Bool[] Property WB_QuestDone Auto
Spell Property WB_QBooks_Spell_Ab Auto
Actor Property PlayerRef Auto
Quest Property MGRitual04 Auto
Quest Property MGRitual05 Auto
GlobalVariable Property MGRitualRestBook Auto
GlobalVariable Property MGRitualAltBook Auto

; -----

Event OnInit()

	Utility.Wait(0.5)
	Debug.Trace("APOC 7.05 DEBUG: Reset Ritual tracker!", 0)
	PlayerRef.AddSpell(WB_QBooks_Spell_Ab,false)
	WB_QuestDone[0] = false
	WB_QuestDone[1] = false
	WB_QuestDone[2] = false
	WB_QuestDone[3] = false
	WB_QuestDone[4] = false

EndEvent

; -----

Function RegisterQuestCompletion(Int aiQuest)

	If WB_Questdone[aiQuest]
		Debug.Trace("APOC 7.05 DEBUG: Function attempting to complete Ritual quest " + aiQuest + " but quest is already completed!")
	Else
		Debug.Trace("APOC 7.05 DEBUG: We detected that the player just completed Ritual quest " + aiQuest + "!",1)
		WB_VendorChest[aiQuest].AddItem(WB_MGRitualBooks[aiQuest])
		RFAB_PapyrusFunctions.UpdateVendors()
	EndIf

EndFunction

; -----

Function FixRestoration()

	Debug.Trace("APOC 7.05 DEBUG: Function fixing Ritual restoration quest!",1)
	If MGRitual04.IsCompleted()
		MGRitualRestBook.SetValue(0.0)
	Else
		MGRitualRestBook.SetValue(100.0)
	EndIf
	If MGRitual05.IsCompleted()
		MGRitualAltBook.SetValue(0.0)
	Else
		MGRitualAltBook.SetValue(100.0)
	EndIf

EndFunction

; -----