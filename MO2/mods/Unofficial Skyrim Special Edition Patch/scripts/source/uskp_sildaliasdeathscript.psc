Scriptname USKP_SildAliasDeathScript extends ReferenceAlias  

;When Sild dies, this quest should be stopped so the corpses and stuff will eventually be culled.
Event OnDeath( Actor akKiller )
	GetOwningQuest().Stop()
EndEvent
