Scriptname WB_Mindworm_Script extends activemagiceffect  

; -----

Float Property WB_UpdateRate Auto
Spell Property WB_S_I050_CompellingWhispers_Spell_Proc_PC Auto

; -----

Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	TheCaster.DoCombatSpellApply(WB_S_I050_CompellingWhispers_Spell_Proc_PC, TheTarget)

EndEvent

; -----