Scriptname WB_IllusoryHit_Script extends ActiveMagicEffect  

; -----

Float Property WB_Mult Auto

; -----

Float TotalDamage

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TotalDamage = akTarget.GetActorValue("Health") * WB_Mult
	RegisterForSingleUpdate(0.15)


EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RestoreActorValue("Health",TotalDamage)

EndEvent

; -----

Event OnUpdate()

	GetTargetActor().DamageActorValue("Health", TotalDamage)

EndEvent

; -----