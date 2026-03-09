Scriptname MS11ClueScript extends ObjectReference  

Quest Property MS11 Auto
bool found = false ;USKP 2.1.3 Bug #19281 - This variable is useless. Stop checking against it.

;USKP 2.1.3 Bug #19281 - Need to check more specifically for the dialogue to continue the quest with. You need BOTH PIECES.
Armor Property MS11InnocuousAmulet Auto
Book Property MS11ButcherFlyer Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	ObjectReference Player = Game.GetPlayer()
	if (akNewContainer == Player)
; 		Debug.Trace("MS11: Found clue! " + self)
		;USKP 2.1.3 Bug #19281 - Rearranged this section so that the clues being picked up will always count regardless of what stage you're in.
		MS11QuestScript MS11Script = (MS11 as MS11QuestScript)
		if (Player.GetItemCount(MS11InnocuousAmulet) > 0)
			MS11Script.USKPStrangeAmuletSeen = true
		endif
		if (Player.GetItemCount(MS11ButcherFlyer) > 0)
			MS11Script.USKPButcherFlyerSeen = true
		endif
		if (MS11.GetStage() < 70)
			if (MS11Script.USKPButcherFlyerSeen) && (MS11Script.USKPStrangeAmuletSeen)
				MS11.SetStage(70)
			endif
		endif
	endif
EndEvent
