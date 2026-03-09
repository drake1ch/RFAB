Scriptname USKP_WEJS13AliasScript extends ReferenceAlias  

Location Property WhiterunLocation Auto

Event OnUnload()
	if( GetActorReference().IsInLocation(WhiterunLocation) && !Game.GetPlayer().IsInLocation(WhiterunLocation) )
		GetOwningQuest().SetStage(255)
	EndIf
EndEvent
