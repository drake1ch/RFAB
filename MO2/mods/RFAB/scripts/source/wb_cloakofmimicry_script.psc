Scriptname WB_CloakOfMimicry_Script extends ActiveMagicEffect  

; -----

Sound Property WB_IllusionBlue_Marker_Script_CloakOfMimicry Auto
MagicEffect Property WB_I075_CloakOfMimicry_EffectCurseLeft Auto
MagicEffect Property WB_I075_CloakOfMimicry_EffectCurseRight Auto

GlobalVariable Property WB_Illusion_CloakOfMimicry_Global_XP Auto

Activator Property FXEmptyActivator Auto
Actor Property PlayerRef Auto

; -----

Actor TheTarget
Actor TheCaster

Spell TempSpell

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

EndEvent

; -----

Event OnSpellCast(Form akSpell)

	TempSpell = akSpell as Spell
	If TempSpell
		If (TheTarget.GetEquippedSpell(0) == TempSpell && TheTarget.HasMagicEffect(WB_I075_CloakOfMimicry_EffectCurseLeft)) || (TheTarget.GetEquippedSpell(1) == TempSpell && TheTarget.HasMagicEffect(WB_I075_CloakOfMimicry_EffectCurseRight))
			TempSpell.Cast(TheCaster)
			If WB_IllusionBlue_Marker_Script_CloakOfMimicry
				WB_IllusionBlue_Marker_Script_CloakOfMimicry.Play(TheCaster)
			EndIf
			If TheCaster == PlayerRef
				Game.AdvanceSkill("Illusion",WB_Illusion_CloakOfMimicry_Global_XP.GetValue() as Int)
			EndIf
		EndIf
	EndIf

EndEvent

; -----