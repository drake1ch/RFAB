Scriptname tbmChrysamereQuestSwordScript extends ReferenceAlias  
{Advances quest when chrysamere is picked up.}

Event OnActivate(ObjectReference akActionRef)
	GetOwningQuest().SetStage(50)
EndEvent
