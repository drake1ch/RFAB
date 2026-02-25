Scriptname RFAB_CastSpellOnAgressor extends ActiveMagicEffect  
Spell Property TheSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	TheSpell.cast(akCaster)
EndEvent