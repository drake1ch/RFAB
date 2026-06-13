Scriptname RFAB_ShatteringCrystal_Timer extends ActiveMagicEffect

import PO3_Events_AME 

; -----

Activator Property ActivatorRef Auto
Spell Property ExplosionSpell Auto

Float Property Scale = 2.0 Auto
Float Property Height = 10.0 Auto

Float Property MaxRange = 1000.0 Auto

; -----

ObjectReference TheMarker
Actor Caster
Actor Player
Bool isCrystalActive = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForHitEventEx(self as ActiveMagicEffect)
	Caster = akCaster
	Player = Game.GetPlayer()
EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForAllHitEventsEx(self as ActiveMagicEffect)
	isCrystalActive = false
EndEvent

; -----

Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Actor EnemyActor = akAggressor as Actor
	
	If EnemyActor && !isCrystalActive && EnemyActor != Player && EnemyActor.IsHostileToActor(Player) && EnemyActor.GetDistance(Player) <= MaxRange
		isCrystalActive = true
		TheMarker = akAggressor.PlaceAtMe(ActivatorRef)
		TheMarker.SetScale(Scale)
		TheMarker.SetAngle(0,0,0)
		
		Utility.Wait(2.0)
		
		ExplosionSpell.RemoteCast(TheMarker, Caster)
		TheMarker.Disable(true)
		Utility.Wait(5.0)
		TheMarker.Delete()
		isCrystalActive = false
	EndIf
EndEvent