Scriptname dunAngarvundeMedresiScript extends ReferenceAlias  

import Debug

Quest Property myQuest Auto

ObjectReference Property TrapStarter  Auto  
ReferenceAlias Property DungeonKey Auto ; USSEP 4.1.5 Bug #24797

Event OnDeath(Actor akKiller)
	;notification("Medresi Dead")
	Self.GetReference().AddItem(DungeonKey.GetReference()) ; USSEP 4.1.5 Bug #24797
	TrapStarter.activate(TrapStarter,false)
	myQuest.setStage(100)
endEvent

