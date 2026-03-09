Scriptname USKP_HagravenTriggerScript extends ObjectReference  
{Terminates dunBlindCliffQST if it's been completed inside.}

Quest Property dunBlindCliffQST Auto

Event OnTriggerEnter( ObjectReference ActorRef )
	if( ActorRef == Game.GetPlayer() )
		if( dunBlindCliffQST.GetStage() >= 100 )
			dunBlindCliffQST.stop()
		EndIf
	EndIf
EndEvent
