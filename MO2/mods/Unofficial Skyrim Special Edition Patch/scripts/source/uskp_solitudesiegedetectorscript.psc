Scriptname USKP_SolitudeSiegeDetectorScript extends ObjectReference  

ObjectReference Property SolitudeGateExterior Auto
Quest Property SolitudeOpening Auto
ReferenceAlias Property Roggvir Auto
Keyword Property CWSiegeRunning Auto
Location Property SolitudeLocation Auto

Event OnTriggerEnter( ObjectReference akActor )
	if( akActor == Game.GetPlayer() )
		;If the gate is enabled, kill the trigger. Nothing more needs to be done.
		if( SolitudeGateExterior.IsEnabled() )
			self.Disable()
			self.Delete()
		;Gate isn't enabled. That means the player has never been to the city before. Best get some shit cleaned up if the siege is running.
		Else
			if( SolitudeLocation.GetKeywordData(CWSiegeRunning) == 1 )
				;Deal with Roggvir's execution.
				Roggvir.TryToKill()
				SolitudeOpening.SetStage(30)
				SolitudeOpening.SetStage(190)

				self.Disable()
				self.Delete()
			EndIf
		EndIf
	EndIf
EndEvent
