Scriptname Utility_PlaceExplosion extends activemagiceffect  

Explosion property exp auto
Bool property placeOnEnd auto
Float property expScale = 1.0 auto

Event OnEffectStart(Actor Target, Actor Caster)
	If (!placeOnEnd)
		ObjectReference e = Target.placeatme(exp)
		e.SetScale(expScale)
	EndIf
endEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	If (placeOnEnd)
		ObjectReference e = Target.placeatme(exp)
		e.SetScale(expScale)
	EndIf
endEvent
