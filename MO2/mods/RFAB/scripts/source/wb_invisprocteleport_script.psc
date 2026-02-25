Scriptname WB_InvisProcTeleport_Script extends activemagiceffect  

; -----

; IF YOU READ THIS YOU WILL DIE IN 7 DAYS

; -----

VisualEffect Property WB_IllusionShadow_VFX_GhostwalkReturn Auto
Float Property WB_TriggerVFXDur Auto
Sound Property WB_IllusionShadow_Marker_Script_GhostwalkReturn Auto
ImagespaceModifier Property WB_IllusionShadow_Imod_GhostwalkReturn Auto

Float Property WB_CheckRate Auto
Bool Property WB_CheckLocation Auto
Keyword Property MagicInvisibility Auto
Activator Property FXEmptyActivator Auto
Spell Property WB_S_I050_Shadowbond_Spell_Proc auto

; -----

Actor TheTarget
Actor TheCaster
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	Utility.Wait(0.25)
	WB_S_I050_Shadowbond_Spell_Proc.Cast(akCaster)
	WB_S_I050_Shadowbond_Spell_Proc.Cast(akTarget)
	RegisterForSingleUpdate(WB_CheckRate)

EndEvent

; -----

Event OnUpdate()

	If (!TheCaster.HasEffectKeyword(MagicInvisibility) || !TheTarget.HasEffectKeyword(MagicInvisibility)) && ((TheCaster.GetCurrentLocation().IsSameLocation(TheTarget.GetCurrentLocation()) || TheCaster.GetCurrentLocation().HasCommonParent(TheTarget.GetCurrentLocation())) || !WB_CheckLocation)
		TheBox.MoveTo(TheCaster)
		TheCaster.MoveTo(TheTarget)
		TheTarget.MoveTo(TheBox)
	;	TheCaster.SetAngle(TheTarget.GetAngleX(), TheTarget.GetAngleY(), TheTarget.GetAngleZ())
		WB_IllusionShadow_Marker_Script_GhostwalkReturn.Play(TheTarget)
		WB_IllusionShadow_Marker_Script_GhostwalkReturn.Play(TheCaster)
		WB_IllusionShadow_VFX_GhostwalkReturn.Play(TheTarget, WB_TriggerVFXDur)
		WB_IllusionShadow_VFX_GhostwalkReturn.Play(TheCaster, WB_TriggerVFXDur)
		WB_IllusionShadow_Imod_GhostwalkReturn.Apply()
		Dispel()
	Else
		RegisterForSingleUpdate(WB_CheckRate)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akCaster.DispelSpell(WB_S_I050_Shadowbond_Spell_Proc)
	akTarget.DispelSpell(WB_S_I050_Shadowbond_Spell_Proc)
	TheBox.Delete()

EndEvent

; -----