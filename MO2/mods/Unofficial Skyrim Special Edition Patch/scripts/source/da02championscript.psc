Scriptname DA02ChampionScript extends ReferenceAlias  
{Script on DA02 Champion alias}


;THIS NOW HAPPENS IN MonitorAliveCountAliasScript BECAUSE I'M CHECKING TO MAKE SURE EVERYONE AT THE CAMP IS DEAD

;Event OnDeath(Actor akKiller)
;
;	GetOwningQuest().setstage(30)	
;
;EndEvent

;USKP 2.05 - We're taking over then to clear the location when this dude dies since you guys gave him a different LocTypeRef
Location Property KnifepointRidgeLocation Auto

Event OnDeath( Actor akKiller )
	KnifepointRidgeLocation.SetCleared()
EndEvent
