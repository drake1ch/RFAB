Scriptname WB_InvisFix_Script extends activemagiceffect  

; -----

Spell Property WB_S_I000_InvisFix_Spell_Ab_PC Auto

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.AddSpell(WB_S_I000_InvisFix_Spell_Ab_PC, false)

EndEvent

; -----