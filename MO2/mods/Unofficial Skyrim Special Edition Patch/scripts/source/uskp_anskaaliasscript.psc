Scriptname USKP_AnskaAliasScript extends ReferenceAlias  

Event OnDeath( Actor akKiller )
	if( GetOwningQuest().GetStageDone(100) == 0 )
		GetOwningQuest().SetStage(150)
	EndIf
EndEvent
