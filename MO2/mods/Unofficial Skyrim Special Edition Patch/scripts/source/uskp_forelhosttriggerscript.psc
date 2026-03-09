Scriptname USKP_ForelhostTriggerScript extends ObjectReference  
{USKP 1.3.3 - Don't start the dunForelhostQST conversation scene until the player is on the ground near Valmir.}

Quest Property GrifterQuest Auto
Scene Property GrifterTurnScene Auto

Event OnTriggerEnter( ObjectReference akActor )
	if( akActor == Game.GetPlayer() )
		if( GrifterQuest.GetStage() == 60 )
			GrifterTurnScene.Start()
			self.disable()
			self.DeleteWhenAble()
		EndIf
	EndIf
EndEvent
