Scriptname FalmerPassiveInvis Extends ActiveMagicEffect

Spell Property SpellToCast Auto
Float Property UpTime Auto
Float Property Delay Auto
Keyword Property KWD Auto

Actor Caster
Bool isready = true

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Caster = akCaster
	isready = true
	SpellToCast.Cast(Caster)
	self.OnUpdate()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	isready = false
EndEvent

Event OnUpdate()
	if !Caster.HasEffectKeyword(KWD)
		utility.Wait(Delay)
		SpellToCast.Cast(Caster)
		if isready
			RegisterForSingleUpdate(UpTime)
		endIf
	Else
		if isready
			RegisterForSingleUpdate(UpTime)
		endIf
	endIf
EndEvent
