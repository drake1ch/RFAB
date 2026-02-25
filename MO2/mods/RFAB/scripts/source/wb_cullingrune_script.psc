Scriptname WB_CullingRune_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_RestorationNecro_Imod_CircleOfDeath_Kill Auto
GlobalVariable Property WB_Restoration_CullingRune_Global_XP Auto

Int Property WB_BloodStrength Auto
Float Property WB_FlingForce Auto
Activator Property FXEmptyActivator Auto

GlobalVariable Property WB_Restoration_CullingRune_Global_Threshold  Auto
GlobalVariable Property WB_Restoration_AllDeathSpells_Global_XP Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (akTarget.GetLevel() + WB_Restoration_CullingRune_Global_Threshold.GetValueInt()) <= akCaster.GetLevel()

		If akCaster == Game.GetPlayer()
			Game.AdvanceSkill("Restoration",akTarget.GetAV("Health") * WB_Restoration_CullingRune_Global_XP.GetValue() * WB_Restoration_AllDeathSpells_Global_XP.GetValue())
		EndIf

		WB_RestorationNecro_Imod_CircleOfDeath_Kill.Apply()

		ObjectReference StarterBox = akTarget.PlaceAtMe(FXEmptyActivator)
		StarterBox.MoveTo(akTarget,0,0,-150)
		StarterBox.PushActorAway(akTarget, WB_FlingForce)

		akTarget.Kill(akCaster)
		akTarget.SendAssaultAlarm()

		Game.TriggerScreenBlood(WB_BloodStrength)

		StarterBox.Delete()
	EndIf

EndEvent

; -----
