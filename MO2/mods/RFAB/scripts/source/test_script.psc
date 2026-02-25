Scriptname test_script extends ObjectReference  

objectReference property victim auto

Event OnActivate(ObjectReference akActionRef)


			attacker.startCombat(victim as actor)
			attacker.setActorValue("aggression", 2)
	
	endevent



Actor Property actronaut  Auto  

Actor Property Attacker  Auto  
