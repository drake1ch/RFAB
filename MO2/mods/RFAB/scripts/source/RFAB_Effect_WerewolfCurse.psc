Scriptname RFAB_Effect_WerewolfCurse extends ActiveMagicEffect  

Perk Property BeastPerk auto
CompanionsHousekeepingScript Property C00 auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	if (!akTarget.HasPerk(BeastPerk))
		C00.PlayerHasBeastBlood = false
		C00.PlayerIsWerewolf.SetValue(0.0)
	endif
EndEvent