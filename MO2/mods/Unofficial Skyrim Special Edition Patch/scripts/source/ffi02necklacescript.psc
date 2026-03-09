Scriptname FFI02NecklaceScript extends ReferenceAlias  Conditional

Quest Property pFFI02Quest Auto Conditional

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if( pFFI02Quest.GetStage() == 20 || pFFI02Quest.GetStage() == 30 ) ;USKP 1.3.2 - Added additional check for stage 20 pickup.
			pFFI02Quest.SetStage(40)
		endif
	endif

endEvent
