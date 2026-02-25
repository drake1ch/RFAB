Scriptname RFAB_MessageBox_OnActivate extends ObjectReference  

bool Property DoOnce = false Auto

string Property Text Auto

Event OnActivate(ObjectReference akRef)
	if akRef == Game.GetPlayer()
		Debug.MessageBox(Text)
		if (DoOnce)
			GoToState("Done")
		endif
	endif
EndEvent

State Done
	Event OnActivate(ObjectReference akRef)
	EndEvent
EndState