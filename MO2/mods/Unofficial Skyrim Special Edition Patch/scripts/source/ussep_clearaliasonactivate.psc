Scriptname USSEP_ClearAliasOnActivate extends ReferenceAlias  

Event OnActivate( ObjectReference akActor )
	if( akActor == Game.GetPlayer() )
		Self.Clear()
	endif
EndEvent
