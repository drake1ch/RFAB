scriptName REQ_RangerPerk extends ActiveMagicEffect
{fixes the ranger perk bug and prevents ranger from applying on anything but light (x)bows}

Keyword Property LightBow Auto
Keyword Property HeavyBow Auto
Keyword Property LightXBow Auto
Keyword Property HeavyXBow Auto

Armor Property ArcherHelmet Auto
Armor Property ArcherArmor Auto
Armor Property ArcherGloves Auto
Armor Property ArcherBoots Auto

Perk Property ranger2 Auto

Actor Owner

string QuickShot = "bPerkQuickShot"

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Owner = akTarget
	RegisterForMenu("StatsMenu")
	Evaluate()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForAllMenus()
	Owner.SetAnimationVariableBool(QuickShot, false)
EndEvent

Event OnObjectEquipped(Form akObject, ObjectReference akReference)
	if (akObject as Armor) || (akObject as Weapon)	
		Evaluate()
	endif
EndEvent

Event OnMenuClose(string asMenuName)
	Evaluate()
EndEvent

Function Evaluate()
	bool bIsQuickShot = Owner.WornHasKeyword(LightBow) || Owner.WornHasKeyword(LightXBow)

	if Owner.HasPerk(ranger2) || HasSkirmishSet()
		bIsQuickShot = bIsQuickShot || Owner.WornHasKeyword(HeavyBow) || Owner.WornHasKeyword(HeavyXBow)
	endif
	
	Owner.SetAnimationVariableBool(QuickShot, bIsQuickShot)
EndFunction

bool Function HasSkirmishSet()
	return Owner.IsEquipped(ArcherHelmet) \
		&& Owner.IsEquipped(ArcherArmor) \
		&& Owner.IsEquipped(ArcherGloves) \
		&& Owner.IsEquipped(ArcherBoots)
EndFunction