Scriptname WB_Bleedout_Script extends ActiveMagicEffect  

; -----

EffectShader Property WB_RestorationBlood_FXS_Bleedout_Death Auto
GlobalVariable Property WB_Restoration_Bleedout_Global_Threshold Auto
Float Property WB_UpdateRate Auto
ImagespaceModifier Property WB_RestorationBlood_Imod_Bleedout Auto
Sound Property WB_RestorationBlood_Marker_Script_Bleedout Auto
GlobalVariable Property WB_Restoration_AllDeathSpells_Global_XP Auto
GlobalVariable Property WB_Restoration_Bleedout_Global_XP Auto
Actor Property PlayerRef Auto
Explosion Property BloodDecalPlaceExplosion Auto

; -----

Float TargetHealthThreshold
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster
	TargetHealthThreshold = akTarget.GetActorValuePercentage("Health") - (WB_Restoration_Bleedout_Global_Threshold.GetValue() / 100)
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If TheTarget.GetActorValuePercentage("Health") <= TargetHealthThreshold
		WB_RestorationBlood_Marker_Script_Bleedout.Play(TheTarget)
		WB_RestorationBlood_FXS_Bleedout_Death.Play(TheTarget,10.0)
		WB_RestorationBlood_Imod_Bleedout.Apply()
		TheTarget.DamageActorValue("Health", TheTarget.GetActorValue("Health") * 2)
		TheTarget.PlaceAtMe(BloodDecalPlaceExplosion)
		If TheCaster == PlayerRef
			Game.AdvanceSkill("Restoration", WB_Restoration_Bleedout_Global_XP.GetValue() * WB_Restoration_AllDeathSpells_Global_XP.GetValue())
		EndIf
	Else
		RegisterForSingleUpdate(WB_UpdateRate)
	EndIf

EndEvent

; -----