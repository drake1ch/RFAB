Scriptname WB_Door_Script extends ReferenceAlias

; -----

Actor Property PlayerRef Auto
ReferenceAlias Property WB_OtherDoor Auto

; -----

Event OnActivate(ObjectReference akActivator)

	ObjectReference OtherDoor = WB_OtherDoor.GetReference()
	If OtherDoor
		PlayerRef.MoveTo(OtherDoor)
	EndIf

EndEvent

; -----
