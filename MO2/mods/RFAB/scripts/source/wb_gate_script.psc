Scriptname WB_Gate_Script extends activemagiceffect  

; ------

Float Property WB_Delay Auto
Float Property WB_DistanceInFront Auto
Bool Property WB_CheckLocation = false Auto
Activator Property EffectSummonBanishFX Auto
VisualEffect Property WB_ConjurationSummon_VFX Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ObjectReference PlacedEffect = akTarget.PlaceAtMe(EffectSummonBanishFX)
	Float CasterAngle = akCaster.GetAngleZ()
	PlacedEffect.MoveTo(akCaster,(WB_DistanceInFront * Math.Sin(CasterAngle)), (WB_DistanceInFront * Math.Cos(CasterAngle)), 0.0)

	Utility.Wait(WB_Delay)

	If WB_CheckLocation == false || akTarget.getCurrentLocation().IsSameLocation(akCaster.GetCurrentLocation())
		akTarget.MoveTo(PlacedEffect)
		WB_ConjurationSummon_VFX.Play(akTarget,4.0)
	EndIf

	Utility.Wait(4.0)

	PlacedEffect.Delete()

EndEvent

; ------