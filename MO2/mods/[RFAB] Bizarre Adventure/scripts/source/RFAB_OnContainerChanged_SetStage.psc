Scriptname RFAB_OnContainerChanged_SetStage extends ReferenceAlias

Int Property Stage Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		GetOwningQuest().SetStage(Stage)
	endif
endEvent
