Scriptname RFAB_LichAura extends ActiveMagicEffect  

Spell Property HealAura Auto
Spell Property RessurectAura Auto

float Property HealthPercent Auto

int Property Cooldown Auto
int Property HealCount Auto

Actor Lich
bool IsReady = false

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Lich = akTarget
	IsReady = true
	RegisterForSingleUpdate(1.0)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	IsReady = false
    UnregisterForUpdate()
EndEvent

Event OnUpdate()
	while (Lich.GetActorValuePercentage("Health") >= HealthPercent) && IsReady
		Utility.Wait(0.25)
	endwhile
	if Lich.IsDead() || !IsReady
		return
	endif
	Lich.RestoreActorValue("Health", HealCount)
	HealAura.Cast(Lich, Lich)
	RessurectAura.Cast(Lich, Lich)
	RegisterForSingleUpdate(Cooldown)
EndEvent