Scriptname USKP_MistwatchEscapeeAliasScript extends ReferenceAlias  

Event OnUnload()
	if( GetOwningQuest().Getstage() >= 100 )
		GetOwningQuest().SetStage(255)
	EndIf
EndEvent
