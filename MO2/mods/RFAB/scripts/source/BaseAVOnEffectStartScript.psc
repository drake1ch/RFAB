scriptName BaseAVOnEffectStartScript extends ActiveMagicEffect

String Property StatName Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.SetAV(StatName, akTarget.GetBaseAV(StatName) + self.GetMagnitude())
	SendModEvent("RFAB_BaseAttributesChanged")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akCaster.SetAV(StatName, akTarget.GetBaseAV(StatName) - self.GetMagnitude())
	SendModEvent("RFAB_BaseAttributesChanged")
EndEvent
