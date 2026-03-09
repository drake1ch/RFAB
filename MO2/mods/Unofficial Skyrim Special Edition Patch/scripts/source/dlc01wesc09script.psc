Scriptname DLC01WESC09Script extends ReferenceAlias  
{Script attached to Taron Dreth on WESC09. EVPs him more frequently to make sure his forcegreet fires}

bool loopActive = False

Event OnLoad()
	loopActive = True
	RunLoop()
EndEvent

Event OnUnload()
	loopActive = False
EndEvent

Function RunLoop()
	While (loopActive)
		;UDGP 2.0.1 - Safeguard against this loop getting stuck when he unloads.
		if( !self.GetActorReference().Is3DLoaded() )
			loopActive = False
		EndIf
		Utility.Wait(5)
		Self.TryToEvaluatePackage() ; UDGP - Changed to sanity checked version.
	EndWhile
EndFunction