Scriptname WB_ReagentCost_Script extends ActiveMagicEffect  

; -----

Int Property WB_TakeHowMany Auto
Ingredient Property WB_ReagentType Auto
Bool Property WB_OnTargetInstead Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If WB_OnTargetInstead
		akTarget.RemoveItem(WB_ReagentType, WB_TakeHowMany, false, None)
	Else
		akCaster.RemoveItem(WB_ReagentType, WB_TakeHowMany, false, None)
	EndIf

EndEvent

; -----