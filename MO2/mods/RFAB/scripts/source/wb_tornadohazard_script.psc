Scriptname WB_TornadoHazard_Script extends ActiveMagicEffect  

; -----

Float Property WB_PushForce Auto
Activator Property FXEmptyActivator Auto
Float Property WB_UpdateRate Auto
Float Property WB_Height Auto

; -----

Actor TheTarget
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	TheBox.MoveTo(akTarget,0,0,WB_Height)

	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	TheBox.PushActorAway(TheTarget, WB_PushForce)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()

EndEvent

; -----