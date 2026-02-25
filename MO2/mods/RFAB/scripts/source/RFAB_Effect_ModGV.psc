Scriptname RFAB_Effect_ModGV extends ActiveMagicEffect  

GlobalVariable Property Variable Auto

float Property Multiplier = 1.0 Auto

float _modifier

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_modifier = GetMagnitude() * Multiplier
	Variable.Mod(_modifier)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Variable.Mod(-_modifier)
EndEvent