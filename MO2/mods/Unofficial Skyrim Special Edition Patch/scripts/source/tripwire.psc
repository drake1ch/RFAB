scriptName Tripwire extends TrapTriggerBase


State Active

	Event OnBeginState()
		SetMotionType (1)
		TriggerSound.play (Self as ObjectReference)
		Self.blockActivation (False)
		Activate (Self as ObjectReference)
		Self.blockActivation (True)
		PlayAnimation ("Trigger")
		GoToState ("DoNothing")
	EndEvent
	
	Event OnHit (ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked)
	EndEvent

EndState

State DoNothing

	Event OnBeginState()
		SetDestroyed (True)
	EndEvent

	Event OnLoad()
	EndEvent

EndState

Event OnLoad()

	SetMotionType(4)

EndEvent

;/
Event OnCellDetach()

	SetMotionType(1)

EndEvent
/;

Function LocalActivateFunction()

	GoToState ("Active")

EndFunction

Event OnReset()

	Self.Reset()
	;SetMotionType (4) - USKP 2.0.1: Can't do this here, needs to rely on the OnLoad event above.
	Self.ClearDestruction()
	Self.SetDestroyed (False)
	GoToState ("Inactive")
	CountUsed = 0

EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	GoToState ("Active")
EndEvent

