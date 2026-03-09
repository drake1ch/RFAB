Scriptname USKP_JdtharrAliasScript extends ReferenceAlias  

Event OnDeath( Actor Killer )
	GetOwningQuest().SetStage(100)
EndEvent
