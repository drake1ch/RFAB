Scriptname DLC1VQ07BasinDrawWaterScript extends ObjectReference

Event OnActivate(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		GetLinkedRef().Activate(akActionRef)
	endif

endEvent
