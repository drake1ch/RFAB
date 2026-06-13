scriptName RFAB_FrostbiteOnEnemyAttack extends ActiveMagicEffect

import PO3_Events_AME

; -----

Spell Property SpellOnTarget Auto
Float Property Range Auto
Keyword Property FrostbiteEffectKeyword Auto

Bool isProcessingHit = false
Actor Player

; -----

Event OnInit()
	Player = Game.GetPlayer()
EndEvent

; -----

Event OnEffectStart(Actor Target, Actor Caster)
	RegisterForHitEventEx(self as ActiveMagicEffect)	
endEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForAllHitEventsEx(self as ActiveMagicEffect)
EndEvent

Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Actor EnemyActor = akAggressor as Actor
	
	If EnemyActor && !isProcessingHit && EnemyActor != Player && EnemyActor.IsHostileToActor(Player) && akProjectile == none && EnemyActor.GetDistance(Player) <= Range && !EnemyActor.HasMagicEffectWithKeyword(FrostbiteEffectKeyword)
		isProcessingHit = true
		
		SpellOnTarget.Cast(EnemyActor as ObjectReference, none)
		
		isProcessingHit = false
	EndIf
EndEvent