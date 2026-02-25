Scriptname RFAB_BA_AddSpell_OnEffectStart extends ActiveMagicEffect  

Spell Property SpellProperty Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
        akCaster.AddSpell(SpellProperty, false)
EndEvent