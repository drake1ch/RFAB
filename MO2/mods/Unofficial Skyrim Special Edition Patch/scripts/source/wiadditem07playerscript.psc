Scriptname WIAddItem07PlayerScript extends ReferenceAlias  

;FILTERED BY AddInventoryEventFilter() in WIAdditem07Script's OnStoryAddToPlayer() event

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
; 	debug.trace(self + "OnItemAdded")

	;USSEP 4.1.7 Bug #25816
	if( (GetOwningQuest() as WIAddItem07Script).ItemBase != None )
		(GetOwningQuest() as WIAddItem07Script).setItemCount()
	endif
	
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
; 	debug.trace(self + "OnItemRemoved")

	;USSEP 4.1.7 Bug #25816
	if( (GetOwningQuest() as WIAddItem07Script).ItemBase != None )
		(GetOwningQuest() as WIAddItem07Script).setItemCount()
	endif

EndEvent

