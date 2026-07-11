Scriptname RFAB_BA_WhitePhialRef extends ObjectReference  

Quest Property MyQuest Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()

		MyQuest.Start()
		MyQuest.SetStage(10)

	endif

EndEvent