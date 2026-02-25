scriptName DeclineResist extends ActiveMagicEffect

Spell Property SpellToCast Auto

Float Property ResistValue Auto
String Property ResistName Auto
Float ResReturn = 0.0

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.GetAV(ResistName) > ResistValue
		ResReturn = akTarget.GetAV(ResistName) - ResistValue
		akTarget.ModAV(ResistName, - ResReturn)
	EndIf
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModAV(ResistName, ResReturn)
endEvent