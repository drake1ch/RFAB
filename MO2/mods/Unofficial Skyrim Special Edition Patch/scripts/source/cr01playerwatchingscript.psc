Scriptname CR01PlayerWatchingScript extends ReferenceAlias  

ReferenceAlias Property Victim auto
LocationAlias Property VictimHometown auto
ReferenceAlias Property HouseDoor auto


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if (GetOwningQuest().GetStage() == 10)
		if (akNewLoc == VictimHometown.GetLocation())
			; just in case they're still inside
			;USKP 2.0.1 - Make sure they're indoors before running this.
			if( victim.GetActorReference().IsInInterior() )
				Victim.GetActorReference().UnlockOwnedDoorsInCell()
			EndIf

			; make EXTRA SURE
			HouseDoor.GetReference().Lock(false)
		endif
	endif
EndEvent
