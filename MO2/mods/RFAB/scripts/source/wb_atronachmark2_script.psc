Scriptname WB_AtronachMark2_Script extends ActiveMagicEffect  

; -----

Float Property WB_DamageFraction Auto
String Property WB_DamageType Auto
Float Property WB_UpdateDelay Auto

ImagespaceModifier Property WB_ConjurationAtronach_Imod_AtronachMark Auto
Sound Property WB_ConjurationDaedric_Marker_AtronachMark Auto

Keyword Property ActorTypeDaedra Auto
GlobalVariable Property WB_Conjuration_AtronachMark_Global_XP Auto

Keyword Property WB_Conjuration_AtronachMarkExclusion Auto

; -----

Actor TheTarget
Actor TheCaster
Actor TheAttacker
Bool CanBeHit

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster
	CanBeHit = true

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If CanBeHit && (akAggressor as Actor).IsCommandedActor() && !akSource.HasKeyword(WB_Conjuration_AtronachMarkExclusion)
		CanBeHit = false
		TheAttacker = akAggressor as Actor
		RegisterForSingleUpdate(WB_UpdateDelay)
	EndIf

EndEvent

; -----

Event OnUpdate()

	WB_ConjurationAtronach_Imod_AtronachMark.Apply()
	WB_ConjurationDaedric_Marker_AtronachMark.Play(TheTarget)
	Float RealDamage = (TheTarget.GetActorValue("Health") * WB_DamageFraction * (100 - TheTarget.GetActorValue(WB_DamageType))) / 100
	If RealDamage > 0
		TheTarget.DamageActorValue("Health",RealDamage)
	EndIf
	If TheCaster == Game.GetPlayer()
		Game.AdvanceSkill("Conjuration",WB_Conjuration_AtronachMark_Global_XP.GetValue() * RealDamage)
	EndIf
	Dispel()

EndEvent

; -----