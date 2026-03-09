Scriptname DA02PillarScript extends ObjectReference  

DA02Script Property DA02 Auto

Event OnLoad()
	BlockActivation()	

EndEvent

Event OnActivate(ObjectReference akActionRef)

	Actor ActorRef = akActionRef as Actor
	
	if ActorRef == Game.GetPlayer() 
		;do nothing
		
	else
		;USKP 2.0.4 - Offering a follower up prior to the appropriate time can jam the quest.
		if( DA02.GetStage() >= 10 )
			DA02.PillarTrap(akActionRef)
		EndIf
	EndIf
EndEvent
