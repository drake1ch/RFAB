Scriptname RFAB_EnableReferences extends ObjectReference  

ObjectReference[] Property References Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		return
	endif
	GoToState("Done")
	int i = 0
	while i < References.Length
		References[i].EnableNoWait()
		i += 1
	endwhile
EndEvent

State Done
	Event OnTriggerEnter(ObjectReference akActionRef)
	EndEvent	
EndState