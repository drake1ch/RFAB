Scriptname RFAB_ToggleStance extends ActiveMagicEffect

Spell[] Property StancePool Auto

Spell Property Ability Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	bool bWasActive = akTarget.HasSpell(Ability)

	int i = 0
	while (i < StancePool.Length)
		akTarget.RemoveSpell(StancePool[i])
		i += 1
	endwhile

	if (!bWasActive)
		akTarget.AddSpell(Ability, false)
	endif
EndEvent