Scriptname T02DinyaStopPrayingScript extends ObjectReference  


ReferenceAlias Property Dinya auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		;USKP 2.0.9 - No sanity checking. Ugh.
		if( Dinya.GetReference() )
			Dinya.GetActorReference().EvaluatePackage()
		EndIf
	endif
EndEvent
