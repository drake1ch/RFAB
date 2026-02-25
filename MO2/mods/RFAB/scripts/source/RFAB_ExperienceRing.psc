Scriptname RFAB_ExperienceRing extends ObjectReference  

Armor Property SelfBase Auto

Sound[] Property BreakSounds Auto

Actor _owner

Event OnEquipped(Actor akActor)
	_owner = akActor
EndEvent

Event OnUnequipped(Actor akActor)
	Break(akActor)
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (_owner)
		Break(akNewContainer)
	endif
EndEvent

Function Break(ObjectReference akContainer)
	akContainer.RemoveItem(SelfBase, 1, abSilent = true)
	Debug.Notification(SelfBase.GetName() + " сломалось!")

	int i = 0
	while (i < BreakSounds.Length)
		BreakSounds[i].Play(_owner)
		i += 1
	endwhile
EndFunction