Scriptname NewParalysisEffect extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.EnableAI(false)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.EnableAI(true)
EndEvent

Keyword Property ActorTypeCreature  Auto  
