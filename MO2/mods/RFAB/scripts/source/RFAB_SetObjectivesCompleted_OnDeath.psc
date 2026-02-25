Scriptname RFAB_SetObjectivesCompleted_OnDeath extends ReferenceAlias  

Quest Property MyQuest Auto

int[] Property Objectives Auto

Event OnDeath(Actor akKiller)
    int i = 0
    while i < Objectives.Length
    	MyQuest.SetObjectiveCompleted(Objectives[i])
    	i += 1
    endwhile
EndEvent