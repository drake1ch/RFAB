Scriptname RFAB_ModActorValue_NoMagnitude extends ActiveMagicEffect

String Property ActorValue Auto
Float Property Modifier Auto

Actor Property SelfRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SelfRef = akTarget
	SelfRef.ModActorValue(ActorValue, Modifier)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	SelfRef.ModActorValue(ActorValue, -Modifier)
EndEvent
