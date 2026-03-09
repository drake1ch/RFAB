ScriptName MarriageFINPlayerScript extends ReferenceAlias

ReferenceAlias Property HouseCenter Auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	;USKP 2.0.1 - Sanity check. HouseCenter may be a None.
	if( HouseCenter.GetReference() != None )
		If(HouseCenter.GetReference().GetCurrentLocation() == akNewLoc)
			If (GetOwningQuest().IsObjectiveDisplayed(10) == 1)
	; 			Debug.Trace(self + ("Player has entered spouse's house. Clear objective."))
				GetOwningQuest().SetStage(25)
			EndIf
		EndIf
	EndIf
EndEvent
