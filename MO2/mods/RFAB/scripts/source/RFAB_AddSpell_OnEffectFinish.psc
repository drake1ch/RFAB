Scriptname RFAB_AddSpell_OnEffectFinish extends ActiveMagicEffect  

SPELL Property mySpell  Auto
Actor Property ActorCheck Auto
Float Property Delay = 0.0 Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
;	if ActorCheck = duduin
		Utility.Wait(Delay)
		akCaster.AddSpell(MySpell)
;	endif
endevent