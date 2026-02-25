Scriptname NEP_AshPileApplyScript extends ActiveMagicEffect
{Script to apply the reanimate ash pile spell.}

;-------------------------------------------------------------------------------
;
; PROPERTIES
;
;-------------------------------------------------------------------------------

Spell Property NEP_ReanimatePersistAshPileSpell Auto
{The reanimate ash pile spell, which applies the responsible effect script.}

;-------------------------------------------------------------------------------
;
; FUNCTIONS
;
;-------------------------------------------------------------------------------

Event OnEffectStart(Actor Target, Actor Caster)

  Target.AddSpell(NEP_ReanimatePersistAshPileSpell)

EndEvent
