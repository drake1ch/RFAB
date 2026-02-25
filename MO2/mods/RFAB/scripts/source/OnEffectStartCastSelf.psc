scriptName OnEffectStartCastSelf extends ActiveMagicEffect

Spell Property SpellToCast Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    SpellToCast.Cast(akCaster)
EndEvent