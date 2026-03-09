scriptname dunFellglow_PrisonerSceneTrigger extends objectReference
{When a member of the prisoner faction enters the trigger, start the scene.}

Faction property prisonerFaction Auto
Scene property prisonerScene Auto

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		;USKP 2.0.2 - Needed proper cast checking since this trigger could possibly have objects kicked through it as well.
		if( triggerRef as Actor )
			Actor ActorRef = triggerRef as Actor
			if( ActorRef.IsInFaction(prisonerFaction) )
				prisonerScene.Start()
				GoToState("allDone")
			EndIf
		EndIf
	EndEvent
EndState

State allDone
	;do nothing
endState