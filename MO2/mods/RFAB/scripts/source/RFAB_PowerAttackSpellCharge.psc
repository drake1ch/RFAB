Scriptname RFAB_PowerAttackSpellCharge extends ActiveMagicEffect  

float Property ChargeCost Auto
Spell Property SpellToCast Auto
Weapon Property TrackedWeapon Auto

Actor _owner

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_owner = akTarget
	RegisterForAnimationEvent(akTarget, "AttackPowerStanding_FXStart")
	RegisterForAnimationEvent(akTarget, "AttackPowerRight_FXStart")
	RegisterForAnimationEvent(akTarget, "AttackPowerLeft_FXStart")
	RegisterForAnimationEvent(akTarget, "AttackPowerBackward_FXStart")
	RegisterForAnimationEvent(akTarget, "AttackPowerForward_FXStart")
	RegisterForAnimationEvent(akTarget, "WeaponSwing")
	RegisterForAnimationEvent(akTarget, "WeaponLeftSwing")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	bool bIsPowerAttack = _owner.GetAnimationVariableBool("bAllowRotation")

	if (!bIsPowerAttack)
		return
	endif

	bool bIsPowerAnim = asEventName == "AttackPowerStanding_FXStart" \
		 || asEventName == "AttackPowerForward_FXStart" && _owner.IsSprinting() \
		 || asEventName == "AttackPowerRight_FXStart" \
		 || asEventName == "AttackPowerLeft_FXStart" \
		 || asEventName == "AttackPowerBackward_FXStart"

	if (bIsPowerAnim || asEventName == "WeaponSwing")
		TryCastForHand(false)
	elseif (asEventName == "WeaponLeftSwing")
		TryCastForHand(true)
	endif
EndEvent

Function TryCastForHand(bool abLeftHand)
	if (_owner.GetEquippedWeapon(abLeftHand) != TrackedWeapon)
		return
	endif
	
	if (ChargeCost != 0.0)
		if (!abLeftHand && _owner.GetActorValue("RightItemCharge") >= ChargeCost)
			SpellToCast.Cast(_owner)
			_owner.DamageActorValue("RightItemCharge", ChargeCost)
		elseif (abLeftHand && _owner.GetActorValue("LeftItemCharge") >= ChargeCost)
			SpellToCast.Cast(_owner)
			_owner.DamageActorValue("LeftItemCharge", ChargeCost)
		endif
	else
		SpellToCast.Cast(_owner)
	endif
EndFunction