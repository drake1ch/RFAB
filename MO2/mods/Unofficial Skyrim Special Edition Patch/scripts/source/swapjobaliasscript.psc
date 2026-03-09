Scriptname SwapJobAliasScript extends ReferenceAlias  
{Put this on "job" aliases (Jarl, Innkeeper, etc.) who might change out from under you while your quest is running

if this happens, get again from the MasterJobAlias -- normally an alias from the dialogue quest

NOTE: You need to call RegisterForUpdate on these aliases from somewhere else when you want to start watching
}

ReferenceAlias Property MasterJobAlias Auto  
{master job alias on DialogueXXX quest}

Faction Property JobFaction Auto
{Job faction that we're watching for}

int Property ObjectiveToRedisplay = -1 Auto
{Optional: If we swap, redisplay this objective - useful if the objective displays the name of the actor in the alias}

;USKP 2.0.3 - This script is wildly inefficient at what it does, and when mods utilizing it get removed from the game it sends itself into endless spam loops.
;Caveat - If a mod that used these is already gone the references will be NULL and there's nothing that can be done about that.
bool ResetUpdates = False
bool IsValidReference = False

event OnUpdate()
	;First - Let's change the update type. Eternal updates = bad.
	if( ResetUpdates == False )
		ResetUpdates = True
		UnregisterForUpdate()
		Utility.Wait(1)
	EndIf
	
	;Next, assume any incoming reference to be invalid, just in case an alias is cleared somewhere.
	IsValidReference = False
	
	;Validate that the reference is good.
	if( GetReference() )
		;It's good, so now we can process the remainder of this test.
		IsValidReference = True
		
		if GetActorReference().IsInFaction(JobFaction) == 0
			; get the alias again from the master alias
			Actor currentActor = MasterJobAlias.GetActorReference()
			;debug.trace(self + " switching to " + currentActor)
			ForceRefTo(currentActor)

			quest myQuest = GetOwningQuest()

			if ObjectiveToRedisplay >= 0 &&  myQuest.IsObjectiveDisplayed(ObjectiveToRedisplay) && myQuest.IsObjectiveCompleted(ObjectiveToRedisplay) == False
				myQuest.SetObjectiveDisplayed(ObjectiveToRedisplay, abForce = True)
			EndIf
		EndIf
	endif	

	;If the reference was valid, reregister for another update to check. Otherwise this is the last time this will get called for this alias.
	if( IsValidReference == True )
		RegisterForSingleUpdate(5)
	EndIf
endEvent
