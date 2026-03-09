Scriptname DA09StatueTriggerScript extends ReferenceAlias  

Scene Property DA09StatueSceneA Auto
Scene Property DA09StatueSceneB Auto
ReferenceAlias Property xMarkerVoice Auto
ReferenceAlias Property Gem Auto
Scene Property DA09ExteriorTempleScene Auto ; USKP 2.1.1 Bug #18711

Event OnTriggerEnter(ObjectReference akActionRef)

	Quest DA09 = GetOwningQuest()

	ObjectReference playerRef = Game.GetPlayer()

	;USKP 2.1.1 Bug #18711 - Need to delay playback of the statue scene in case the main intro scene is still running.
	While( DA09ExteriorTempleScene.IsPlaying() )
		Utility.Wait(0.5)
	EndWhile

	if akActionRef == playerRef && DA09.GetStage() < 100 && DA09.GetStageDone(50) == false
		xMarkerVoice.GetReference().MoveTo(playerRef)
		DA09StatueSceneB.Start()
		
	elseif akActionRef == playerRef && DA09.GetStage() == 100 && PlayerRef.GetItemCount(Gem.GetReference().GetBaseObject()) > 0
		xMarkerVoice.GetReference().MoveTo(playerRef)
		DA09StatueSceneA.Start()
		
	EndIf

EndEvent
