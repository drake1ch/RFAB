Scriptname RFAB_AddToFactionOnEffect extends ActiveMagicEffect  

Faction Property myFaction  Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddToFaction(myFaction)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveFromFaction(myFaction)
EndEvent
