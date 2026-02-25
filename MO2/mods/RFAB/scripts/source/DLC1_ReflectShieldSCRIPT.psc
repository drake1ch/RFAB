Scriptname DLC1_ReflectShieldSCRIPT extends ActiveMagicEffect  
{Script for reflecting shield to appear to reflect certain incoming spells.}

import PO3_Events_AME

Actor SelfRef
Spell  Property ChargeSpell1 Auto
Spell  Property ChargeSpell2 Auto
Spell  Property ChargeSpell3 Auto
Sound Property ChargSound Auto
ImagespaceModifier Property ChargeIMod Auto
ImagespaceModifier Property BlastIMod Auto
GlobalVariable Property TimesHit Auto
GlobalVariable Property CurrentStage Auto
Int Property HitsWhenDone = 20 Auto
Keyword Property VendorItemWeapon Auto
Actor PlayerRef

EVENT OnEffectStart(Actor Target, Actor Caster)	
	SelfRef = Caster
	PlayerRef = Game.GetPlayer()

	if (SelfRef == PlayerRef)
		registerForAnimationEvent(selfRef, "bashRelease")
	else
		registerForAnimationEvent(selfRef, "bashExit")
		registerForAnimationEvent(selfRef, "bashStop")
	endif
	OnHitReady()
ENDEVENT

Function OnHitReady()
	RegisterForHitEventEx(self as ActiveMagicEffect, akAggressorFilter = None, akSourceFilter = VendorItemWeapon, abMatch = True)
	RegisterForWeaponHit(self as ActiveMagicEffect)
EndFunction

Function OnHitStop()
	UnregisterForAllHitEventsEx(self as ActiveMagicEffect)
	UnregisterForWeaponHit(self as ActiveMagicEffect)
EndFunction

Function AurielShieldLogic()
	TimesHit.SetValue(TimesHit.GetValue() + 1)
	ChargSound.Play(selfRef) 

	if (TimesHit.GetValue() == HitsWhenDone)
		selfRef.SetSubGraphFloatVariable("fDampRate", 1)
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 1)

		CurrentStage.SetValue(3)
		OnHitStop()
	endif
	if SelfRef == PlayerRef
		ChargeIMod.Apply()
	endif
EndFunction


EVENT OnEffectFinish(Actor Target, Actor Caster)	
	unregisterForAnimationEvent(selfRef, "bashRelease")
	unregisterForAnimationEvent(selfRef, "bashExit")
	unregisterForAnimationEvent(selfRef, "bashStop")
ENDEVENT


Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	AurielShieldLogic()
ENDEVENT

Event OnWeaponHit(ObjectReference akTarget, Form akSource, Projectile akProjectile, Int aiHitFlagMask)
	if akTarget as Actor != None && !((akTarget as Actor).IsDead())
		AurielShieldLogic()
	endif
EndEvent
	

Event OnAnimationEvent(ObjectReference akSource, string EventName)
	if (SelfRef == PlayerRef)
		if (eventName == "bashRelease")
			if CurrentStage.GetValue() == 3
				BlastIMod.Apply(1)
				ChargeSpell3.cast(SelfRef)	
			endif	
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 0)
			CurrentStage.SetValue(0)
			TimesHit.SetValue(0)
			OnHitReady()
		endif
	else
		if (eventName == "bashExit") || (eventName == "bashStop")
			if CurrentStage.GetValue() == 3
				ChargeSpell3.cast(selfRef)	
			endif	
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 0)
			CurrentStage.SetValue(0)
			TimesHit.SetValue(0)
		endif
	endif
		
endEVENT

;/
Event OnUpdate()
	if CurrentStage.GetValue() == 1
		selfRef.SetSubGraphFloatVariable("fDampRate", 1)
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.75)
	elseif CurrentStage.GetValue() == 2
		;debug.Notification("Shield at LEVEL 2")
		selfRef.SetSubGraphFloatVariable("fDampRate", 1)
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 0.85)
	elseif CurrentStage.GetValue() == 3
		;debug.Notification("Shield at LEVEL 3")
		selfRef.SetSubGraphFloatVariable("fDampRate", 1)
		selfRef.SetSubGraphFloatVariable("fToggleBlend", 1)
	endif
EndEvent

Int Property HitsUntilFirstCharge = 5 Auto
{Hit's required until the shiled reaches it's first charge (DEFAULT = 5)}
Int Property HitsUntilSecondCharge = 10 Auto
{Hit's required until the shiled reaches it's first charge (DEFAULT = 10)}
Int Property HitsUntilThirdCharge = 15 Auto
{Hit's required until the shiled reaches it's first charge (DEFAULT = 15)}
/;