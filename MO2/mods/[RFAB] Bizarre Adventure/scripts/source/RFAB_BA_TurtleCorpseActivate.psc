Scriptname RFAB_BA_TurtleCorpseActivate extends ObjectReference  

Quest Property MyQuest Auto

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if akDestContainer == Game.GetPlayer()

             Debug.MessageBox("Ёто ведь та сама€ черепаха! “олько... совсем маленька€...")

		MyQuest.SetStage(40)

		GoToState("Done")

	endif

EndEvent

State Done

	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	EndEvent
EndState