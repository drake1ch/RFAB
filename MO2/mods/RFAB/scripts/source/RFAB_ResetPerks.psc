Scriptname RFAB_ResetPerks extends ActiveMagicEffect  

Formlist Property Perks Auto

REQ_MassEffect_PC Property MassEffectGM Auto
RFAB_CastSpeed Property CastSpeedGM Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int iCount = 0
	int i = Perks.GetSize()
	while (i > 0)
		i -= 1
		Perk kPerk = Perks.GetAt(i) as Perk
		if (akTarget.HasPerk(kPerk))
			iCount += 1
			akTarget.RemovePerk(kPerk)
		endif
	endwhile

	Game.ModPerkPoints(iCount)
	; если кол-во перков будет > 127 - в меню будет отображаться слишком огромное число

	MassEffectGM.Update_Ratios()
	MassEffectGM.FullEvaluate()
	CastSpeedGM.UpdateRatios()
	CastSpeedGM.Evaluate()
EndEvent