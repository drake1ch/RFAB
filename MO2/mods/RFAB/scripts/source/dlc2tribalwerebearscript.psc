Scriptname DLC2TribalWerebearScript extends Actor  

Spell Property WerebearChange Auto
Float Property TransformDistance = 500.0 Auto

Actor Player

Function Transform()
	; do nothing by default
EndFunction

Auto State human
	Function Transform()
		GoToState("bear")
		StopCombat()
		StopCombatAlarm()
		;UDBP 2.0.2 - Needs 3D check
		if Is3DLoaded()
			WerebearChange.Cast(self)
		EndIf
		if !IsDead() ; UDBP 2.0.1 added check for dead actor
			StartCombat(Player)
		EndIf
	EndFunction	

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		If (akSource as Spell) != None && !(akSource as Spell).IsHostile()
			return
		Else
			Transform()
		EndIf
	EndEvent

	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		If akTarget == Player && Is3DLoaded()
			RegisterForSingleUpdate(1.0)
		EndIf
	EndEvent
EndState

State bear
	Event OnBeginState()
		UnregisterForUpdate()
	EndEvent
EndState

Event OnInit()
	Player = Game.GetPlayer()
EndEvent

Event OnUpdate()
	if (Player.GetDistance(self) <= TransformDistance)
		Transform()
	ElseIf !IsInCombat() || !Is3DLoaded()
		return
	Else
		RegisterForSingleUpdate(1.0)
	endif
EndEvent
