Scriptname USKP_HighGateFinishedScript extends ObjectReference  

Quest Property dunHighGateRuinsQST Auto

Event OnTriggerEnter( ObjectReference akActor )
	if( akActor == Game.GetPlayer() )
		if( dunHighGateRuinsQST.GetStage() == 100 )
			dunHighGateRuinsQST.Stop()
			disable()
			delete()
		EndIf
	EndIf
EndEvent
