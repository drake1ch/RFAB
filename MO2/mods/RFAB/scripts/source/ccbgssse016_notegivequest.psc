scriptName ccbgssse016_notegivequest extends ObjectReference

quest Property UmbraQuest Auto
bool done = false
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		If (!done)
			done = true
			UmbraQuest.setstage(15)
		EndIf
	EndIf
EndEvent