Scriptname RFAB_AmbushScript extends ObjectReference  

objectReference property victim auto

objectReference[] Property Marker  Auto  

Actor[] Property Attacker  Auto  

Event OnActivate(ObjectReference akActionRef)

int i=0
while i<attacker.length

	attacker[i].enablenowait()
	attacker[i].moveto(Marker[i])

	attacker[i].startCombat(victim as actor)
	attacker[i].setActorValue("aggression", 2)

	i=i+1

endwhile
	
endevent




