Scriptname RFAB_ToggleAbilityDual extends ActiveMagicEffect  

Spell Property ToggledSpell Auto
Spell Property ToggledPoweredSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	bool bDualCast = akTarget.GetAnimationVariableBool("IsCastingDual")

	if (!bDualCast)
		ToggledSpell.Cast(akTarget, akTarget)
	endif

	if (akTarget.HasSpell(ToggledPoweredSpell))
		akTarget.RemoveSpell(ToggledPoweredSpell)
	elseif (bDualCast)
		if (PO3_SKSEFunctions.HasActiveSpell(akTarget, ToggledSpell))
			akTarget.DispelSpell(ToggledSpell)
		endif
		akTarget.AddSpell(ToggledPoweredSpell, false)
	endif
EndEvent