Scriptname FFRiften20SourceNoteScript extends ReferenceAlias  Conditional

Quest Property pFFR20  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		if pFFR20.GetStage() == 50
		pFFR20.SetStage(200)
		endif
	endif
endEvent