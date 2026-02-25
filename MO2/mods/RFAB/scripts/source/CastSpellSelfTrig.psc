ScriptName CastSpellSelfTrig Extends ObjectReference

Spell Property SpellToCast Auto
ObjectReference Property TargetRef Auto
Bool Property bOnlyPlayer = false Auto
Float Property fDelay = 0.5 Auto

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == game.GetPlayer() as actor && bOnlyPlayer
			ActCast()
		ElseIf !bOnlyPlayer
			ActCast()
		endif
	endEVENT
endSTATE

Function ActCast()
	Utility.Wait(fDelay)
	(TargetRef as Actor).DoCombatSpellApply(SpellToCast, TargetRef)
	gotoState("hasBeenTriggered")
EndFunction

STATE hasBeenTriggered

endSTATE