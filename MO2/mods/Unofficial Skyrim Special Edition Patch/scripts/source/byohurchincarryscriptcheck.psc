Scriptname BYOHUrchinCarryScriptCheck extends ObjectReference

Package property CarryPackage Auto
Package property CarryPackage2 Auto
Faction property BYOHRelationshipAdoptableFaction Auto

bool loopActive = False
Package currentPackage

Event OnCellAttach()
	loopActive = True
	StartLoop()
EndEvent

Event OnCellDetach()
	loopActive = False
EndEvent

Function StartLoop()
	While (loopActive && ((Self as ObjectReference) as Actor).GetFactionRank(BYOHRelationshipAdoptableFaction) < 10)
		;Debug.Trace("Check")
		;UHFP 2.0.1 - 3D check added to break a potentially infinite loop.
		if( !Is3DLoaded() )
			loopActive = False
		EndIf
		currentPackage = ((Self as ObjectReference) as Actor).GetCurrentPackage()
		if (currentPackage == CarryPackage || currentPackage == CarryPackage2)
			;Debug.Trace("Carry")
			((Self as ObjectReference) as CarryActorManualScript).ChangeCarryState(True)
		Else
			;Debug.Trace("Stop Carry")
			((Self as ObjectReference) as CarryActorManualScript).ChangeCarryState(False)
		EndIf
		Utility.Wait(10)
	EndWhile
EndFunction
