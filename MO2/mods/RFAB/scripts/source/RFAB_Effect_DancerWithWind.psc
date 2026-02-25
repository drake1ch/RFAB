Scriptname RFAB_Effect_DancerWithWind extends ActiveMagicEffect  

GlobalVariable Property Variable Auto
GlobalVariable Property VariableOffset Auto
Spell Property Ability Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	while (Variable.Value != akTarget.GetActorValue("WeaponSpeedMult"))
		akTarget.RemoveSpell(Ability)
		float fWeaponSpeedMult = akTarget.GetActorValue("WeaponSpeedMult")
		float fWeaponSpeedMultWithOffset = fWeaponSpeedMult - VariableOffset.Value

		if (fWeaponSpeedMultWithOffset > 1.0)
			int iExcess = (fWeaponSpeedMultWithOffset * 100 - 100) as int
			float fAttackBonus = iExcess - iExcess % 10

			Ability.SetNthEffectMagnitude(0, fAttackBonus)
			akTarget.AddSpell(Ability, false)
		endif

		Variable.Value = fWeaponSpeedMult
		Utility.Wait(2.0)
	endwhile
EndEvent