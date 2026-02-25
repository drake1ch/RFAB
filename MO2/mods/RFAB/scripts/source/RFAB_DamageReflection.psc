Scriptname RFAB_DamageReflection extends ActiveMagicEffect  

import PO3_Events_AME

Spell Property BleedingEffect Auto
Actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Caster = akCaster
	RegisterForHitEventEx(self as ActiveMagicEffect, aiBlockFilter = 1)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForAllHitEventsEx(self as ActiveMagicEffect)
EndEvent

Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if !(akSource as Weapon).IsBow()
		BleedingEffect.Cast(Caster, akAggressor)
	endif
EndEvent