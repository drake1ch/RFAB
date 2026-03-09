ScriptName UDBP_AncarionAliasScript Extends ReferenceAlias

;UDBP 2.0.8 Bug #17943 - Killing Ancarion never fails the objective or terminates the quest.
Event OnDeath(Actor akKiller)
	if( GetOwningQuest().GetStage() == 10 )
		GetOwningQuest().SetObjectiveFailed(10)
		GetOwningQuest().Stop()
	EndIf
EndEvent
