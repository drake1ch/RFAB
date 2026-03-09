ScriptName UHFPRackRepositioningScript Extends ObjectReference Hidden
;by Sclerocephalus - release version 1.0 (10/11/2013)


;This script is used to reposition a weapon rack (i.e the trigger and its linked activator). Depending on the level of persistence of an object reference (e.g. if 
;this object reference is set as a property on a script), the game refuses to accept any modifications to its translation and rotation values and ignores any overrides
;from an esp file (although the modifications are shown when the respective esp is loaded in the CK). This restriction applies to most of the weapon racks in
;Hearthfires homes, and only a script is capable of actually placing them in a different position. To make this work, attach this script to the trigger reference
;(not to the base object) and set the new rotation values and translation offsets.


Float Property RotX = 0.0 Auto
Float Property RotY = 0.0 Auto
Float Property RotZ = 0.0 Auto

Float Property OffsetX = 0.0 Auto
Float Property OffsetY = 0.0 Auto
Float Property OffsetZ = 0.0 Auto

Keyword Property WRackActivator Auto

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Auto State Waiting

	Event OnLoad()
		GoToState ("Inactive")
		ChangePosition()
	EndEvent

EndState

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

State Inactive

	Event OnLoad()
	EndEvent

EndState 

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function ChangePosition()

	Float TransX = GetPositionX() + OffsetX
	Float TransY = GetPositionY() + OffsetY
	Float TransZ = GetPositionZ() + OffsetZ

	ObjectReference ActivatorRef = GetLinkedRef (WRackActivator)

	SetAngle (RotX, RotY, RotZ)
	SetPosition (TransX, TransY, TransZ)

;	The following works because the activator is in the same position as the trigger when the rack is properly assembled (if not, this script will automatically
;	move it in the right position):

	If ActivatorRef
		ActivatorRef.SetAngle (RotX, RotY, RotZ)
		ActivatorRef.SetPosition (TransX, TransY, TransZ)
	EndIf

EndFunction 