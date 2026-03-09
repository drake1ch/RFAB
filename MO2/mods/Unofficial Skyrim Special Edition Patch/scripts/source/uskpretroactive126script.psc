Scriptname USKPRetroactive126Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive127Script Property Retro127 Auto

ReferenceAlias Property Niranye Auto
ReferenceAlias Property Arivanya Auto
Faction Property WindhelmCandlehearthPatrons Auto
Faction Property WindhelmCornerclubPatrons Auto

Quest Property DA14 Auto
ReferenceAlias Property Ysolda Auto
ReferenceAlias Property Ennis Auto

Quest Property MS05Rumor Auto

Quest Property CR05 Auto
CR05QuestScript Property CR05Script Auto
ReferenceAlias Property CR05Target Auto

Quest Property CR08 Auto
ReferenceAlias Property CR08Victim Auto
ReferenceAlias Property CR08VictimMarker Auto

CR02QuestScript Property CR02 Auto
ReferenceAlias Property CR02Target Auto

Quest Property DB11 Auto
ReferenceAlias Property DB11PenitusDocksSoldier Auto

ReferenceAlias Property Tonilla Auto
Faction Property JobMiscFaction Auto

Quest Property FreeformRiften11 Auto
ReferenceAlias Property USKPMarksContainer Auto
ReferenceAlias Property FFRiften11MarkAlias01 Auto
ReferenceAlias Property FFRiften11MarkAlias02 Auto
ReferenceAlias Property FFRiften11MarkAlias03 Auto
ObjectReference Property USKPMarksContainerRef Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.2.6 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 126
		Retro127.Process()
		Stop()
		Return
	EndIf
	
	;Bugzilla #8349 - Niranye is in the wrong set of tavern patron factions. Arivanya is missing one.
	Niranye.TryToRemoveFromFaction(WindhelmCandlehearthPatrons)
	Niranye.TryToAddToFaction(WindhelmCornerclubPatrons)
	Arivanya.TryToAddToFaction(WindhelmCornerclubPatrons)

	;Bugzilla #8286 - Ysolda and Ennis could have been killed prior to Patch 1.5 making them essential.
	if( DA14.GetStage() < 5 )
		if( Ysolda.GetActorReference().IsDead() )
			Ysolda.GetActorReference().Resurrect()
			Ysolda.TryToEnable()
		EndIf
		
		if( Ennis.GetActorReference().IsDead() )
			Ennis.GetActorReference().Resurrect()
			Ennis.TryToEnable()
		EndIf
	EndIf
	
	;MS05Rumor is never stopped when completed.
	if( MS05Rumor.GetStage() >= 20 )
		MS05Rumor.Stop()
	EndIf
	
	;Bugzilla #275 - Fix for Trouble in Skyrim having selected a dead target. (Relocated from the 1.2 retro-script for a redo here.)
	if( CR05.IsRunning() )
		if( CR05Target.GetActorReference().IsDead() )
			if( CR05.GetStage() < 10 )
				CR05Script.PrematureShutdown()
			Else
				CR05.SetStage(20)
			EndIf
		EndIf
	EndIf

	;Bugzilla #8501 - Companions quests run from game start. Moving retro-fix for CR08 from USKP 1.1 to here for a redo under proper conditions.
	if( CR08.IsRunning() )
		if( CR08.GetStage() < 10 )
			if( CR08Victim.GetActorReference().IsDead() )
				CR08.SetStage(200)
			EndIf
		else
			if( CR08Victim.GetActorReference().IsDead() )
				CR08Victim.GetActorReference().Resurrect()
				CR08Victim.TryToEnable()
				CR08Victim.TryToMoveTo(CR08VictimMarker.GetReference())
			EndIf
		EndIf
	EndIf

	;Bugzilla #8501 - Companions quests run from game start. CR02 needs to be recycled properly if the target dies before the player has the chance to kill it themselves.
	if( CR02.IsRunning() )
		if( CR02.GetStage() < 10 )
			if( CR02Target.GetActorReference().IsDead() )
				CR02.PrematureShutdown()
			EndIf
		EndIf
	EndIf
	
	;Bugzilla #8553 - More instances of Penitus Oculatus not disabling
	if( DB11.GetStage() >= 200 )
		DB11PenitusDocksSoldier.TryToDisable()
	EndIf
	
	;Bugzilla #178 - Tonilla sometimes shows "What do you have for sale" instead of the fencing option.
	Tonilla.TryToRemoveFromFaction(JobMiscFaction)
	
	;Bugzilla #913 - Caught Red Handed triggers silently if the player pickpocketed a Mark of Dibella from one of the NPCs. We need to give them the objectives now.
	if( FreeformRiften11.Getstage() >= 30 && FreeformRiften11.GetStage() < 60 )
		if( FreeformRiften11.GetStageDone(20) == 0 )
			if( FreeformRiften11.GetStageDone(30) == 0 )
				FreeformRiften11.SetObjectiveDisplayed(10)
			EndIf
			
			if( FreeformRiften11.GetStageDone(40) == 0 )
				FreeformRiften11.SetObjectiveDisplayed(20)
			EndIf
			
			if( FreeformRiften11.GetStageDone(50) == 0 )
				FreeformRiften11.SetObjectiveDisplayed(30)
			EndIf
		EndIf
	elseif( FreeformRiften11.GetStage() < 20 )
		USKPMarksContainer.ForceRefTo(USKPMarksContainerRef)
		USKPMarksContainerRef.AddItem(FFRiften11MarkAlias01.GetReference())
		USKPMarksContainerRef.AddItem(FFRiften11MarkAlias02.GetReference())
		USKPMarksContainerRef.AddItem(FFRiften11MarkAlias03.GetReference())
	EndIf
	
	debug.trace( "USKP 1.2.6 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 126
	Retro127.Process()
	Stop()
EndFunction
