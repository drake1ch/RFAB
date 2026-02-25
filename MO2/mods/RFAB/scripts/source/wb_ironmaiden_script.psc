Scriptname WB_IronMaiden_Script extends ActiveMagicEffect  

; -----

Float Property WB_DamageFractionPerTick Auto
Float Property WB_UpdateRate Auto

; -----

Float FractionPerTick
Float TotalDamage
Bool DoDamage
Actor TheTarget
Actor TheCaster
Float RealDamage

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

	DoDamage = true
	TotalDamage = 0
	FractionPerTick = WB_UpdateRate * WB_DamageFractionPerTick
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	RealDamage = TheTarget.GetAV("Health") * FractionPerTick
	If DoDamage
		TotalDamage += RealDamage
		TheTarget.DamageAV("Health",RealDamage)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	DoDamage = false
	UnregisterForUpdate()
	Utility.Wait(0.1)
	If !akTarget.IsDead()
		akTarget.RestoreAV("Health",TotalDamage)
	EndIf

EndEvent

; -----