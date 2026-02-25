Scriptname WB_FingerOfDeath_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_RestorationNecro_Imod_FingerOfDeath Auto
Sound Property WB_Restoration_Marker_Explosion Auto
Int Property WB_BloodSpatters Auto
Message Property WB_RestorationNecro_Message_FingerOfDeath Auto
Float Property WB_FlingForce Auto
Activator Property FXEmptyActivator Auto
Float Property WB_StartingBoxDisplacedZ Auto
GlobalVariable Property WB_Restoration_FingerOfDeath_Global_Percentage Auto
GlobalVariable Property WB_Restoration_FingerOfDeath_Global_XP Auto
GlobalVariable Property WB_Restoration_AllDeathSpells_Global_XP Auto
Actor Property PlayerRef Auto

Formlist Property DisintegrationMainImmunityList Auto
EffectShader Property WB_RestorationNecro_FXS_FingerOfDeath Auto

Activator Property AshPileObject Auto

Bool Property WB_IsResist Auto
String Property WB_FoDResist Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetHealth = akTarget.GetActorValue("Health")
	If WB_IsResist
		TargetHealth *= 100 / (100 - akTarget.GetActorValue(WB_FoDResist))
	EndIf
	Float SelfDamage = TargetHealth * (WB_Restoration_FingerOfDeath_Global_Percentage.GetValue() as Int) / 100
	If SelfDamage < (akCaster.GetActorValue("Health") - 1.0)

		; kill graphics
		WB_RestorationNecro_Imod_FingerOfDeath.Apply()
		WB_Restoration_Marker_Explosion.Play(akTarget)

		; damage
		akTarget.DamageActorValue("Health", TargetHealth)
		akCaster.DamageActorValue("Health", SelfDamage)

		; push force
	;	ObjectReference StarterBox = akTarget.placeAtMe(FXEmptyActivator)
	;	StarterBox.MoveTo(akTarget,0,0,WB_StartingBoxDisplacedZ)
	;		StarterBox.PushActorAway(akTarget, WB_FlingForce)
	;	StarterBox.Delete()

		; hurt
		akTarget.Kill(akCaster)
		WB_RestorationNecro_Message_FingerOfDeath.Show(SelfDamage)
		Game.TriggerScreenBlood(WB_BloodSpatters)

		; disintegrate
		Race VictimRace = (akTarget.GetBaseObject() as ActorBase).GetRace()
		If !DisintegrationMainImmunityList.HasForm(VictimRace)
			akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
			WB_RestorationNecro_FXS_FingerOfDeath.Play(akTarget, 4.0)
			Utility.Wait(1.25)     
			akTarget.AttachAshPile(AshPileObject)
			Utility.Wait(1.65)
			WB_RestorationNecro_FXS_FingerOfDeath.Stop(akTarget)
			akTarget.SetAlpha (0.0,True)
			akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)
		EndIf

	Else

		; toned down kill graphics
		WB_RestorationNecro_Imod_FingerOfDeath.Apply(0.33)

		; adjust self damage
		SelfDamage = akCaster.GetActorValue("Health") - 1.0

		; damage
		akTarget.DamageActorValue("Health", SelfDamage * 100 / WB_Restoration_FingerOfDeath_Global_Percentage.GetValueInt())
		akCaster.DamageActorValue("Health", SelfDamage)

		; hurt
		WB_RestorationNecro_Message_FingerOfDeath.Show(SelfDamage)
		Game.TriggerScreenBlood(2)
	EndIf

	If akCaster == PlayerRef
		Game.AdvanceSkill("Restoration",SelfDamage * WB_Restoration_FingerOfDeath_Global_XP.GetValue() * WB_Restoration_AllDeathSpells_Global_XP.GetValue() * 0.75)
	EndIf

EndEvent

; -----