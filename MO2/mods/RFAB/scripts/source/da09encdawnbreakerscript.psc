scriptName DA09EncDawnbreakerScript extends ActiveMagicEffect

Spell property DA09DawnbreakerBaneOfUndeadSpell auto

Actor Caster

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Caster = akCaster
    DA09DawnbreakerBaneOfUndeadSpell.Cast(Caster, none)
endEvent