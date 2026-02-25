Scriptname DLC1VQ07BasinPourActScript extends ObjectReference  Conditional

Quest Property pDLC1VQ07 Auto

Event OnActivate(ObjectReference akActionRef)

	if pDLC1VQ07.GetStage() == 100
		if akActionRef == Game.GetPlayer()
				Game.EnableFastTravel(false)
				GetLinkedRef().Activate(akActionRef)
				pDLC1VQ07.SetStage(105)
		endif
	endif

endEvent