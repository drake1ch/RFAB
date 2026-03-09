Scriptname dunMistwatchChristerScript extends ReferenceAlias   
import Debug

quest Property myQuest auto
Faction Property FjolaFaction auto


Event OnDeath(Actor akKiller)
	myQuest.setstage(90) ;USKP 2.0.5 - Used to be setting stage 85, but that's the stage that starts this fight.
	if (myQuest.isStageDone(75) == 1)
		myquest.setstage(100)
	endif
	if (myQuest.isStageDone(70) == 0)
		;Notification("Fjola Gets Mad")
		FjolaFaction.setPlayerEnemy()
	endif
endEvent
