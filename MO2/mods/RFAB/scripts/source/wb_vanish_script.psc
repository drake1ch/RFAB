Scriptname WB_Vanish_Script extends ActiveMagicEffect  

; -----

Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster != PlayerRef
		akCaster.StopCombat()
	EndIf
	akTarget.StopCombat()

EndEvent

; -----