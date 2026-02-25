Scriptname WB_Destabilize_Script extends ActiveMagicEffect  

; -----

Spell Property WB_S_A050_Destabilize_Spell_PC Auto
Keyword Property WB_Alteration_Destabilize Auto
Actor Property PlayerRef Auto

; -----

Actor AggressorActor
Actor TargetActor
Actor CasterActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor != TargetActor && !akSource.HasKeyword(WB_Alteration_Destabilize)
		AggressorActor = akAggressor as Actor
		RegisterForSingleUpdate(0.15)
	EndIf

EndEvent

; -----

Event OnUpdate()

	CasterActor.DoCombatSpellApply(WB_S_A050_Destabilize_Spell_PC,TargetActor)
	If AggressorActor == PlayerRef
		Game.ShakeCamera(TargetActor, 0.25, 0.75)
	EndIf

EndEvent

; -----