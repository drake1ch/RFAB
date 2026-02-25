Scriptname DLC2BloodskalbladeScript extends referenceAlias

Actor property selfRef auto hidden
Spell Property DLC2BloodskalBladeSpellHoriz auto
Spell Property DLC2BloodskalBladeSpellVert auto
weapon property selfWeapon auto hidden hidden
ammo property DLC2BloodskalAmmo auto
ReferenceAlias Property BloodskalBlade auto
objectReference Property ObjSelf auto hidden


Event OnEquipped(Actor akActor)
	
	;objSelf = self.getReference()
; 	debug.trace(self + " has recieved OnEquipped")
	selfRef = akActor
; 	;debug.Trace("SelfRef = " + SelfRef)
	if (selfref == Game.GetPlayer())
		;registerForAnimationEvent(selfRef, "PowerAttack_Start_End")
		selfref = akActor 
		self.registerForAnimationEvent(akActor as objectreference, "AttackPowerStanding_FXStart")
		self.registerForAnimationEvent(akActor as objectreference, "AttackPowerRight_FXStart")
		self.registerForAnimationEvent(akActor as objectreference, "AttackPowerLeft_FXStart")
		self.registerForAnimationEvent(akActor as objectreference, "AttackPowerBackward_FXStart")
		self.registerForAnimationEvent(akActor as objectreference, "AttackPowerForward_FXStart")
		self.registerForAnimationEvent(akActor as objectreference, "WeaponSwing")
		self.registerForAnimationEvent(akActor as objectreference, "WeaponLeftSwing")
	else
		;registerForAnimationEvent(selfRef, "PowerAttack_Start_End")
		registerForAnimationEvent(akActor, "AttackPowerStanding_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerRight_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerLeft_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerBackward_FXstart")
		registerForAnimationEvent(akActor, "AttackPowerForward_FXstart")
	endif
; 	;debug.trace("Registering for Single Update")

	;RegisterforSingleUpdate(0)
endEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer as Actor
		selfWeapon = (self.getReference().getBaseObject() as weapon)
		utility.wait(0.1)
		if (akNewContainer as Actor).isEquipped(selfWeapon)
			OnEquipped(akNewContainer as Actor)
		endif
	endif
	BloodskalBlade.ForceRefTo(objSelf)
endEvent

Event OnUnequipped(Actor akActor)
; 	debug.trace(self + " has recieved onEffectFinish")
	;unregisterForAnimationEvent(selfRef, "PowerAttack_Start_End")
	selfref = akActor 
	self.UnregisterForAnimationEvent(akActor as objectreference, "AttackPowerStanding_FXStart")
	self.UnregisterForAnimationEvent(akActor as objectreference, "AttackPowerRight_FXStart")
	self.UnregisterForAnimationEvent(akActor as objectreference, "AttackPowerLeft_FXStart")
	self.UnregisterForAnimationEvent(akActor as objectreference, "AttackPowerBackward_FXStart")
	self.UnregisterForAnimationEvent(akActor as objectreference, "AttackPowerForward_FXStart")
	self.UnregisterForAnimationEvent(akActor as objectreference, "WeaponSwing")
	self.UnregisterForAnimationEvent(akActor as objectreference, "WeaponLeftSwing")
ENDEVENT

Event OnAnimationEvent(ObjectReference akSource, string EventName)
; 	debug.trace(self + " has recieved AnimationEvent ")
; 	debug.trace(">>>>>>>>>>>>> AnimationEvent Name: " + EventName)
; 	debug.trace(">>>>>>>>>>>>> AkSource: " + akSource)


	Bool PowerAttack = selfref.GetAnimationVariableBool("bAllowRotation")
	if EventName == "AttackPowerStanding_FXStart" || EventName == "AttackPowerForward_FXStart"  && Game.GetCameraState() != 0 
			weapon SwordWeapon = selfRef.GetEquippedWeapon()
			DLC2BloodskalBladeSpellVert.cast(selfRef)
	elseif EventName == "AttackPowerRight_FXStart" || EventName == "AttackPowerLeft_FXStart" || EventName == "AttackPowerBackward_FXStart"  && Game.GetCameraState() != 0 
			weapon SwordWeapon = selfRef.GetEquippedWeapon()
			DLC2BloodskalBladeSpellHoriz.cast(selfRef)
	elseIf EventName == "WeaponSwing" && PowerAttack  && Game.GetCameraState() == 0 && ( Input.IsKeyPressed(30)  || Input.IsKeyPressed(31) || Input.IsKeyPressed(32))
			weapon SwordWeapon = selfRef.GetEquippedWeapon()
			DLC2BloodskalBladeSpellHoriz.cast(selfRef)
	elseIf EventName == "WeaponSwing" && PowerAttack  && Game.GetCameraState() == 0  && !Input.IsKeyPressed(30) && !Input.IsKeyPressed(31) && !Input.IsKeyPressed(32)
			weapon SwordWeapon = selfRef.GetEquippedWeapon()
			DLC2BloodskalBladeSpellVert.cast(selfRef)
	endIf


 
endEVENT