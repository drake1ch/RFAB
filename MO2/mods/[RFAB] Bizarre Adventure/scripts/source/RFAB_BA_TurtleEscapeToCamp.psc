Scriptname RFAB_BA_TurtleEscapeToCamp extends ObjectReference  

MusicType Property TurtleMusTest Auto
ObjectReference Property TeleportMarker Auto
ObjectReference Property EnableRef Auto
Quest Property QuestToAdvance Auto

Function OnActivate(ObjectReference akActionRef)

	Debug.MessageBox("Меня уносит подводным течением...")

	EnableRef.EnableNoWait(false)

	Game.GetPlayer().MoveTo(TeleportMarker, 0.000000, 0.000000, 0.000000, true)

	QuestToAdvance.SetStage(30)

	TurtleMusTest.Remove()

EndFunction
