Scriptname USKPOnLoad05Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive121Script Property Retro121 Auto

Actor Property PlayerRef Auto
Faction Property GovSons  Auto  
Faction Property GovRuling  Auto  
Faction Property GovExiled  Auto  
Location Property RiftenLocation Auto  
GlobalVariable Property CWImperial  Auto  
Keyword Property CWOwner  Auto 
ReferenceAlias Property CWExiledSonsMarker  Auto  
ReferenceAlias Property Saerlund  Auto  
ReferenceAlias Property Harrald  Auto  

Faction Property ServicesMarkarthJewelryVendor  Auto  
ReferenceAlias Property DialogueMorthalHousecarl  Auto  
ReferenceAlias Property DialogueMorthalJarl  Auto  
ReferenceAlias Property DialogueRiftenHostler  Auto  
ReferenceAlias Property DialogueRiftenTavernkeeper  Auto  
ReferenceAlias Property DialogueRiftenHostlerBackup  Auto  
ReferenceAlias Property DialogueRiftenTavernkeeperBackup  Auto  
ReferenceAlias Property Adara  Auto  
ReferenceAlias Property Heimvar  Auto  
ReferenceAlias Property SorexVinius  Auto  
ReferenceAlias Property Melaran  Auto  
ReferenceAlias Property TalenJei  Auto  
ReferenceAlias Property Lynly  Auto 
ReferenceAlias Property IdgrodRavencrone  Auto 
ReferenceAlias Property Gorm  Auto 
Faction Property ServicesSolitudeBlacksmith  Auto  
Faction Property ServicesSolitudeWinkingSkeeverInn  Auto  
ReferenceAlias Property DialogueSolitudeTailor  Auto  
ReferenceAlias Property DialogueWhiterunInnkeeperBackup  Auto  
Faction Property ServicesSolitudeSybilleStentor  Auto  
Faction Property SolitudeBluePalaceFaction  Auto  
Faction Property WINoTavernFaction  Auto  
Faction Property ServicesWhiterunBanneredMare  Auto 

ReferenceAlias Property Senna  Auto  
Quest Property DA14 Auto
ObjectReference Property TempleDibellaMarker Auto

Quest Property DA03Start Auto
ActorBase Property Lod Auto

CompanionsHousekeepingScript Property ParentQuest Auto
ReferenceAlias Property WitchHead Auto

Quest Property FavorJarlsMakeFriends Auto

ReferenceAlias Property Dravynea Auto
Quest Property FreeformKynesgroveA Auto

Armor Property DBArmorBootsWorn Auto
Armor Property DBArmorGlovesWorn Auto
Armor Property DBArmorHelmetWorn Auto
Armor Property DBArmorBootsWornPlayable Auto
Armor Property DBArmorGlovesWornPlayable Auto
Armor Property DBArmorHelmetWornPlayable Auto

Armor Property ArmorDaedricBoots Auto
Armor Property DremoraDaedricBoots Auto

Quest Property BardsCollegeDrum  Auto
Quest Property BardsCollegeFlute  Auto
Quest Property BardsCollegeLute  Auto
ReferenceAlias Property BardsCollegeDrumItem  Auto
ReferenceAlias Property BardsCollegeFluteItem  Auto
ReferenceAlias Property BardsCollegeLuteItem  Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.2 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 120
		Retro121.Process()
		Stop()
		Return
	EndIf
	
	;Fix by PrinceShroob to correct missing factions for Saerlund and Harrald
	Harrald.TryToAddToFaction(GovSons)
	Harrald.TryToAddToFaction(GovRuling)
	Saerlund.TryToAddToFaction(GovSons)
	Saerlund.TryToAddToFaction(GovRuling)
	if (RiftenLocation.GetKeywordData(CWOwner) == CWImperial.GetValue())
		Harrald.TryToRemoveFromFaction(GovRuling)
		Harrald.TryToAddToFaction(GovExiled)
		Harrald.GetActorReference().SetRelationshipRank(PlayerRef, -2)
		Harrald.TryToMoveTo(CWExiledSonsMarker.GetReference())
		Saerlund.TryToRemoveFromFaction(GovRuling)
		Saerlund.TryToAddToFaction(GovExiled)
		Saerlund.GetActorReference().SetRelationshipRank(PlayerRef, -2)
		Saerlund.TryToMoveTo(CWExiledSonsMarker.GetReference())
	endif

	;Fix by PrinceShroob to correct various innkeeper and services factions that were wrong, and to correct broken setups for backup NPCs that fill the roles of dead ones.
	Adara.TryToAddToFaction(ServicesMarkarthJewelryVendor)
	Heimvar.TryToAddToFaction(ServicesSolitudeBlacksmith)
	SorexVinius.TryToAddToFaction(ServicesSolitudeWinkingSkeeverInn)
	Melaran.TryToAddToFaction(ServicesSolitudeSybilleStentor)
	Melaran.TryToAddToFaction(SolitudeBluePalaceFaction)
	TalenJei.TryToRemoveFromFaction(WINoTavernFaction)
	Lynly.TryToRemoveFromFaction(WINoTavernFaction)
	if (DialogueMorthalJarl.GetReference() == IdgrodRavencrone.GetActorReference())
		DialogueMorthalHousecarl.ForceRefTo(Gorm.GetActorReference())
	endif

	(DialogueRiftenHostler as SwapAliasOnDeath).BackupAlias = DialogueRiftenHostlerBackup
	(DialogueRiftenTavernkeeper as SwapAliasOnDeath).BackupAlias = DialogueRiftenTavernkeeperBackup

	;Bugzilla #222 - Resurrect Senna if she's dead and DA14 has not started yet.
	if( DA14.GetStage() < 5 )
		if( Senna.GetActorReference().IsDead() )
			Senna.GetActorReference().Resurrect()
			Senna.TryToEnable()
			Senna.TryToMoveTo(TempleDibellaMarker)
		endif
	EndIf
	
	;Bugzilla #239 - Stop DA03Start if Lod is dead before DA03 had a chance to start.
	if( DA03Start.Getstage() < 10 )
		if( Lod.GetDeadCount() > 0 )
			DA03Start.SetObjectiveFailed(5)
			DA03Start.Stop()
		EndIf
	EndIf
	
	;Bugzilla #265 - Retroactive fix for CR13 to clear Glenmoril witch heads Alias.
	if( ParentQuest.FarkasHasBeastBlood == false && ParentQuest.VilkasHasBeastBlood == false )
		WitchHead.Clear()
	EndIf
	
	;Bugzilla #341 - "Assist the People of Haafingar" is stuck in the journal
	if( FavorJarlsMakeFriends.GetStageDone(35) == 1 )
		FavorJarlsMakeFriends.SetObjectiveCompleted(30)
	EndIf
	
	;Bugzilla #847 - If Dravynea is dead and the quest is running, register it as a failure and stop it. Resurrecting her would cause the quest to reset and leave the broken objective behind permanently.
	if( FreeformKynesgroveA.IsRunning() )
		if( Dravynea.GetActorReference().IsDead() )
			FreeformKynesgroveA.SetObjectiveFailed(10)
			FreeformKynesgroveA.Stop()
		EndIf
	EndIf
	
	;Bugzilla #283 - Switch unplayable worn DB armor pieces with playable ones
	int WB = PlayerRef.GetItemCount(DBArmorBootsWorn)
	int WG = PlayerRef.GetItemCount(DBArmorGlovesWorn)
	int WH = PlayerRef.GetItemCount(DBArmorHelmetWorn)
	if( WB > 0 )
		PlayerRef.RemoveItem(DBArmorBootsWorn, WB)
		PlayerRef.AddItem(DBArmorBootsWornPlayable, WB)
	EndIf
	
	if( WG > 0 )
		PlayerRef.RemoveItem(DBArmorGlovesWorn, WG)
		PlayerRef.AddItem(DBArmorGlovesWornPlayable, WG)
	EndIf
	
	if( WH > 0 )
		PlayerRef.RemoveItem(DBArmorHelmetWorn, WH)
		PlayerRef.AddItem(DBArmorHelmetWornPlayable, WH)
	EndIf
	
	;Bugzilla #291 - Atronach Forge Daedric Boots are the wrong reward
	int DBoots = PlayerRef.GetItemCount(DremoraDaedricBoots)
	if( DBoots > 0 )
		PlayerRef.RemoveItem(DremoraDaedricBoots, DBoots)
		PlayerRef.AddItem(ArmorDaedricBoots, DBoots)
	EndIf

	; Clear Bards College instrument useless leftover quest objectives if they exist
	; This has been moved from USKPOnload02Script.psc because the properties are wrong and the quests were never properly stopped.
	if( BardsCollegeDrum.IsRunning() && BardsCollegeDrum.IsStageDone(200) == 1 )
 		if BardsCollegeDrum.IsObjectiveDisplayed(20) == 1
 			if BardsCollegeDrum.IsObjectiveCompleted(20) == 0
 				BardsCollegeDrum.SetObjectiveCompleted(20,1)
				BardsCollegeDrum.SetObjectiveDisplayed(40)
				BardsCollegeDrum.SetObjectiveCompleted(40)
			endif
		endif
		PlayerRef.RemoveItem(BardsCollegeDrumItem.GetReference(),1)
		BardsCollegeDrum.Stop()
	endif

	if( BardsCollegeFlute.IsRunning() && BardsCollegeFlute.IsStageDone(200) == 1 )
 		if BardsCollegeFlute.IsObjectiveDisplayed(20) == 1
	 		if BardsCollegeFlute.IsObjectiveCompleted(20) == 0
 				BardsCollegeFlute.SetObjectiveCompleted(20,1)
				BardsCollegeFlute.SetObjectiveDisplayed(40)
				BardsCollegeFlute.SetObjectiveCompleted(40)
 			endif
 		endif
		PlayerRef.RemoveItem(BardsCollegeFluteItem.GetReference(),1)
		BardsCollegeFlute.Stop()
	endif

	if( BardsCollegeLute.IsRunning() && BardsCollegeLute.IsStageDone(200) == 1 )
 		if BardsCollegeLute.IsObjectiveDisplayed(20) == 1
	 		if BardsCollegeLute.IsObjectiveCompleted(20) == 0
 				BardsCollegeLute.SetObjectiveCompleted(20,1)
				BardsCollegeLute.SetObjectiveDisplayed(40)
				BardsCollegeLute.SetObjectiveCompleted(40)
 			endif
 		endif
		PlayerRef.RemoveItem(BardsCollegeLuteItem.GetReference(),1)
		BardsCollegeLute.Stop()
	endif

	debug.trace( "USKP 1.2 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 120
	Retro121.Process()
	Stop()
EndFunction
