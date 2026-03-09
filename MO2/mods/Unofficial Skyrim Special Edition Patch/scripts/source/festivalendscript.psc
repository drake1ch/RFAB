Scriptname FestivalEndScript extends ObjectReference


Quest Property MS05KingOlafsFestival Auto
Int Property Stage = 200 Auto
float property minBreakdownTimer = 15.0 auto
GlobalVariable Property GameHour Auto

Int Function GetDayOfWeek()
	Int GameDaysPassed
 
	GameDaysPassed = Utility.GetCurrentGameTime() as Int
	return (GameDaysPassed % 7) as Int
EndFunction

Auto State Waiting
EndState

State Listening
	Event onBeginState()
		unRegisterForUpdate()
		registerForSingleUpdate(minBreakdownTimer)
	endEvent
	
	Event onCellAttach()
		unRegisterForUpdate()
	endEvent
	
	Event onCellDetach()
		registerForSingleUpdate(minBreakdownTimer)
	endEvent
Endstate

State Done
EndState

Event onUpdate()
	;if !self.getParentCell().isAttached()
	;USKP 2.0.1 - Changed to use Is3DLoaded since GetParentCell will always return none when not attached.
	if( !Is3DLoaded() )
		Float CurrentHour = GameHour.GetValue()
		
		if ((GetDayOfWeek() == 6) && (CurrentHour >= 20.00)) || ((GetDayOfWeek() == 0) && (CurrentHour < 4.00))
			registerForSingleUpdate(minBreakdownTimer)
		Else
			GotoState("Done")
			MS05KingOlafsFestival.Setstage(Stage)
			unRegisterForUpdate()
		EndIf
	else
		registerForSingleUpdate(minBreakdownTimer)
	endIf
endEvent