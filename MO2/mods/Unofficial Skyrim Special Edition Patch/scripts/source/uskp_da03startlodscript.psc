Scriptname USKP_DA03StartLodScript extends ReferenceAlias  

Event OnDeath( Actor akKiller )
	if( GetOwningQuest().GetStage() == 5 )
		GetOwningQuest().SetObjectiveFailed(5)
		GetOwningQuest().SetStage(200)
	EndIf
EndEvent
