Scriptname RFAB_ToggleAura extends ActiveMagicEffect  

Spell Property Ability Auto

RFAB_AuraManager Property AuraManager Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    AuraManager.ToggleAura(akTarget, Ability)

EndEvent