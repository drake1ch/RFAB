Scriptname USKP_WE31AliasScript extends ReferenceAlias  
{USKP 2.0.5 - If this mage is killed, the quest should no longer spawn.}

GlobalVariable Property USLEEPWE31Completed Auto

Event OnDeath( Actor akKiller )
	USLEEPWE31Completed.SetValueInt(1)
	GetOwningQuest().SetStage(255)
EndEvent
