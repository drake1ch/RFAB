Scriptname MG02TolfdirEVPTriggerScript extends ObjectReference  

ReferenceAlias Property MG02Tolfdir  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		MG02Tolfdir.GetActorReference().EvaluatePackage()
		self.disable() ; USKP 2.0.1 - Disable after passing through. They're only good once anyway.
	endif

EndEvent