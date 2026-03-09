Scriptname MS11SecretDoorActivatorScript extends ObjectReference  


ReferenceAlias Property Viola auto
Scene Property ViolaYak auto
Quest Property MS11 Auto
bool __ViolaYakked = false

Event OnActivate(ObjectReference akActivator)
	if( MS11.IsRunning() )
		if (akActivator == Game.GetPlayer() && Viola.GetReference().GetDistance(Game.GetPlayer()) < 500)
			if (!__ViolaYakked)
				ViolaYak.Start()
				__ViolaYakked = true
			endif
		endif
	EndIf
EndEvent
