scriptName RFAB_PowerAttackCursedNodachiScript extends ActiveMagicEffect

Spell Property runeSpell Auto
Spell Property VampireVampirism Auto

Actor Caster

bool IsPlayer = false

function OnEffectStart(Actor akTarget, Actor akCaster)
	Caster = akCaster
	if Caster == Game.GetPlayer()
		IsPlayer = true
	endif

	RegisterForAnimationEvent(Caster, "WeaponSwing")
endFunction

function OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForAnimationEvent(Caster, "WeaponSwing")
endFunction

function OnAnimationEvent(objectreference akSource, String asEventName)
	if Caster.HasSpell(VampireVampirism)
		if Caster.GetAnimationVariableBool("bAllowRotation")
			runeSpell.Cast(Caster, None)
		endIf		
	endIf
	if !IsPlayer
		Caster.DamageActorValue("Health", 25)
	endif
endFunction

function OnUnload()
	UnregisterForAnimationEvent(Caster as objectreference, "WeaponSwing")
endFunction