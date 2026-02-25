Scriptname VL_1stPCheckScript extends activemagiceffect  

GlobalVariable Property VL_1stPCheck  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	VL_1stPCheck.SetValueInt(1)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	VL_1stPCheck.SetValueInt(0)
EndEvent