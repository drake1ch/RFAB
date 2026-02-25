scriptName RFAB_BountyHunt_Decapitate extends ObjectReference

Armor Property Decapitated auto

Auto State Wait
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if (!akNewContainer || !akOldContainer)
			return
		endif

		If (akOldContainer != Game.GetPlayer())
			GoToState("")
			Utility.Wait(0.2)
			(akOldContainer as Actor).EquipItem(Decapitated, true)
		endIf
	EndEvent
EndState