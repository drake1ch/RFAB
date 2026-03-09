Scriptname USKP_AngiDeathAliasScript extends ReferenceAlias  
{USKP: If Angi is killed, her archery quest has no reason to keep running.}

Event OnDeath( Actor akKiller )
	GetOwningQuest().Stop()
EndEvent
