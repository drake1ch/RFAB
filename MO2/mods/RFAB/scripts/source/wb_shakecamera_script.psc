Scriptname WB_ShakeCamera_Script extends ActiveMagicEffect  

; -----

Float Property WB_Strength Auto
Float Property WB_Duration Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Game.ShakeCamera(akTarget,WB_Strength,WB_Duration)

EndEvent

; -----
