Scriptname RFAB_ResetPerks extends ActiveMagicEffect  

FormList Property Perks Auto
FormList Property ToggledSpells Auto

REQ_MassEffect_PC Property MassEffectGM Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int iCount = 0
	int i = Perks.GetSize()
	while (i > 0)
		i -= 1
		Perk kPerk = Perks.GetAt(i) as Perk
		if kPerk && akTarget.HasPerk(kPerk)
			iCount += 1
			akTarget.RemovePerk(kPerk)
		endif
	endwhile

	i = ToggledSpells.GetSize()
	while (i > 0)
		i -= 1
		Spell kSpell = ToggledSpells.GetAt(i) as Spell
		if kSpell
			akTarget.RemoveSpell(kSpell)
		endif
	endwhile

	akTarget.DispelAllSpells()

	Game.ModPerkPoints(iCount)
	; если когда-то будет больше 127 - у игры может начаться странное поведение

	MassEffectGM.UpdateRatios()
	MassEffectGM.FullEvaluate()
EndEvent
