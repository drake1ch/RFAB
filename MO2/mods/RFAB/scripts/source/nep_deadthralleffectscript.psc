Scriptname NEP_DeadThrallEffectScript extends activemagiceffect
{Script to add any actor reanimated with Dead Thrall to a tracking form list.}

;-------------------------------------------------------------------------------
;
; PROPERTIES
;
;-------------------------------------------------------------------------------

FormList Property NEP_DeadThrallList Auto
{Dead thrall tracking form list.}

;-------------------------------------------------------------------------------
;
; EVENTS
;
;-------------------------------------------------------------------------------

Event OnEffectStart(Actor Target, Actor Caster)

  NEP_DeadThrallList.AddForm(Target)

EndEvent
