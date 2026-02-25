Scriptname RFAB_Script_GetStageOnDeath extends ObjectReference  

Actor Property Talen  Auto  

Quest Property NewProperty1  Auto  

Event OnDeath(Actor Talen)

	if newproperty1.GetStageDone(10) == 1
		newproperty1.setobjectivedisplayed(21)
		newproperty1.setstage(21)
	endif

endevent