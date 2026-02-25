Scriptname RFAB_CombatVanish extends ActiveMagicEffect

Spell Property Invis Auto

int kSearching = 2

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if (RFAB_PapyrusFunctions.GetCombatState(akTarget) == kSearching)
		akTarget.DoCombatSpellApply(Invis, akTarget)
		akTarget.StopCombatAlarm()
	endif
EndEvent