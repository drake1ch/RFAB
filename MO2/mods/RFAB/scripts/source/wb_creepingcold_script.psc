Scriptname WB_CreepingCold_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateDelay Auto
Spell Property WB_S_D025_CreepingCold_Spell Auto
Activator Property FXEmptyActivator Auto

; -----

Actor TheCaster
Actor TheTarget
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCaster = akCaster
	TheTarget = akTarget
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	RegisterForSingleUpdate(WB_UpdateDelay)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()

EndEvent

; -----


Event OnUpdate()

	WB_S_D025_CreepingCold_Spell.RemoteCast(TheBox,TheCaster,TheTarget)

EndEvent

; -----