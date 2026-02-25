Scriptname WB_ShiftingEarth_Hazard_Script extends ActiveMagicEffect  

; -----

Activator Property FXEmptyActivator Auto
FormList Property WB_AlterationEarth_ShiftingEarth_FormList Auto
Float Property WB_RockSpikeZ = 512.0 Auto
Float Property WB_TargetBoxZ = 32.0 Auto
Float Property WB_Speed Auto
Float Property WB_PushForce Auto
Explosion Property WB_AlterationEarth_Explosion_ShiftingEarth_Rupture Auto
Float Property WB_DispelDelay = 1.0 auto
Float Property WB_RockSpikeLinger = 10.0 auto

; -----

ObjectReference TargetBox
ObjectReference RockSpike

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetBox = akTarget.PlaceAtMe(FXEmptyActivator)
	RockSpike = akTarget.PlaceAtMe(WB_AlterationEarth_ShiftingEarth_FormList.GetAt(Utility.RandomInt(0,3)), 1, false, true)

	; move rock spike away
	RockSpike.MoveTo(akTarget, 0, 0, -WB_RockSpikeZ)

	; cause explosion
	akTarget.PlaceAtMe(WB_AlterationEarth_Explosion_ShiftingEarth_Rupture)

	; enable spike
	RockSpike.Enable()
	RockSpike.SetActorCause(akCaster)

	; wait until 3D loaded before translation start
	Utility.Wait(0.1)
	RockSpike.PushActorAway(akTarget, WB_PushForce)

	; move box and spike to pushed actor
	Float ChosenAngle = Utility.RandomFloat(0, 180)
	RockSpike.MoveTo(akTarget, 0, 0, -WB_RockSpikeZ)
	RockSpike.SetAngle(0, -180, ChosenAngle)
	TargetBox.MoveTo(akTarget, 0, 0, -WB_TargetBoxZ)
	TargetBox.SetAngle(0, -180, ChosenAngle)

	RockSpike.TranslateToRef(TargetBox, WB_Speed)

	; dispel after delay
	Utility.Wait(WB_DispelDelay)
	Dispel()

	; destroy rock spike after delay
	Utility.Wait(WB_RockSpikeLinger)
;	RockSpike.Disable(true)
	RockSpike.Delete()
	TargetBox.Delete()

EndEvent

; -----