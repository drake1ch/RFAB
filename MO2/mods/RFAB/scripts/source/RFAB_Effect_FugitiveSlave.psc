Scriptname RFAB_Effect_FugitiveSlave extends ActiveMagicEffect  

GlobalVariable Property Variable Auto
GlobalVariable Property VariableOffset Auto
Spell Property Ability Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.RemoveSpell(Ability)

	while (Variable.Value != akTarget.GetActorValue("SpeedMult"))
		float fSpeedMult = akTarget.GetActorValue("SpeedMult")
		float fSpeedMultWithOffset = fSpeedMult - VariableOffset.Value

		if (fSpeedMultWithOffset > 100.0)
			int iExcess = (fSpeedMultWithOffset - 100.0) as int
			float fAttackBonus = iExcess - iExcess % 10

			if (fAttackBonus > 0.0)
				Ability.SetNthEffectMagnitude(0, fAttackBonus)
				akTarget.AddSpell(Ability, false)
			endif
		endif

		Variable.Value = fSpeedMult
		Utility.Wait(2.0)
	endwhile
EndEvent