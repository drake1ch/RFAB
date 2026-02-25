Scriptname RFAB_ElectricVortex_Script extends ActiveMagicEffect  

Sound Property WB_DestructionShock_Marker_CallLightning_Thunder1 Auto
Sound Property WB_DestructionShock_Marker_CallLightning_Thunder2 Auto

Spell Property WB_S_D100_FingersOfTheMountain_Spell_LightningStrike_PC Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	WB_S_D100_FingersOfTheMountain_Spell_LightningStrike_PC.Cast(akCaster, akTarget)
		If Utility.RandomInt(0,1) == 0
			WB_DestructionShock_Marker_CallLightning_Thunder1.Play(akTarget)
		Else
			WB_DestructionShock_Marker_CallLightning_Thunder2.Play(akTarget)
		endif
endevent