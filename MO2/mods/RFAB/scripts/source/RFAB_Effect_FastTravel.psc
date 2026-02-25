Scriptname RFAB_Effect_FastTravel extends ActiveMagicEffect  

RFAB_MCM_Alias Property Settings Auto

bool _isFastTravelAllowed

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_isFastTravelAllowed = Settings.IsFastTravelAllowed

	if (!_isFastTravelAllowed)
		Settings.IsFastTravelAllowed = true
	endif

	PO3_SKSEFunctions.ShowMenu("MapMenu")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if (!_isFastTravelAllowed)
		Settings.IsFastTravelAllowed = false
	endif
EndEvent