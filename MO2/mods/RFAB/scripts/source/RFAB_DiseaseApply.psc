Scriptname RFAB_DiseaseApply extends ActiveMagicEffect

Spell Property Disease Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.DoCombatSpellApply(Disease, akTarget)
EndEvent