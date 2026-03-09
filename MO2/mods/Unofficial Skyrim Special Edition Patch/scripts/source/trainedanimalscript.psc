ScriptName TrainedAnimalScript extends ReferenceAlias

DialogueFollowerScript Property DialogueFollower Auto

Event OnUpdateGameTime()

	;kill the update if the follower isn't waiting anymore
	;USKP 2.0.4 - Check added for an empty alias, which shouldn't happen, but apparently does.
	;Improved version - this top check? If it fails, shit's broke and the alias is empty so the DismissAnimal() call can't run anyway.
	if( Self.GetActorReference() )
		If Self.GetActorReference().GetAv("WaitingforPlayer") == 0
			UnRegisterForUpdateGameTime()
		Else
			DialogueFollower.DismissAnimal()
			UnRegisterForUpdateGameTime()
		EndIf
	EndIf	
EndEvent

Event OnUnload()

	;if follower unloads while waiting for the player, wait three days then dismiss him.
	If Self.GetActorReference().GetAv("WaitingforPlayer") == 1
		(GetOwningQuest() as DialogueFollowerScript).AnimalWait()
	EndIf

EndEvent

Event OnDeath(Actor akKiller)

	PlayerAnimalCount.SetValue(0)
	Self.Clear()
	
EndEvent
GlobalVariable Property PlayerAnimalCount  Auto  
