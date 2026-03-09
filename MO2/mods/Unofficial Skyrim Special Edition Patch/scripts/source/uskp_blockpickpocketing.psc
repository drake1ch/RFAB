Scriptname USKP_BlockPickpocketing extends Actor  

Message Property MQ101PickpocketMessage Auto

Event OnActivate(ObjectReference akActionRef)
	If( akActionRef == Game.GetPlayer() )
		if( Game.GetPlayer().IsSneaking() )
			MQ101PickpocketMessage.Show()
		Else
			Self.Activate( Game.GetPlayer(), abDefaultProcessingOnly = true )
		EndIf
	EndIf
EndEvent
