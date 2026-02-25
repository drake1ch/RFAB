Scriptname RFAB_Effect_Detection extends ActiveMagicEffect  

import PO3_SKSEFunctions

bool Property ToggleDetection = false Auto
bool Property ToggleDetecting = false Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (ToggleDetection)
		PreventActorDetection(akTarget)
	endif
	if (ToggleDetecting)
		PreventActorDetecting(akTarget)
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if (ToggleDetection)
		ResetActorDetection(akTarget)
	endif
	if (ToggleDetecting)
		ResetActorDetecting(akTarget)
	endif
EndEvent