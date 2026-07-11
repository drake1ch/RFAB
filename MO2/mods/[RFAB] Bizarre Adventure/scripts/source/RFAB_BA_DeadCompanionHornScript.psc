Scriptname RFAB_BA_DeadCompanionHornScript extends ObjectReference  

Quest Property GrishnakQuest Auto
Int Property HornStage = 38 Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akNewContainer == Game.GetPlayer() && akOldContainer as Actor
        if GrishnakQuest.GetStage() < HornStage
            GrishnakQuest.SetStage(HornStage)
        endif
    endif
EndEvent