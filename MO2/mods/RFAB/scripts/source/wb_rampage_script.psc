Scriptname WB_Rampage_Script extends activemagiceffect  

; -----

String Property WB_Stat Auto
Float Property WB_ModifyBy Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.ModAV(WB_Stat, WB_ModifyBy)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModAV(WB_Stat, -WB_ModifyBy)

EndEvent

; ------