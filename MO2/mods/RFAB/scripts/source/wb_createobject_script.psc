Scriptname WB_CreateObject_Script extends activemagiceffect  

; -----

FormList Property WB_FormList_ObjectToCreate Auto
Float Property WB_DistanceInFront Auto
Float Property WB_OffsetZ Auto
Explosion Property WB_Explosion Auto

; -----

ObjectReference TheObject

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheObject = akTarget.PlaceAtMe(WB_FormList_ObjectToCreate.GetAt(0))
	TheObject.MoveTo(akTarget,(WB_DistanceInFront*Math.Sin(akTarget.GetAngleZ())),(WB_DistanceInFront*Math.Cos(akTarget.GetAngleZ())),WB_OffsetZ)
	TheObject.SetAngle(0,0,akTarget.GetAngleZ()+90)
	AddInventoryEventFilter(WB_FormList_ObjectToCreate)
	If WB_Explosion
		TheObject.PlaceAtMe(WB_Explosion)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	RemoveInventoryEventFilter(WB_FormList_ObjectToCreate)

	TheObject.Disable(true)
	Utility.Wait(2.5)
	TheObject.Delete()

EndEvent

; -----

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	GetTargetActor().RemoveItem(akBaseItem,aiItemCount,true)
	Dispel()

EndEvent

; -----