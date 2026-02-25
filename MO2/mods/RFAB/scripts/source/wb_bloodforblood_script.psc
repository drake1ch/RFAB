Scriptname WB_BloodForBlood_Script extends ActiveMagicEffect  

; -----

Float Property WB_Threshold Auto
GlobalVariable Property WB_Illusion_BloodForBlood_Global_XP Auto
GlobalVariable Property WB_Restoration_AllDeathSpells_Global_XP Auto
ImagespaceModifier Property WB_IllusionEmpathy_Imod_BloodForBlood Auto
Sound Property WB_IllusionEmpathy_Marker_Script_BloodForBlood Auto
Message Property WB_IllusionEmpathy_Message_BloodForBloodFail Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Actor TheKiller = akTarget.GetKiller()
	If TheKiller
		If TheKiller.GetActorValue("Health") <= WB_Threshold
			WB_IllusionEmpathy_Marker_Script_BloodForBlood.Play(TheKiller)
			WB_IllusionEmpathy_Imod_BloodForBlood.Apply()
			TheKiller.DamageActorValue("Health",(TheKiller.GetActorValue("Health") - 1))
			Game.ShakeCamera(akTarget, 1, 1)
			If !TheKiller.IsInCombat()
				TheKiller.StartCombat(akCaster)
			EndIf
			If akCaster == PlayerRef
				Game.AdvanceSkill("Illusion",TheKiller.GetActorValue("Health") * WB_Illusion_BloodForBlood_Global_XP.GetValue() * WB_Restoration_AllDeathSpells_Global_XP.GetValue())
			EndIf
		Else
			WB_IllusionEmpathy_Message_BloodForBloodFail.Show()
		EndIf
	EndIf

EndEvent

; -----