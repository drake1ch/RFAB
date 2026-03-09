ScriptName USLEEP_DisableLinkedRefOnActivation Extends ObjectReference
{Used to disable an object linked to this one. Usually for navmesh cutters that had to be added.}

Event OnActivate( ObjectReference akActor )
	GetLinkedRef().Disable()
EndEvent
