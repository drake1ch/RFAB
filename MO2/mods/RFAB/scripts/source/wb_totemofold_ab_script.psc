Scriptname WB_TotemOfOld_Ab_Script extends activemagiceffect  

; -----

VisualEffect Property WB_IllusionShadow_VFX_GhostwalkReturn auto
Explosion Property WB_ConjurationSummon_Explosion_TotemOfOld Auto
VisualEffect Property DraugrMaleEyeGlowFX auto

Race Property NordRace Auto
Race Property BearSnowRace Auto

Float Property WB_UpdateRate Auto
Float Property WB_Chance Auto

Float Property WB_Alpha Auto

Weapon Property WB_Unequip1 Auto
Weapon Property WB_Unequip2 Auto
Ammo Property WB_Unequip3 Auto

; -----

Bool IsHuman

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.SetAlpha(WB_Alpha, false)
	If akTarget.GetRace() == NordRace
;		Debug.Notification("Spawned as human")
		; spawned as human
		IsHuman = true
		DraugrMaleEyeGlowFX.Play(akTarget, -1)
	Else
		; spawned as bear
;		Debug.Notification("Spawned as bear")
		IsHuman = false
	EndIf
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If WB_Chance < Utility.RandomFloat(0.0,1.0)
		; shift
		Actor TargetActor = GetTargetActor()
		If IsHuman == true
			If Targetactor.GetRace() == NordRace
;				Debug.Notification("Turn into bear")
				; is human
				TargetActor.RestoreActorValue("Health", 9999)
				TargetActor.PlaceAtMe(WB_ConjurationSummon_Explosion_TotemOfOld)
				TargetActor.SetRace(BearSnowRace)
				IsHuman = false
				If WB_Unequip1
					TargetActor.UnequipItem(WB_Unequip1)
				EndIf
				If WB_Unequip2
					TargetActor.UnequipItem(WB_Unequip2)
				EndIf
				If WB_Unequip3
					TargetActor.UnequipItem(WB_Unequip3)
				EndIf
				TargetActor.PlaceAtMe(WB_IllusionShadow_VFX_GhostwalkReturn)
			Else
				Debug.Trace("APOCNEW DEBUG: Wants to turn into bear, but race is already bear",0)
			EndIf
		Else
			If Targetactor.GetRace() == BearSnowRace
				; is bear
;				Debug.Notification("Turn into human")
				TargetActor.RestoreActorValue("Health", 9999)
				TargetActor.PlaceAtMe(WB_ConjurationSummon_Explosion_TotemOfOld)
				TargetActor.SetRace(NordRace)
				IsHuman = true
				TargetActor.SetRace(NordRace)			; debug
				TargetActor.PlaceAtMe(WB_IllusionShadow_VFX_GhostwalkReturn)
				If WB_Unequip1
					TargetActor.EquipItem(WB_Unequip1)
				EndIf
				If WB_Unequip2
					TargetActor.EquipItem(WB_Unequip2)
				EndIf
				If WB_Unequip3
					TargetActor.EquipItem(WB_Unequip3)
				EndIf
				Utility.Wait(0.5)
				DraugrMaleEyeGlowFX.Play(TargetActor, -1)
			Else
;				Debug.Trace("APOCNEW DEBUG: Wants to turn into human, but race is already human",0)
			EndIf
		EndIf
	EndIf
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----