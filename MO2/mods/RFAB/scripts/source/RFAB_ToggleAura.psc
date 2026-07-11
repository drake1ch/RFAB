Scriptname RFAB_ToggleAura extends ActiveMagicEffect  

Spell Property Ability Auto
RFAB_AuraManager Property AuraManager Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    if akTarget == None
        return
    endif

    AuraManager.RequestToggle(akTarget, Ability)

EndEvent