scriptName BlackGuardRestoreHealth extends activemagiceffect

Float Property TwoHandedModiffer = 2.0 Auto
Float Property Mag = 25.0 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster.GetEquippedItemType(1) == 5 || akCaster.GetEquippedItemType(1) == 6 || akCaster.GetEquippedItemType(1) == 7 || akCaster.GetEquippedItemType(1) == 12
		Mag *= TwoHandedModiffer
	EndIf
	akCaster.RestoreActorValue("Health", Mag)
endEvent