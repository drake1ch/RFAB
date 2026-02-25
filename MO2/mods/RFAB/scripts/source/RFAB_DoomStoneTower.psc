Scriptname RFAB_DoomStoneTower extends ActiveMagicEffect  

Spell Property ArmorAbility Auto
Spell Property DoomStoneTower Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	ChangeArmor(akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	ChangeArmor(akTarget)
EndEvent

Function ChangeArmor(Actor akTarget)
	if !akTarget.HasSpell(DoomStoneTower)
		return
	endif

    float fStaggerResistExcess = Math.Floor((akTarget.GetActorValue("HeavyArmorSkillAdvance") - 100.0) / 25.0)
	akTarget.RemoveSpell(ArmorAbility)

	if fStaggerResistExcess >= 0.0
		float fArmorBonus = fStaggerResistExcess * 50.0
		ArmorAbility.SetNthEffectMagnitude(0, fArmorBonus)
		akTarget.AddSpell(ArmorAbility, false)
	endif
endFunction