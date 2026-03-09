Scriptname DLC01WESC04Script extends ObjectReference  
{When the player moves in range, the Vampiric Assassin teleports in.}

Quest property DLC01WESC04 Auto
ReferenceAlias property SceneCenterMarker Auto
ReferenceAlias property Vampire Auto
bool unloaded = False ; UDGP 2.0.1 - Added to prevent the OnUnload and OnCellDetach events from both attempting to set the quest stage.

Event OnLoad()
	While (DLC01WESC04.GetStage() == 0)
		if (SceneCenterMarker.GetReference().GetDistance(Game.GetPlayer()) > 1000)
			Utility.Wait(1)
		Else
			Vampire.GetActorRef().Activate(Self)
			DLC01WESC04.SetStage(10)
		EndIf
	EndWhile
EndEvent

Event OnUnload()
	if( !unloaded )
		CheckUnload()
	EndIf
EndEvent

Event OnCellDetach()
	if( !unloaded )
		CheckUnload()
	EndIf
EndEvent

Function CheckUnload()
	;Let the quest know we've unloaded.
	unloaded = True
	DLC01WESC04.SetStage(110)
EndFunction