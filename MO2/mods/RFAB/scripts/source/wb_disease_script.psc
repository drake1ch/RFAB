Scriptname WB_Disease_Script extends ActiveMagicEffect  

; -----

Spell Property WB_Disease_Spell Auto
Float Property WB_UpdateRate Auto
Activator Property FXEmptyActivator Auto

; -----

Actor TheTarget
Actor TheCaster
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(2.0)
	TheBox.Delete()

EndEvent

; -----

Event OnUpdate()

	TheBox.MoveTo(TheTarget)
	WB_Disease_Spell.RemoteCast(TheBox,TheCaster,TheTarget)
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----