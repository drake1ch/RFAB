scriptName dunDeadMensRespiteResealDoorOnLoad extends ObjectReference
{ On load, calls the Reseal() function on the object's linkedref. }

Quest property MS05_dunDeadMensRespiteQST Auto
ReferenceAlias property SealedDoorRef Auto

Event OnLoad()
	Utility.Wait(0.25)
	(SealedDoorRef as dunDeadMensRespiteSealedDoor).SetupSealedDoor()
EndEvent

;Failsafe for reset condition.
Event OnReset()
	;USKP 2.0.4 - Don't bother checking this if the quest isn't running anymore.
	if( MS05_dunDeadMensRespiteQST.IsRunning() )
		if (MS05_dunDeadMensRespiteQST.GetStageDone(130))
			MS05_dunDeadMensRespiteQST.SetStage(255)
		EndIf
	EndIf
EndEvent