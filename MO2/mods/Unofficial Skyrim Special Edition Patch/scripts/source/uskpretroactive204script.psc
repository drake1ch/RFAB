Scriptname USKPRetroactive204Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive205Script Property Retro205 Auto

Scene Property DialogueWinterholdInitScene Auto

ReferenceAlias Property Gabriella Auto
Faction Property DarkbrotherhoodFaction Auto

ReferenceAlias Property Arondil Auto
Quest Property dunYngvildQST Auto

Quest Property RelationshipMarriage Auto
Quest Property RelationshipMarriageFIN Auto

Quest Property DB01Misc Auto

Quest Property dunMidden01QST Auto
ReferenceAlias Property Velehk Auto

Quest Property TGTQ02 Auto
Quest Property DB05 Auto
ReferenceAlias Property Erikur Auto
Quest Property FreeformStonehillsA Auto
ReferenceAlias Property Bryling Auto

TGFencesQuestScript Property TGFences Auto
ObjectReference Property NiranyeChestMarker Auto

CWScript Property CW Auto
Location Property SolitudeLocation Auto
Keyword Property CWOwner Auto

Location Property RiverwoodLocation Auto
ObjectReference Property ImperialMarker Auto
ObjectReference Property StormcloakMarker Auto

Quest Property FreeformMorthalA Auto
Location Property MorthalLocation Auto

DarkBrotherhood Property DBScript Auto
USKP_DBFollowerAliasScript Property CiceroAlias Auto
USKP_DBFollowerAliasScript Property Initiate1Alias Auto
USKP_DBFollowerAliasScript Property Initiate2Alias Auto

ReferenceAlias Property Susanna Auto
Faction Property ServicesWindhelmCandelhearthHall Auto
Faction Property JobInnServer Auto

ReferenceAlias Property WindhelmPawnshopOwnerBackup Auto
ReferenceAlias Property	WindhelmPawnshopOwner Auto
ReferenceAlias Property IdesaSadri Auto
ReferenceAlias Property RevynSadri Auto
Faction	Property ServicesWindhelmRevynSadri Auto
Faction Property WindhelmPawnshopOwnerFaction Auto

Location Property WindhelmLocation Auto
Faction Property Favor104QuestGiverFaction Auto
ReferenceAlias Property Brunwulf Auto
ReferenceAlias Property Questgiver Auto
Quest Property Favor104 Auto

GlobalVariable Property USLEEPWERJ01IsDone Auto
Quest Property WERJ01 Auto
Quest Property WEJS11 Auto
ActorBase Property WEJS11Sigar Auto
GlobalVariable Property USKPWESigarIsDead Auto
Quest Property WEJS13 Auto
ActorBase Property WEJS13Ardwen Auto
GlobalVariable Property USKPWEArdwenIsDead Auto
Quest Property WE24 Auto
Quest Property WE25 Auto
Quest Property WE31 Auto
Quest Property WEDL01b Auto
Quest Property WEDL05 Auto
Quest Property WEJS01 Auto
Quest Property WEJS02 Auto
Quest Property WEJS18 Auto
Quest Property WERJ06 Auto
Quest Property WERJ13 Auto

dunLabyrinthianMaskBustSCRIPT Property MaskBust1 Auto
dunLabyrinthianMaskBustSCRIPT Property MaskBust2 Auto
dunLabyrinthianMaskBustSCRIPT Property MaskBust3 Auto
dunLabyrinthianMaskBustSCRIPT Property MaskBust4 Auto
dunLabyrinthianMaskBustSCRIPT Property MaskBust5 Auto
dunLabyrinthianMaskBustSCRIPT Property MaskBust6 Auto
dunLabyrinthianMaskBustSCRIPT Property MaskBust7 Auto
dunLabyrinthianMaskBustSCRIPT Property MaskBust8 Auto
ObjectReference Property MaskChest1 Auto
ObjectReference Property MaskChest2 Auto
ObjectReference Property MaskChest3 Auto
ObjectReference Property MaskChest4 Auto
ObjectReference Property MaskChest5 Auto
ObjectReference Property MaskChest6 Auto
ObjectReference Property MaskChest7 Auto
ObjectReference Property MaskChest8 Auto
dunLabyrinthianUltraMaskBustSCRIPT Property MasterMask Auto
ObjectReference Property MasterMaskChest Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.4 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 204
		Retro205.Process()
		Stop()
		Return
	EndIf

	;Bug #14472 - The game apparently is seriously making us update properties on non-persistent objects. Normally this should not be necessary.
	MaskBust1.USKPMaskStorageChest = MaskChest1
	MaskBust2.USKPMaskStorageChest = MaskChest2
	MaskBust3.USKPMaskStorageChest = MaskChest3
	MaskBust4.USKPMaskStorageChest = MaskChest4
	MaskBust5.USKPMaskStorageChest = MaskChest5
	MaskBust6.USKPMaskStorageChest = MaskChest6
	MaskBust7.USKPMaskStorageChest = MaskChest7
	MaskBust8.USKPMaskStorageChest = MaskChest8
	MasterMask.USKPMaskStorageChest = MasterMaskChest

	;Winterhold intro scene registers for endless updates.
	DialogueWinterholdInitScene.UnregisterForUpdateGameTime()
	DialogueWinterholdInitScene.GetOwningQuest().RegisterForSingleUpdateGameTime(4)
	
	;Bug #15053 - Gabriella has no assigned crime faction
	Gabriella.GetActorReference().SetCrimeFaction(DarkbrotherhoodFaction)
	
	;Bug #14991 - Arondil's corpse never cleans up because dunYngvildQST is never terminated.
	if( Arondil.GetActorReference().IsDead() )
		dunYngvildQST.SetStage(100)
	EndIf
	
	;Bug #14856 - Player cannot remarry if spouse dies
	if( RelationshipMarriageFIN.GetStage() == 200 )
		RelationshipMarriage.SetStage(10)
	EndIf
	
	;Bug #15054 - DB01Misc not terminated if stage 210 or 215 are called.
	if( DB01Misc.GetStageDone(210) || DB01Misc.GetStageDone(215) )
		DB01Misc.Stop()
	EndIf
	
	;Bug #14728 - Velehk's death does not stop the quest he's in.
	if( dunMidden01QST.GetStage() == 80 )
		if( Velehk.GetActorReference().IsDead() )
			dunMidden01QST.SetStage(100)
		EndIf
	EndIf
	
	;Bug #14727 - Erikur's essential flag is revoked in DB05 without checking TGTQ02's status and thus may be dead.
	if( DB05.GetStage() >= 200 && TGTQ02.GetStage() < 200 )
		if( Erikur.GetActorReference().IsDead() )
			Erikur.GetActorReference().Resurrect()
			Erikur.GetReference().Enable()
			Erikur.GetActorReference().MoveToMyEditorLocation()
			Erikur.GetActorReference().GetActorBase().SetEssential(true)
		EndIf
	EndIf

	;Bug #14727 - Same as above for Bryling, but her side quest should just be shut down.
	if( Bryling.GetActorReference().IsDead() )
		if( FreeformStonehillsA.GetStage() < 10 )
			FreeformStonehillsA.SetStage(25)
		Else
			FreeformStonehillsA.SetStage(30)
		EndIf
	EndIf

	;Bug #15060 - Niranye's fence chest is not handled correctly.
	if( TGFences.pNiranyeReady == 1 )
		NiranyeChestMarker.Enable()
	EndIf
	
	;Bug #14781 - Haafingar Stormcloak Camp does not disable after the war due to a keyword bug.
	if( SolitudeLocation.GetKeywordData(CWOwner) == 2 )
		CW.CWGarrisonEnableMarkerSonsCampHaafingar.Disable()
	EndIf
	
	;Bug #13771 - Stormcloaks don't occupy Riverwood as expected.
	if( RiverwoodLocation.GetKeywordData(CWOwner) == 2 )
		ImperialMarker.Disable()
		StormcloakMarker.Enable()
	EndIf

	;BreakFix from USKP 1.1 retro script. The logic of this block resulted in a whole lot of folks having this quest shut down without even realizing it.
	if( FreeformMorthalA.GetStage() > 0 )
		if( FreeformMorthalA.GetStage() == 10 || FreeformMorthalA.GetStage() == 30 )
			FreeformMorthalA.SetStage(200)
		Elseif( FreeformMorthalA.GetStage() == 5 )
			FreeformMorthalA.SetObjectiveDisplayed(5)
		Else ;Stage 20 is the only remaining candidate, kill it if the player isn't in Morthal.
			FreeformMorthalA.SetObjectiveCompleted(5)
			if( !Game.GetPlayer().IsInLocation(MorthalLocation) )
				FreeformMorthalA.SetStage(200)
			EndIf
		EndIf
	Else
		if( !FreeformMorthalA.IsRunning() )
			;See if it can be restarted.
			FreeformMorthalA.Start()
		EndIf
	EndIf

	;BGS #111 - DB Followers don't return home if left waiting too long. Give the full 3 days.
	if( DBScript.CiceroState == 3 )
		CiceroAlias.StartWaiting(1)
	EndIf
	
	if( DBScript.Initiate1State == 3 )
		Initiate1Alias.StartWaiting(2)
	EndIf
	
	if( DBScript.Initiate2State == 3 )
		Initiate2Alias.StartWaiting(3)
	EndIf

	;Bug #15281 - Susanna is not able to sell drinks.
	Susanna.TryToAddToFaction(ServicesWindhelmCandelhearthHall)
	Susanna.TryToAddToFaction(JobInnServer)

	;Bug #13126 - Backup pawnshop owner for Windhelm cannot actually take over the shop. Choose a new one.
	IdesaSadri.TryToAddToFaction(ServicesWindhelmRevynSadri)
	IdesaSadri.TryToAddToFaction(WindhelmPawnshopOwnerFaction)
	if( RevynSadri.GetActorReference().IsDead() )
		WindhelmPawnshopOwner.ForceRefto(IdesaSadri.GetReference())
	Else
		WindhelmPawnshopOwnerBackup.ForceRefTo(IdesaSadri.GetReference())
	EndIf

	;Bug #14850 - Brunwulf doesn't get designated as "Jarl Brunwulf"
	if( WindhelmLocation.GetKeywordData(CWOwner) == 1 )
		Brunwulf.TryToRemoveFromFaction(Favor104QuestGiverFaction)
		if( Favor104.IsRunning() && Favor104.GetStage() == 0 )
			if( Questgiver.GetReference() == Brunwulf.GetReference() )
				Favor104.Stop()
			EndIf
		EndIf
	EndIf

	;WERJ01 should not run a second time.
	if( WERJ01.GetStage() >= 100 )
		USLEEPWERJ01IsDone.SetValue(1)
	EndIf
	if( WERJ01.IsRunning() )
		WERJ01.Stop()
	EndIf
	
	;WEJS11 should not run again if Sigar dies.
	if( WEJS11Sigar.GetDeadCount() > 0 )
		USKPWESigarIsDead.SetValue(1)
	EndIf
	if( WEJS11.IsRunning() )
		WEJS11.Stop()
	EndIf

	;WEJS13 should not run again if Ardwen dies or arrives in Whiterun.
	if( WEJS13Ardwen.GetDeadCount() > 0 )
		USKPWEArdwenIsDead.SetValue(1)
	EndIf
	if( WEJS13.IsRunning() )
		WEJS13.Stop()
	EndIf

	;Numerous remaining wilderness encounters that are bugged and need to be stopped.
	if( WE24.IsRunning() )
		WE24.Stop()
	EndIf
	if( WE25.IsRunning() )
		WE25.Stop()
	EndIf
	if( WE31.IsRunning() )
		WE31.Stop()
	EndIf
	if( WEDL01b.IsRunning() )
		WEDL01b.Stop()
	EndIf
	if( WEDL05.IsRunning() )
		WEDL05.Stop()
	EndIf
	if( WEJS01.IsRunning() )
		WEJS01.Stop()
	EndIf
	if( WEJS02.IsRunning() )
		WEJS02.Stop()
	EndIf
	if( WEJS18.IsRunning() )
		WEJS18.Stop()
	EndIf
	if( WERJ06.IsRunning() )
		WERJ06.Stop()
	EndIf
	if( WERJ13.IsRunning() )
		WERJ13.Stop()
	EndIf

	debug.trace( "USKP 2.0.4 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 204
	Retro205.Process()
	Stop()
EndFunction
