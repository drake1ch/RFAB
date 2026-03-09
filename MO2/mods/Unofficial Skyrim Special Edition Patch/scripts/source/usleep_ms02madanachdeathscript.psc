Scriptname USLEEP_MS02MadanachDeathScript extends ReferenceAlias  

Event OnDeath( Actor Killer )
	GetOwningQuest().Stop()
EndEvent
