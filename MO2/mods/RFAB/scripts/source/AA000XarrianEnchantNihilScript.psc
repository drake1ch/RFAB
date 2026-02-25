Scriptname AA000XarrianEnchantNihilScript extends activemagiceffect


Event OnEffectStart(Actor akTarget, Actor akCaster)

	If Utility.RandomInt(0,100) == 10 && AkTarget.GetActorValue("Health") > 350

		AkTarget.DamageActorValue("Health", 350)

	Endif

	If Utility.RandomInt(0,100) == 10 && AkTarget.GetActorValue("Health") <= 350

		AkTarget.Kill(AkCaster)

	Endif

EndEvent
