Scriptname favorq_stageondeath extends ObjectReference  

Quest Property q  Auto  

Event OnDeath(Actor killer)
       q.SetObjectiveDisplayed(15)
        q.SetStage(15)
EndEvent