Scriptname tbmChryamereQuestTriggerScript extends ReferenceAlias  
{Triggers the next quest stage when the player has entered.}

Quest Property tbmChrysamereQuest Auto
Int Property nextStage Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		tbmChrysamereQuest.SetStage(nextStage)
		GetRef().Disable()
	EndIf
EndEvent