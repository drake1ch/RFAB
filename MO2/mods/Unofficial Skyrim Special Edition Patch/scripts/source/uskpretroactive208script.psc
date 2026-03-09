Scriptname USKPRetroactive208Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive209Script Property Retro209 Auto

ReferenceAlias Property Adventurer Auto
Faction Property CrimeFactionReach Auto

Quest Property dunLostValleyRedoubtQST Auto
ReferenceAlias Property Hagraven1 Auto
ReferenceAlias Property Hagraven2 Auto

Quest Property DA05 Auto
ReferenceAlias Property Sinding Auto

Quest Property USLEEPDA06EssentialSlotForGularzob Auto
Quest Property DA06 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.8 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 208
		Retro209.Process()
		Stop()
		Return
	EndIf

	;Bug #18124 - Adventurer has no crime faction and talks to werewolves etc
	Adventurer.TryToAddToFaction(CrimeFactionReach)

	;Bug #17671 - Hagraven bodies never clean up if killed too quickly.
	if( dunLostValleyRedoubtQST.IsRunning() )
		if( Hagraven1.GetActorReference().IsDead() && Hagraven2.GetActorReference().IsDead() )
			dunLostValleyRedoubtQST.SetStage(100)
		EndIf
	EndIf

	;Bug 18175 - DA05 still not shutting down properly. Plus Sinding may still be enabled.
	if( DA05.IsRunning() )
		if( DA05.GetStageDone(100) == 1 && DA05.GetStage() == 200 )
			Sinding.GetReference().Disable()
			DA05.Stop()
		EndIf
	EndIf

	;Bug #17701 - Protection quest for Gularzob needs to stop if DA06 is already processed.
	if( DA06.GetStage() > 0 || ( DA06.GetStage() == 0 && DA06.IsRunning() ) )
		USLEEPDA06EssentialSlotForGularzob.Stop()
	EndIf

	debug.trace( "USKP 2.0.8 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 208
	Retro209.Process()
	Stop()
EndFunction
