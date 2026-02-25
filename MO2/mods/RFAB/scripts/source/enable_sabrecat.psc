Scriptname enable_sabrecat extends ObjectReference  

Actor Property Property1  Auto  

Actor Property Property2  Auto  

Event OnActivate(ObjectReference akActionRef)

property1.addtofaction(Bandit_Faction)
property2.addtofaction(Bandit_Faction)

property1.enablenowait()
property2.enablenowait()

property1.moveto(spawn_marker)
property2.moveto(spawn_marker)

	Kletka.lock(false)

		
property1.startCombat(victim as actor)
			property1.setActorValue("aggression", 2)
property2.startCombat(victim as actor)
			property2.setActorValue("aggression", 2)

endevent
ObjectReference Property spawn_marker  Auto  

Faction Property Bandit_faction  Auto  


Actor Property Victim  Auto  

ObjectReference Property Kletka  Auto  
