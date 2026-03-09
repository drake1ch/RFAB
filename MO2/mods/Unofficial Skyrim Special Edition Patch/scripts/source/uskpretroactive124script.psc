Scriptname USKPRetroactive124Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive125Script Property Retro125 Auto

Quest Property DB09 Auto
ReferenceAlias Property DB09Guard1 Auto
ReferenceAlias Property DB09Guard2 Auto
ReferenceAlias Property DB09Guard3 Auto
ReferenceAlias Property DB09Guard4 Auto
ReferenceAlias Property DB09Guard5 Auto

Quest Property CR10 Auto
ReferenceAlias Property CR10Container Auto
ReferenceAlias Property CR10Plans Auto

Quest Property FreeformValdDebt Auto
ReferenceAlias Property ValdAlias Auto
Actor Property ValdRef Auto

ReferenceAlias Property SolitudeEastEmpire Auto
Faction Property JobMerchantFaction Auto
Faction Property JobMiscFaction Auto

Quest Property MQ201Malborn Auto
ReferenceAlias Property Assassin Auto

Quest Property MS05 Auto
Quest Property MS05Start Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.2.4 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 124
		Retro125.Process()
		Stop()
		Return
	EndIf
	
	;Bugzilla #6518 - DB09 Penitus Oculotus guards are never disabled after the quest is over.
	if( DB09.GetStageDone(200) == 1 )
		DB09Guard1.TryToDisable()
		DB09Guard2.TryToDisable()
		DB09Guard3.TryToDisable()
		DB09Guard4.TryToDisable()
		DB09Guard5.TryToDisable()
	EndIf
	
	;Bugzilla #6506 - CR10 puts plans in an inaccesible chest. Move them to the assigned dungeon.
	if( CR10.IsRunning() )
		if( CR10.GetStage() <= 10 )
			CR10Container.GetReference().AddItem(CR10Plans.GetReference())
		EndIf
	EndIf
	
	;Bugzilla #308 - Fix Vald's Debt quest so it can be completed or failed if Vald turns up dead.
	if( FreeformValdDebt.IsRunning() )
		if( ValdRef.IsDead() )
			if( FreeformValdDebt.Getstage() <= 10 )
				FreeformValdDebt.SetObjectiveFailed(10)
				FreeformValdDebt.Stop()
			EndIf
			
			if( FreeformValdDebt.GetStage() == 40 )
				FreeformValdDebt.Stop()
			EndIf
		Else
			ValdAlias.ForceRefTo(ValdRef)
		EndIf
	EndIf
	
	;Bugzilla #6904 - Vittoria Vici is not properly inducted into the merchant faction
	if( SolitudeEastEmpire.GetActorReference().IsDead() == 0 )
		SolitudeEastEmpire.TryToAddToFaction(JobMerchantFaction)
		SolitudeEastEmpire.TryToAddToFaction(JobMiscFaction)
	EndIf
	
	;Fix for MQ201Malborn if the assassin is dead but the quest stage never advanced
	if( MQ201Malborn.IsRunning() )
		if( Assassin.GetActorReference().IsDead() && MQ201Malborn.GetStage() >= 50 && MQ201Malborn.GetStage() < 100 )
			MQ201Malborn.SetStage(100)
		EndIf
	EndIf
	
	;MS05Start never stops running - lets kill it now.
	if( MS05.GetStage() >= 75 )
		MS05Start.Stop()
	EndIf
	
	debug.trace( "USKP 1.2.4 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 124
	Retro125.Process()
	Stop()
EndFunction
