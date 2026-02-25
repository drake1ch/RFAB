Scriptname WB_TargetCasts_Script extends activemagiceffect  

; -----

Spell Property WB_SpellToCast Auto
Float Property WB_ShakeStrength Auto
Float Property WB_ShakeDuration Auto
Float Property WB_ShakeFalloff Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_SpellToCast.RemoteCast(akTarget, akCaster)
	If WB_ShakeStrength
		akTarget.RampRumble(WB_ShakeStrength, WB_ShakeDuration, WB_ShakeFalloff)
	EndIf

EndEvent

; -----
