Scriptname USKP_DA09LightBeamsStopper extends ObjectReference  

Quest Property DA09 Auto
ObjectReference Property Crystal Auto

Event OnLoad()
	if( !DA09.IsRunning() && DA09.GetStageDone(500) == 1 )
		Crystal.Activate(self)
	EndIf
	self.disable()
	self.delete()
EndEvent
