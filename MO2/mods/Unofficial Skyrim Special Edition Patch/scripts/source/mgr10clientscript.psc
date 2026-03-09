Scriptname MGR10ClientScript extends ReferenceAlias  


Event OnDeath(Actor Killer)

	;USKP 2.0.7 - It's possible for the client to die prior to actually receiving the quest, which will stall it.
	if( GetOwningQuest().GetStage() <= 10 )
		if GetOwningQuest().GetStage() == 10
			GetOwningQuest().SetStage(255)
		else
			GetOwningQuest().SetStage(300)
		EndIf
	EndIf
EndEvent 