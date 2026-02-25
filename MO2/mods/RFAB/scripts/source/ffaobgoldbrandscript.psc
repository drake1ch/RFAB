scriptName FFAOBGoldbrandScript extends ActiveMagicEffect

Float property ChargeCost = 30.0000 auto
actor property selfref auto hidden
spell property MySpell auto
keyword property ValidWeapons auto

function OnEffectStart(actor akTarget, actor akCaster)

	selfref = akCaster
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerStanding_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerRight_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerLeft_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerBackward_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "AttackPowerForward_FXStart")
	self.registerForAnimationEvent(akCaster as objectreference, "WeaponSwing")
	self.registerForAnimationEvent(akCaster as objectreference, "WeaponLeftSwing")
endFunction

function OnAnimationEvent(objectreference akSource, String EventName)

	Bool PowerAttack = selfref.GetAnimationVariableBool("bAllowRotation")
	if EventName == "AttackPowerStanding_FXStart" || EventName == "AttackPowerForward_FXStart" && selfref.IsSprinting() || EventName == "AttackPowerRight_FXStart" || EventName == "AttackPowerLeft_FXStart" || EventName == "AttackPowerBackward_FXStart"
		If selfref.GetAV("RightItemCharge") >= ChargeCost
			MySpell.Cast(selfref as objectreference, none)
			selfref.DamageActorValue("RightItemCharge", ChargeCost)
		EndIf
	elseIf EventName == "WeaponSwing" && selfref.GetEquippedWeapon(false).HasKeyword(ValidWeapons) && PowerAttack
		If selfref.GetAV("RightItemCharge") >= ChargeCost
			MySpell.Cast(selfref as objectreference, none)
			selfref.DamageActorValue("RightItemCharge", ChargeCost)
		EndIf
		elseIf EventName == "WeaponLeftSwing" && selfref.GetEquippedWeapon(true).HasKeyword(ValidWeapons) && PowerAttack
		If selfref.GetAV("LeftItemCharge") >= ChargeCost
			MySpell.Cast(selfref as objectreference, none)
			selfref.DamageActorValue("LeftItemCharge", ChargeCost)
		EndIf
	endIf
endFunction
