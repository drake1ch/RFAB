Scriptname WB_Biorhythm_New_Script extends activemagiceffect  

; -----

GlobalVariable Property GameHour Auto
Spell Property WB_S_R050_Biorhythm_Spell_Magicka_PC Auto
Spell Property WB_S_R050_Biorhythm_Spell_Stamina_PC Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TheTime = GameHour.GetValue()
	If TheTime >= 5.0 && TheTime < 19.0
		akCaster.DoCombatSpellApply(WB_S_R050_Biorhythm_Spell_Stamina_PC,akTarget)
	Else
		akCaster.DoCombatSpellApply(WB_S_R050_Biorhythm_Spell_Magicka_PC,akTarget)
	EndIf

EndEvent

; -----