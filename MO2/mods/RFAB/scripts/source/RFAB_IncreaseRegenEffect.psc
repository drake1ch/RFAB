Scriptname RFAB_IncreaseRegenEffect extends ActiveMagicEffect  

Spell Property Ability Auto

GlobalVariable Property Magnitude Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Magnitude.Value += GetMagnitude()
	Ability.SetNthEffectMagnitude(0, Magnitude.Value)

	akTarget.RemoveSpell(Ability)
	akTarget.AddSpell(Ability, false)
EndEvent