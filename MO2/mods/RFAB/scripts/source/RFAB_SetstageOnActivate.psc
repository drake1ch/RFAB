Scriptname RFAB_SetstageOnActivate extends ObjectReference  

Quest property myquest auto

int property stage auto

Event OnActivate(ObjectReference akActionRef)
	if myquest.GetStageDone(stage1) == 1	
		myquest.setstage(stage)
	endif
endevent
Int Property stage1  Auto  
