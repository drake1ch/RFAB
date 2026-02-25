Scriptname QuestMapScript extends ObjectReference  

Event oncontainerchanged (objectreference newcontainer, objectreference oldcontainer)

if (newcontainer == game.getplayer())
	if newproperty.GetStageDone(10) == 1
		newproperty.setobjectivedisplayed(30)
		NewProperty.setstage(30)
	endif
endif
endevent
Quest Property NewProperty  Auto  

