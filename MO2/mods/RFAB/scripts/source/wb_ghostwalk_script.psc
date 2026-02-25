Scriptname WB_Ghostwalk_Script extends ActiveMagicEffect  

; -----

VisualEffect Property WB_IllusionShadow_VFX_GhostwalkReturn Auto
Float Property WB_TriggerVFXDur Auto
Sound Property WB_IllusionShadow_Marker_Script_GhostwalkReturn Auto

ImagespaceModifier Property WB_IllusionShadow_Imod_GhostwalkReturn Auto

Activator Property FXEmptyActivator Auto

Message Property WB_IllusionShadow_Message_GhostwalkFail Auto

Bool Property WB_CheckLocation Auto

Float Property WB_DetectionSoundBase Auto
Float Property WB_DetectionSoundMult Auto

Float Property WB_Wait Auto
Spell Property WB_S_I000_InvisFix_Spell_Ab_PC Auto

; -----

ObjectReference BeaconBox
Location BeaconLocation
Float DetectionStrength

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	BeaconBox = akTarget.placeAtMe(FXEmptyActivator)
	BeaconBox.SetPosition(akTarget.GetPositionX(), akTarget.GetPositionY(), akTarget.GetPositionZ())
	BeaconBox.SetAngle(akTarget.GetAngleX(), akTarget.GetAngleY(), akTarget.GetAngleZ())
	BeaconLocation = akTarget.GetCurrentLocation()

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(WB_Wait)
	If (BeaconLocation.IsSameLocation(akTarget.GetCurrentLocation()) || BeaconLocation.HasCommonParent(akTarget.GetCurrentLocation())) || !WB_CheckLocation
		akTarget.MoveTo(BeaconBox, 0,0,0, true)
		WB_IllusionShadow_Marker_Script_GhostwalkReturn.Play(akTarget)
		WB_IllusionShadow_VFX_GhostwalkReturn.Play(akTarget, WB_TriggerVFXDur)
		WB_IllusionShadow_Imod_GhostwalkReturn.Apply()
		DetectionStrength = WB_DetectionSoundBase - (akCaster.GetAV("Illusion") * WB_DetectionSoundMult)
		If DetectionStrength < 5
			DetectionStrength = 5
		EndIf
		akTarget.CreateDetectionEvent(akCaster, DetectionStrength as Int)
	Else
		WB_IllusionShadow_Message_GhostwalkFail.Show()
	EndIf
	akTarget.AddSpell(WB_S_I000_InvisFix_Spell_Ab_PC, false)
	Utility.Wait(1.0)
	BeaconBox.Delete()

EndEvent

; -----