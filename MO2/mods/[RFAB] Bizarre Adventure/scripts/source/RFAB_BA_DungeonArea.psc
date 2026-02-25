Scriptname RFAB_BA_DungeonArea extends ObjectReference  

Actor Property Player Auto

RFAB_BA_Radiant Property RadiantScript Auto

bool IsAdded = false
bool IsInTrigger = false

Event OnTriggerEnter(ObjectReference akRef)
	if (akRef as Actor) == Player
		if (!IsInTrigger)
			RadiantScript.OnAreaEnter()
		endif
		IsInTrigger = true
		if (!IsAdded)
			RadiantScript.AddArea(self)
			IsAdded = true
		endif
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akRef)
	if (akRef as Actor) == Player
		Utility.Wait(0.5) ; OnTriggerEnter иногда срабатывает позже OnTriggerLeave, поэтому нужна задержка
		if (IsInTrigger)
			RadiantScript.OnAreaLeave()
		endif
		IsInTrigger = false
	endif
EndEvent

State Blocked
	Event OnTriggerEnter(ObjectReference akRef)
	EndEvent

	Event OnTriggerLeave(ObjectReference akRef)
	EndEvent
EndState