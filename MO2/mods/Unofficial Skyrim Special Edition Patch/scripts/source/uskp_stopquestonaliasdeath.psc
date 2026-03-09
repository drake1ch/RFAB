Scriptname USKP_StopQuestOnAliasDeath extends ReferenceAlias  

Event OnDeath( Actor akKiller )
	GetOwningQuest().Stop()
EndEvent
