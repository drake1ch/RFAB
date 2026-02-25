Scriptname WB_RandomDispelSelf_Script extends activemagiceffect  

; -----

Float Property WB_UpdateRate Auto
Float Property WB_DispelFraction Auto
String Property WB_DamageStat Auto
Float Property WB_DamageStatFraction Auto
Sound Property WB_AlterationShieldArmor_Marker_Scripted_NinthBarrier Auto
Spell Property WB_A050_Overshield_Spell Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If Utility.RandomFloat(0,1) < WB_DispelFraction
		WB_AlterationShieldArmor_Marker_Scripted_NinthBarrier.Play(GetTargetActor())
		If WB_DamageStatFraction
			TheTarget.DamageAV(WB_DamageStat,(TheTarget.GetAV(WB_DamageStat) * WB_DamageStatFraction))
		EndIf
		TheTarget.DispelSpell(WB_A050_Overshield_Spell)
		Dispel()
	EndIf

EndEvent

; -----
