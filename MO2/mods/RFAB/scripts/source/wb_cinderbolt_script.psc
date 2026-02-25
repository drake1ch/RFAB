Scriptname WB_CinderBolt_Script extends activemagiceffect  

; -----

Spell Property WB_S_D000_CinderBolt_Spell_Proc_PC Auto
String Property WB_ResistType Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.GetAV(WB_ResistType) > 0
		akCaster.DoCombatSpellApply(WB_S_D000_CinderBolt_Spell_Proc_PC,akTarget)
	EndIf

EndEvent

; -----