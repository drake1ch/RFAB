Scriptname MG03OrthornTriggerScript extends ObjectReference  

Quest Property MG03  Auto  

Scene Property OrthornScene  Auto  

int DoOnce

Auto State Waiting
	;USKP 2.0.8 Bug #18231 - The trigger zone this is used by cannot be activated.
	Event OnTriggerEnter(ObjectReference ActionRef)
		if ActionRef == Game.GetPlayer()
			OrthornScene.Start()
			GoToState("Done")
		EndIf
	EndEvent
EndState

State Done
	Event OnTriggerEnter(ObjectReference ActionRef)
		;Do Nothing
	EndEvent
EndState
