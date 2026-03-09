Scriptname USKP_HighGateRuinsTriggerScript extends ObjectReference  

Quest Property HGRuinsQuest Auto
ObjectReference Property opener Auto
ObjectReference Property GateA Auto
ObjectReference Property GateB Auto

Auto State Waiting
	Event OnTriggerEnter(ObjectReference ActorRef)
		if( ActorRef == Game.GetPlayer() && HGRuinsQuest.GetStageDone(80) == 1)
			GateA.Activate(opener)
			GateB.Activate(opener)
		EndIf
		
		GoToState( "Dormant" )
	EndEvent
EndState

State Dormant
	Event OnTriggerEnter(ObjectReference ActorRef)
	EndEvent
EndState

Event OnReset()
	GotoState( "Waiting" )
EndEvent

Event OnLoad()
	GotoState( "Waiting" )
EndEvent
