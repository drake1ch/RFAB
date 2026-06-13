scriptName RFAB_CollectIceCoverStacksOnHit extends ActiveMagicEffect

import PO3_Events_AME

; -----

GlobalVariable Property IceCoverStacks Auto
Spell Property SpellOnSelf Auto

Bool isProcessingHit = false
Actor Player
Int MaxStacks = 10
Int ResetStacksDelay = 6
Int ResetAtMaxStacksDelay = 1

; -----

Event OnInit()
	Player = Game.GetPlayer()
EndEvent

; -----

Event OnEffectStart(Actor Target, Actor Caster)
	IceCoverStacks.SetValue(0)
	RegisterForHitEventEx(self as ActiveMagicEffect)	
endEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	IceCoverStacks.SetValue(0)
	isProcessingHit = false
	Player.DispelSpell(SpellOnSelf)
	
	UnregisterForAllHitEventsEx(self as ActiveMagicEffect)
EndEvent

Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Actor EnemyActor = akAggressor as Actor
	
	If EnemyActor && !isProcessingHit && !abHitBlocked && EnemyActor != Player && EnemyActor.IsHostileToActor(Player) && IceCoverStacks.GetValue() < MaxStacks
		isProcessingHit = true
		UnregisterForUpdate()
		IceCoverStacks.SetValue(IceCoverStacks.GetValue() + 1)
		
		
		If(IceCoverStacks.GetValue() == 1)
			SpellOnSelf.Cast(Player as ObjectReference, none)
		EndIf
		
		If(IceCoverStacks.GetValue() == MaxStacks)
			RegisterForSingleUpdate(ResetAtMaxStacksDelay)
		Else
			RegisterForSingleUpdate(ResetStacksDelay)
		EndIf
		
		
		Utility.Wait(1.0)
		isProcessingHit = false
	EndIf
EndEvent

Event OnUpdate()
	IceCoverStacks.SetValue(0)
	Player.DispelSpell(SpellOnSelf)
endEvent