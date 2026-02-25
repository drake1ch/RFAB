Scriptname _DetectionMainScript Extends ActiveMagicEffect

Spell Property DetectionSpell Auto
Int Property UpdateTime Auto

Actor Someone = None

Event OnEffectStart(Actor Target, Actor Caster)
	Someone = Caster
	DetectionSpell.Cast(Someone)
	RegisterForUpdate(UpdateTime)
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	Someone = None
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	DetectionSpell.Cast(Someone)
EndEvent
