Scriptname tbmChrysamereKeyActScript extends ObjectReference  

Quest Property tbmChrysamereQuest Auto

Event OnActivate(ObjectReference akActionRef)
	if (!tbmChrysamereQuest.IsRunning() && !tbmChrysamereQuest.IsCompleted())
		tbmChrysamereQuest.Start()
	EndIf
	self.disable()
EndEvent
