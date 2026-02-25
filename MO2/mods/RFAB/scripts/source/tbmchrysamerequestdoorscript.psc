Scriptname tbmChrysamereQuestDoorScript extends ReferenceAlias  
{Runs on the reliquary door to advance the quest.}

Event OnLockStateChanged()
	if (!GetRef().IsLocked())
		GetOwningQuest().SetStage(10)
	endif
EndEvent