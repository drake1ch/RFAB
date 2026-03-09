Scriptname CR13QuestScript extends CompanionsRadiantQuest  Conditional


ReferenceAlias Property Farkas auto  ; on C00
ReferenceAlias Property Vilkas auto  ; on C00
Keyword Property CRFarkas auto
Keyword Property CRVilkas auto

MiscObject Property Head auto
ReferenceAlias Property Witch auto
ReferenceAlias Property WitchHead Auto

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
; 	Debug.Trace("CRQ CR13: Starting CR13 from story script.")
	if     (akKeyword == CRFarkas)
		Questgiver.ForceRefTo(Farkas.GetReference())
	elseif (akKeyword == CRVilkas)
		Questgiver.ForceRefTo(Vilkas.GetReference())
	endif
	
	if (!IsRegistered)
		(ParentQuest as CompanionsHousekeepingScript).RegisterRadiantQuest(self)
	endif
EndEvent

Function Setup()
	Actor Player = Game.GetPlayer() ;Added by USKP

	if (Player.GetItemCount(Head) < 1)
		if (Witch.GetReference() == None)
; 			Debug.Trace("CR13: Shutting down because player is missing Glenmoril Head and there is no source available.")
			WitchHead.GetReference().Delete()
			Stop()
		endif
	Else ; Block alteration by USKP. This should trigger the OnContainerChanged() code from the base object script and set the alias on CR13 accordingly. Bugzilla #265.
		Player.RemoveItem(Head, 1, absilent = true)
		Player.AddItem(WitchHead.GetReference(), 1, absilent = true)

		;USKP 2.0 - Moved here because calling the parent if the quest stops triggers endless attempts to restart it since the parent script has no way to check it.
		parent.Setup()
	endif
EndFunction

Function Cleanup()
	if     (Questgiver.GetReference() == Farkas.GetReference())
		(ParentQuest as CompanionsHousekeepingScript).FarkasHasBeastBlood = false
	elseif (Questgiver.GetReference() == Vilkas.GetReference())
		(ParentQuest as CompanionsHousekeepingScript).VilkasHasBeastBlood = false
	endif
	parent.Cleanup()
EndFunction
