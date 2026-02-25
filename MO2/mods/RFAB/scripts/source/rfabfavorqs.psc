Scriptname rfabfavorqs extends ObjectReference  

Quest Property q  Auto  

Event OnContainerChanged(ObjectReference newContainer, ObjectReference oldContainer)
	if (newContainer == Game.GetPlayer())
                q.SetObjectivedisplayed(15)
		q.SetStage(15)
	endif
EndEvent