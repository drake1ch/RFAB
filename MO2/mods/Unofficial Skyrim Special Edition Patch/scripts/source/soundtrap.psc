scriptName SoundTrap extends TrapTriggerBase
;
;
;
;================================================================

weapon property triggerEffect auto
ammo property triggerEffectAmmo auto
explosion property havokNudge auto
ObjectReference Property ParentMarker Auto ;USKP 2.1.2 Bug #19283
import game

State Active
	Event onBeginState()
		goToState("DoNothing")
; 		;debug.Trace("Sound trap has fired")
		SetMotionType(1)
		objectReference selfRef = self
		;goToState( "DoNothing" )
		if triggerEffect
			triggerEffect.fire(selfRef, triggerEffectAmmo)
		endIf
		activate(self as objectReference)
		if triggerSound
			TriggerSound.play( self as ObjectReference)
		endIf
		if havokNudge
			self.placeAtMe(havokNudge)
		endIf
		; USKP 2.0.1 - Detection events can't be done for ObjectReference types. Curse you Patch 1.9!
		if( (lastTriggerRef as Actor) != None )
			CreateDetectionEvent(lastTriggerRef as actor, soundLevel) ; creates a detection event, 3 = generic event
		EndIf
		ApplyHavokImpulse(0.0, 0.0, -1.0, 15.0)
		playAnimation( "trigger01" )
	endEvent
	
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent

	event OnTriggerLeave( objectReference triggerRef )	
	endEvent
endState

State DoNothing			;Dummy state, don't do anything if animating
	event OnTriggerEnter( objectReference triggerRef )	
	endEvent
	
	event OnTriggerLeave( objectReference triggerRef )
		; USKP 2.0.1 - Returns traps to be used again once the player moves away if they should be allowed to.
		if( FiniteUse == false || ( FiniteUse == True && CountUsed < TriggerCount ) ) ; Defined on TrapTriggerBase
			goToState("Active")
		EndIf
	endEvent
	
	event OnLoad()
	endEvent
EndState

; USKP 1.2.3 changed these two blocks to OnLoad and OnUnload because the original *CellAttach events were not the correct types.
Event OnLoad()
	SetMotionType(4)
EndEvent

Event OnUnload()
EndEvent

event onReset()
	self.reset()
	;USKP 2.1.2 Bug #19283 - Several refs this is used on have enable parents that cause this to spam errors.
	if( ParentMarker == None )
		self.Disable()
		self.Enable()
	EndIf
	goToState("Inactive")
endEvent
