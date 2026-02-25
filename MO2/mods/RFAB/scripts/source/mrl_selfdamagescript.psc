Scriptname MRL_SelfDamageScript extends ActiveMagicEffect  

; -----

Float Property SelfDmg Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akCaster.DamageActorValue("Health", SelfDmg)
EndEvent

; -----