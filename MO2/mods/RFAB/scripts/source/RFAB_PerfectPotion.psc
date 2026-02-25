Scriptname RFAB_PerfectPotion extends ActiveMagicEffect  

string Property ActorValue Auto

Spell Property Ability Auto
GlobalVariable Property Magnitude Auto

RFAB_AttributeBonuses Property AttributeSystem Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	float fMagnitude = GetMagnitude()

	AttributeSystem.ModBaseActorValue(ActorValue, fMagnitude)
	Magnitude.Value += fMagnitude

	if (!akTarget.HasSpell(Ability))
		akTarget.AddSpell(Ability, false)
	endif
EndEvent