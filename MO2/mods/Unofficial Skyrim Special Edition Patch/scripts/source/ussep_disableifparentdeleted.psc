Scriptname USSEP_DisableIfParentDeleted extends ObjectReference  
{Disables an object if it's associated with a parent that can be deleted, such as a corpse. Added in USSEP 4.1.7 for Bug #25741.}

Event OnLoad()
	if( GetLinkedRef().IsDeleted() )
		Self.Disable()
	endif
EndEvent
