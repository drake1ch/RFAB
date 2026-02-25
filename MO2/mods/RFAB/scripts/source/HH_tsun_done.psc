Scriptname HH_tsun_done extends activemagiceffect  


Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.SetGhost()
EndEvent

