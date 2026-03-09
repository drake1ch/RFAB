Scriptname USKPRetroactive209Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive210Script Property Retro210 Auto

Quest Property MG04 Auto
Quest Property MG06 Auto
ReferenceAlias Property Sergius Auto

ReferenceAlias Property Zaria Auto
Faction Property CrimeFactionFalkreath Auto

ReferenceAlias Property Urzoga Auto
ReferenceAlias Property PrisonerBorkul Auto
ReferenceAlias Property PrisonerDuach Auto
ReferenceAlias Property PrisonerGrisvar Auto
ReferenceAlias Property PrisonerMadanach Auto
ReferenceAlias Property PrisonerOdvan Auto
ReferenceAlias Property PrisonerUraccen Auto
ReferenceAlias Property PrisonerBlathloc Auto

Quest Property TGCrown Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.9 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 209
		Retro210.Process()
		Stop()
		Return
	EndIf

	;Bug #18563 - MG06 does not start if Sergius is dead.
	if( MG04.GetStage() >= 200 )
		if( MG06.GetStage() == 0 )
			if( Sergius.GetActorReference().IsDead() )
				MG06.Start()
			EndIf
		EndIf
	EndIf

	;Bug #18302 - Zaria is not in Falkreath's crime Faction
	Zaria.GetActorReference().SetCrimeFaction(CrimeFactionFalkreath)

	;Bug #17184 - MS02 prisoner corpses never clear because they're held in aliases.
	if( Urzoga.GetActorReference().IsDead() )
		Urzoga.Clear()
	EndIf

	if( PrisonerBorkul.GetActorReference().IsDead() )
		PrisonerBorkul.Clear()
	EndIf

	if( PrisonerDuach.GetActorReference().IsDead() )
		PrisonerDuach.Clear()
	EndIf

	if( PrisonerGrisvar.GetActorReference().IsDead() )
		PrisonerGrisvar.Clear()
	EndIf

	if( PrisonerMadanach.GetActorReference().IsDead() )
		PrisonerMadanach.Clear()
	EndIf

	if( PrisonerOdvan.GetActorReference().IsDead() )
		PrisonerOdvan.Clear()
	EndIf

	if( PrisonerUraccen.GetActorReference().IsDead() )
		PrisonerUraccen.Clear()
	EndIf

	if( PrisonerBlathloc.GetActorReference().IsDead() )
		PrisonerBlathloc.Clear()
	EndIf

	;Bug #18635 - TGCrown objective 5 never cleared.
	if( TGCrown.GetStageDone(20) == 1 )
		TGCrown.SetObjectiveCompleted(5,1)
	EndIf

	debug.trace( "USKP 2.0.9 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 209
	Retro210.Process()
	Stop()
EndFunction
