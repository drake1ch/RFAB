Scriptname defaultSetStageOnPlayerAcquire extends ReferenceAlias  
{Sets a quest stage when this item is put in the player's inventory.}

Quest Property myQST auto
{Quest upon which to set stage. Default is the Alias's owning quest.}
int Property preReqStage = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}
int Property StageToSet auto
{Set this stage when the player picks up this item.}
	
auto State waiting	
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if (Game.GetPlayer() == akNewContainer)
			Quest qst = myQST
			if (qst == None)
				qst = GetOwningQuest()
			endif
			;USKP 2.0.5 - Added check to make sure quest is running if preReq is not -1. Best we can do here to reduce errors without breaking full functionality.
			if ( (preReqStage == -1) || ( (qst.GetStageDone(preReqStage) == True) && qst.IsRunning() ) )
				qst.SetStage(stageToSet)
				GoToState("inactive")
			endif
		endif
	EndEvent
EndState

State inactive
EndState
