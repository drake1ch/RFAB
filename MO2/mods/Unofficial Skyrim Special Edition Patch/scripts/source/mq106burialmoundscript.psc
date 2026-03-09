Scriptname MQ106BurialMoundScript extends ObjectReference  
{track if player has visited burial mound prior to MQ106}

auto state waiting
	Event OnLoad()
		RegisterForUpdate(5)
	endEvent

	Event OnUpdate()
		if MQ106PlayerVisitsDragonMound.GetValueInt() == 0
; 			debug.trace(self + " player location=" +  Game.GetPlayer().GetCurrentLocation() + ", dragon mound location=" + self.GetCurrentLocation())
			;USKP 2.0.1 - Single purpose script. Just check if player is in the right location instead.
			if( Game.GetPlayer().GetCurrentLocation() == KynesgroveBurialMoundLocation )
				gotoState("done")
				UnregisterForUpdate()
; 				debug.trace(self + " player visits dragon burial mound")
				MQ106PlayerVisitsDragonMound.SetValue(1)
			endif
		endif
	endEvent

endState

state done
	; all done
endState

Event OnUnload()
	UnregisterForUpdate()
endEvent


GlobalVariable Property MQ106PlayerVisitsDragonMound  Auto  
Location Property KynesgroveBurialMoundLocation Auto 