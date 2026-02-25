Scriptname WB_EnslaveTheWeak_Power_Script extends activemagiceffect  

; -----

Quest Property WB_EnslaveTheWeak_Quest Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If WB_EnslaveTheWeak_Quest.IsRunning()
		WB_EnslaveTheWeak_Quest.Stop()
	EndIf

EndEvent

; -----