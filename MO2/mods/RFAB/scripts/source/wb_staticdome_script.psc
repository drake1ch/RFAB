Scriptname WB_StaticDome_Script extends activemagiceffect  

; -----

Float Property WB_Amount Auto
String Property WB_DebuffType Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DamageActorValue(WB_DebuffType,WB_Amount)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RestoreActorValue(WB_DebuffType,WB_Amount)

EndEvent

; -----
