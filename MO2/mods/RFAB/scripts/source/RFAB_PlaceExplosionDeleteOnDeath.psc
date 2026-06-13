scriptName RFAB_PlaceExplosionDeleteOnDeath extends ActiveMagicEffect

; -----

Explosion property ExplosionRef auto

Bool isActive = true
Actor Enemy
ObjectReference ExplosionHolder

; -----

Event OnEffectStart(Actor Target, Actor Caster)
	Enemy = Target
	
	ExplosionHolder = Target.placeatme(ExplosionRef)
	
	RegisterForSingleUpdate(0.1)
endEvent

Event OnUpdate()
	If isActive
		if Enemy.IsDead()
			ExplosionHolder.Disable()
			Utility.Wait(0.1)
			ExplosionHolder.Delete()
			isActive = false
		Else
			RegisterForSingleUpdate(0.1)
		EndIf
	EndIf
endEvent
