Scriptname OnEffectStartAddspellArr extends ActiveMagicEffect

Spell[] Property SpellArr Auto

bool Property RemoveOnFinish = true Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int i = 0
	While i < SpellArr.Length
		akCaster.AddSpell(SpellArr[i], false)
		i += 1
	EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if (!RemoveOnFinish)
		return
	endif
	int i = 0
	While i < SpellArr.Length
		akCaster.RemoveSpell(SpellArr[i])
		i += 1
	EndWhile
EndEvent