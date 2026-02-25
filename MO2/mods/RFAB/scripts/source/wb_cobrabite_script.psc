Scriptname WB_CobraBite_Script extends ActiveMagicEffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If (akTarget.GetActorValuePercentage("Health") > 0.25)
    akTarget.DamageAV("Health", akTarget.GetAV("Health") - (Math.Ceiling(akTarget.GetAV("Health") / akTarget.GetActorValuePercentage("Health") * 0.25)))
	EndIf

EndEvent

; -----