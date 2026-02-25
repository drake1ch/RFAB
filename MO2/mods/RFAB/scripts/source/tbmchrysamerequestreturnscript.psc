Scriptname tbmChrysamereQuestReturnScript extends ReferenceAlias
{Sets quest to finished once player returns to Solitude.}

Event OnActivate(ObjectReference akActionRef)
	If (GetOwningQuest().GetStage() >= 60)
		GetOwningQuest().SetStage(100)
	EndIf
EndEvent
