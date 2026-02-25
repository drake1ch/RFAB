Scriptname RFAB_OnContainerChanged_SetQuestStage extends ObjectReference  

Quest Property MyQuest Auto
int Property MyStage Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if (akNewContainer == Game.GetPlayer())
    	MyQuest.SetStage(MyStage)
    	GoToState("Complete")
    endif
EndEvent

State Complete
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	EndEvent
EndState