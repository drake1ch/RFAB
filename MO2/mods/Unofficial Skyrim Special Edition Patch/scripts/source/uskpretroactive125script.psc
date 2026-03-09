Scriptname USKPRetroactive125Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive126Script Property Retro126 Auto

Quest Property FreeformSoljundsSinkholeA Auto
ObjectReference Property USLEEPDraugrEnableMarker Auto

Quest Property DB05 Auto
ObjectReference Property DB05WeddingEnableMarker Auto
ObjectReference Property DB05PenitusBodyguardRef Auto

ReferenceAlias Property Garakh Auto
Faction Property ServicesLargashburGarakhUSKP Auto
ReferenceAlias Property Atub Auto
Faction Property JobMerchantFaction Auto
Faction Property JobBlacksmithFaction Auto
Faction Property JobApothecaryFaction Auto

ObjectReference Property DA06EnableParent Auto
Quest Property DA06 Auto

ReferenceAlias Property Addvar Auto
Key Property karthspireRedoubtJailKey Auto
Key Property SolitudeAddvarsHouseKey Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.2.5 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 125
		Retro126.Process()
		Stop()
		Return
	EndIf
	
	;Bugzilla #7437 - Soljund's Sinkhole should not respawn after the quest is completed.
	if( FreeformSoljundsSinkholeA.Getstage() >= 100 )
		USLEEPDraugrEnableMarker.disable()
	EndIf

	;Bugzilla #7300 - Vitoria's wedding decorations in Solitude are never cleaned up.
	if( DB05.GetStage() >= 200 )
		DB05WeddingEnableMarker.Disable()
		DB05PenitusBodyguardRef.Disable()
	EndIf
	
	;Bugzilla #7247 - Garakh is missing a merchant faction and has incorrect faction ranks.
	Garakh.TryToAddToFaction(ServicesLargashburGarakhUSKP)
	Garakh.GetActorReference().SetFactionRank(JobMerchantFaction, 0)
	Garakh.GetActorReference().SetFactionRank(JobBlacksmithFaction, 0)
	
	;Bugzilla #7246 - Atub has incorrect merchant faction ranks.
	Atub.GetActorReference().SetFactionRank(JobMerchantFaction, 0)
	Atub.GetActorReference().SetFactionRank(JobBlacksmithFaction, 0)
	
	;Bugzilla #8124 - Largashbur giant is still enabled and can respawn after DA06 is done.
	if( DA06.GetStageDone(200) == 1 )
		DA06EnableParent.Disable()
	EndIf
	
	;Addvar has the wrong key
	Addvar.GetActorReference().RemoveItem(karthspireRedoubtJailKey, 1)
	Addvar.GetActorReference().AddItem(SolitudeAddvarsHouseKey, 1)
	
	debug.trace( "USKP 1.2.5 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 125
	Retro126.Process()
	Stop()
EndFunction
