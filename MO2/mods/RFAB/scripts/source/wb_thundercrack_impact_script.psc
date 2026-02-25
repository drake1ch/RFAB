Scriptname WB_Thundercrack_Impact_Script extends activemagiceffect  

; -----

Sound Property WB_DestructionShock_Marker_Impact_Thundercrack Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_DestructionShock_Marker_Impact_Thundercrack.Play(akTarget)

EndEvent

; -----