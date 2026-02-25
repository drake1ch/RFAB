Scriptname RFAB_VampireEthereal extends ActiveMagicEffect  

import PO3_Events_AME

Spell Property VampireEthereal Auto

int Property Chance Auto
float Property Cooldown Auto

Actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Caster = akCaster
	Register()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    Unregister()
EndEvent

Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	GoToState("Busy")
	if Utility.RandomInt(0, 100) < Chance
		VampireEthereal.Cast(Caster, Caster)
		Utility.Wait(Cooldown)
	endif
	GoToState("")
EndEvent

State Busy
	Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	EndEvent
EndState

Function Register()
	Keyword MagicCloak = Keyword.GetKeyword("MagicCloak")
    RegisterForHitEventEx(self, akSourceFilter = MagicCloak, abMatch = false)
EndFunction

Function Unregister()
    UnregisterForAllHitEventsEx(self)
EndFunction