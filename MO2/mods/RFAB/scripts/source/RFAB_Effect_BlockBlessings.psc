Scriptname RFAB_Effect_BlockBlessings extends ActiveMagicEffect  

Spell[] Property Blessings Auto

RFAB_BlessingMenu Property BlessingMenu Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	BlessingMenu.BlockBlessings(Blessings)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	BlessingMenu.UnblockBlessings(Blessings)
EndEvent