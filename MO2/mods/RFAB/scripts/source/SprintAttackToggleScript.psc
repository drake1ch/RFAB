Scriptname SprintAttackToggleScript extends activemagiceffect  

Event OnEffectStart (Actor akTarget, Actor akCaster)
        If akTarget.Hasspell(Effect) == false
                akTarget.Addspell(Effect, false)
        Else
                akTarget.Removespell(Effect)
        EndIf
EndEvent
Spell Property Effect  Auto  
