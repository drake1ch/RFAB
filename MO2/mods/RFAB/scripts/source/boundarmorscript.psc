Scriptname BoundArmorScript extends ActiveMagicEffect

Perk Property HeavyArmorPerk Auto

Perk[] Property BoundPerks Auto

Armor[] Property HeavyShields Auto
Armor[] Property LightShields Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int iBoundID = GetBoundPowerID(akTarget)

	Armor kShield 
	if (akTarget.HasPerk(HeavyArmorPerk))
		kShield = HeavyShields[iBoundID]
	else
		kShield = LightShields[iBoundID]
	endif

	if (akTarget.GetEquippedShield() != kShield)
		Utility.Wait(0.2)
		akTarget.EquipItem(kShield, false, true)
	else 
		akTarget.RemoveItem(kShield, 1, true)
		Dispel()
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