scriptName defaultSetStageOnDeathRefAlias extends referenceAlias
{Set stage on specificed quest when this actor dies.  Pre-Requistite stage optional}

quest property myQST auto
{quest to set stage upon}
int property preReqStage = -1 auto
{(Optional)Stage that must be set for this script to run. Default: NONE}
int property StageToSet auto
{Set this stage when the actor dies}

auto STATE waiting
	EVENT onDeath(actor killer)
		;USKP 2.0.5 - Added check to make sure quest is running if preReq is not -1. Best we can do here to reduce errors without breaking full functionality.
		if( preReqStage == -1 || ( (myQST.GetStageDone(preReqStage) == True) && myQST.IsRunning() ) )
			myQST.setStage(stageToSet)
			gotoState("inactive")
		elseif preReqStage != -1 && myQST.getStageDone(preReqStage) == FALSE
; 			debug.trace(self + " was killed before stage " + preReqStage + " of " + myQST + " was set")
		else
; 			debug.trace(self + " got defaultSetSTageonDeath script into a bad state!")
		endif
	endEVENT
endSTATE

STATE inactive
endSTATE

