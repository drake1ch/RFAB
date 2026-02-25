Scriptname HH_block_fix extends activemagiceffect  

import PO3_Events_AME

Actor Caster
Int Property stamina Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Caster = akCaster
	RegisterForHitEventEx(self as activemagiceffect, aiBlockFilter = 1)
EndEvent

Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Caster.RestoreActorValue("Stamina", stamina)
EndEvent