scriptName BaseAVOnEffectStartScript extends ActiveMagicEffect

REQ_AttributeSystem Property AttributeSystem Auto
String Property StatName Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.SetAV(StatName, akTarget.GetBaseAV(StatName) + self.GetMagnitude())
	AttributeSystem.UpdateAttributeBonuses()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akCaster.SetAV(StatName, akTarget.GetBaseAV(StatName) - self.GetMagnitude())
	AttributeSystem.UpdateAttributeBonuses()
EndEvent