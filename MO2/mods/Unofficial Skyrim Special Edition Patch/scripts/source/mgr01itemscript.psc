Scriptname MGR01ItemScript extends ReferenceAlias  

Quest Property MGR01  Auto  


Event OnActivate(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if MGR01.GetStage() == 10
			MGR01.SetStage(20)
			MGR01.SetObjectiveCompleted(10,1) ; Added by USKP
			MGR01.SetObjectiveDisplayed(20,1) ; Added by USKP
		endif
	endif

EndEvent