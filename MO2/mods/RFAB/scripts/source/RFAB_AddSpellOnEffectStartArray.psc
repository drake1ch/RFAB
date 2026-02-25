Scriptname RFAB_AddSpellOnEffectStartArray extends ActiveMagicEffect  

SPELL[] Property spells  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)
	int i = 0
	while i < spells.length
		akTarget.addspell(spells[i], false)
		i += 1
	endwhile
endevent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	int i = 0
	while i < spells.length
		akTarget.removespell(spells[i])
		i += 1
	endwhile
endevent