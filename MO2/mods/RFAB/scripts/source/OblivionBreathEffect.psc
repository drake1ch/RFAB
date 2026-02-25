Scriptname OblivionBreathEffect extends ActiveMagicEffect  

spell property OblivionBreath1 auto
spell property OblivionBreath2 auto
spell property OblivionBreath3 auto
Perk Property PyromancyPerk auto
Perk Property CremationPerk auto
Perk Property FireMasteryPerk auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akCaster.HasPerk(PyromancyPerk) && akCaster.HasPerk(CremationPerk) != 1
		OblivionBreath1.cast(akTarget)
	elseif akCaster.HasPerk(CremationPerk) && akCaster.HasPerk(FireMasteryPerk) !=1
		OblivionBreath2.cast(akTarget)
	elseif akCaster.HasPerk(FireMasteryPerk)
		OblivionBreath3.cast(akTarget)
	endif
endEvent