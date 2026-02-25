Scriptname IceBladeWave extends activemagiceffect

Actor Property PlayerRef Auto hidden
Spell Property SpellToCast Auto
Float Property ManaDamage Auto
Float Property ManaPercent Auto

Float Cost

Event OnEffectStart(Actor akTarget, Actor akCaster)

	PlayerRef = akCaster
	RegisterForAnimationEvent(PlayerRef, "weaponSwing")
	RegisterForAnimationEvent(PlayerRef, "weaponLeftSwing")

EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "WeaponSwing" || asEventName == "WeaponLeftSwing"
		Cost = ManaDamage + (PlayerRef.GetAV("Magicka") * ManaPercent / 100)
		if PlayerRef.GetAV("Magicka") >= Cost
			SpellToCast.Cast(PlayerRef as objectreference, none)
			PlayerRef.DamageAV("Magicka", Cost)
		EndIf
	EndIf
EndEvent

Event OnRaceSwitchComplete()

	Utility.Wait(0.1)
	RegisterForAnimationEvent(PlayerRef, "weaponSwing")
	RegisterForAnimationEvent(PlayerRef, "weaponLeftSwing")

EndEvent
