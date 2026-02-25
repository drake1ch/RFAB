Scriptname BoundSorcererScript extends ActiveMagicEffect

Perk Property HeavyArmorPerk Auto

Armor[] Property HeavyCuirass Auto
Armor[] Property LightCuirass Auto

Armor Property HeavyHelmet Auto
Armor Property HeavyGauntlets Auto
Armor Property HeavyBoots Auto

Armor Property LightHelmet Auto
Armor Property LightGauntlets Auto
Armor Property LightBoots Auto

Perk[] Property BoundPerks Auto

Keyword Property BoundKeyword Auto

;какой же чан с дерьмом тут сделали, но это работает, к сожалению.
; не трясись ты

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget.WornHasKeyword(BoundKeyword)
		int i = akTarget.GetNumItems()
		while (i > 0)
			i -= 1
			Form kItem = akTarget.GetNthForm(i)
			if (kItem.HasKeyword(BoundKeyword))
				akTarget.RemoveItem(kItem, abSilent = true)
			endif
		endwhile
		Dispel()
		return
	endif

	int iBoundID = GetBoundPowerID(akTarget)

	if (akTarget.HasPerk(HeavyArmorPerk))
		akTarget.EquipItem(HeavyCuirass[iBoundID], abSilent = true)
		akTarget.EquipItem(HeavyHelmet, abSilent = true)
		akTarget.EquipItem(HeavyGauntlets, abSilent = true)
		akTarget.EquipItem(HeavyBoots, abSilent = true)
	else
		akTarget.EquipItem(LightCuirass[iBoundID], abSilent = true)
		akTarget.EquipItem(LightHelmet, abSilent = true)
		akTarget.EquipItem(LightGauntlets, abSilent = true)
		akTarget.EquipItem(LightBoots, abSilent = true)
	endif
EndEvent

int Function GetBoundPowerID(Actor akTarget)
	int i = BoundPerks.Length
	while (i > 0)
		i -= 1
		if (akTarget.HasPerk(BoundPerks[i]))
			return i + 1
		endif
	endwhile
	return 0
EndFunction