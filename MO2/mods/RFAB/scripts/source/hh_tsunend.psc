Scriptname hh_tsunend extends activemagiceffect  


Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget.IsInCombat()
			akTarget.StopCombat()
			akTarget.Disable()
			akTarget.Enable()
	endif
EndEvent