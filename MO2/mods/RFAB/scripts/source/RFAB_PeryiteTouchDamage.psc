Scriptname RFAB_PeryiteTouchDamage extends ActiveMagicEffect  

Spell Property DamageSpell Auto
Float Property MissingHPPercent Auto
Float Property DivisionPercent Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	float Damage = GetDamage(akTarget)

	DamageSpell.SetNthEffectMagnitude(0, Damage)
	DamageSpell.Cast(akCaster, akTarget)
EndEvent

float Function GetDamage(Actor akActor)
	float ActorMaxHP = akActor.GetActorValueMax("Health")
	float CurrentHP = akActor.GetActorValue("Health")

	float Damage = ((ActorMaxHP - CurrentHP) * MissingHPPercent)/DivisionPercent
	return Damage
EndFunction