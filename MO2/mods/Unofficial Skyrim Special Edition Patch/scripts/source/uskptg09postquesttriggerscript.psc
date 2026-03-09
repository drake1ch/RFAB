Scriptname USKPTG09PostQuestTriggerScript extends ObjectReference  

Quest Property TG09 Auto
ObjectReference Property Pool Auto

Event OnTriggerEnter(ObjectReference ActorRef)
	if( ActorRef == Game.GetPlayer() )
		if( TG09.GetStage() >= 45 )
			Pool.PlayAnimation("open")
		EndIf
	EndIf
EndEvent
