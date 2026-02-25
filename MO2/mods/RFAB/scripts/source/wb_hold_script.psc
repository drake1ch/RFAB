Scriptname WB_Hold_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto

Float Property WB_Push Auto
Float Property WB_UpdateRate Auto
Float Property WB_DangleZ Auto
Float Property WB_DistanceInFront Auto

; -----

ObjectReference TheAttractor
Actor TheTarget
Actor TheCaster

Float EndLocX
Float EndLocY

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheAttractor = akTarget.PlaceAtMe(FXEmptyActivator)

	TheCaster = akCaster
	TheTarget = akTarget

	OnUpdate()
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheAttractor.Delete()

EndEvent

; -----

Event OnUpdate()

;	EndLocZ = (WB_DistanceInFront*Math.Tan(-TheCaster.GetAngleX()))

	TheAttractor.MoveTo(TheCaster,(WB_DistanceInFront*Math.Sin(TheCaster.GetAngleZ())),(WB_DistanceInFront*Math.Cos(TheCaster.GetAngleZ())),WB_DangleZ)
	TheAttractor.PushActorAway(TheTarget,WB_Push)

EndEvent

; -----