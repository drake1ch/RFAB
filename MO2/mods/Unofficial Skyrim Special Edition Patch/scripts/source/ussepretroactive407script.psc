Scriptname USSEPRetroactive407Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive408Script Property Retro408 Auto

pDBEntranceQuestScript Property DBScript Auto

Quest Property MG03 Auto
ReferenceAlias Property MG03Trigger Auto
ObjectReference Property PlayerRef Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.0.7 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 407
		Retro408.Process()
		Stop()
		Return
	EndIf

	;Bug #15052 - Aventus Aretino moves out of Windhelm.
	if( DBScript.GetStageDone(20) == 1 )
		DBScript.MoveAventusOut()
	endif

	;Bug #20741 - MG30Endscene never runs
	defaultStartSceneTrigScript MG03TriggerRef = ( MG03Trigger.GetReference() as defaultStartSceneTrigScript )

	MG03TriggerRef.PrereqQuest = MG03
	MG03TriggerRef.prereqStage = 60
	MG03TriggerRef.triggerActor = PlayerRef

	debug.trace( "USSEP 4.0.7 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 407
	Retro408.Process()
	Stop()
EndFunction
