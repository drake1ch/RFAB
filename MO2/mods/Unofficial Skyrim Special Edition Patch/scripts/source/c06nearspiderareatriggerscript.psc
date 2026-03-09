Scriptname C06NearSpiderAreaTriggerScript extends ObjectReference  

Quest Property C06 auto
ReferenceAlias Property Farkas auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		;USKP 2.0.7 - This check should only get done if C06 is actually running.
		if( C06.IsRunning() )
			(C06 as C06QuestScript).FarkasFGBeforeSpiders = true
			Farkas.GetActorReference().EvaluatePackage()
		EndIf
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	; if (akActivator == Game.GetPlayer())
	; 	(C06 as C06QuestScript).FarkasFGBeforeSpiders = false
	; 	Farkas.GetActorReference().EvaluatePackage()
	; endif
EndEvent

