Scriptname WB_Flourish_Script extends activemagiceffect  

; -----

Spell Property WB_Flourish Auto

; -----

Actor TheCaster
Bool HasSwung = false

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCaster = akCaster
	RegisterForAnimationEvent(TheCaster, "weaponSwing")
	RegisterForAnimationEvent(TheCaster, "weaponLeftSwing")

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If (asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing") && akSource == TheCaster
		HasSwung = true
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If HasSwung == true
		WB_Flourish.Cast(akCaster)
	EndIf

EndEvent

; -----