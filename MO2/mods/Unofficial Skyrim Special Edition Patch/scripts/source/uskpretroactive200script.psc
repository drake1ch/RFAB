Scriptname USKPRetroactive200Script extends Quest  

Quest Property MQ101 Auto
Actor Property PlayerRef Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive201Script Property Retro201 Auto

Quest Property DA14 Auto
ReferenceAlias Property Sanguine Auto

Faction Property RiverwoodSleepingGiantInnFaction Auto
ReferenceAlias Property Embry Auto

MGRitual04QuestScript Property MGR04 Auto

Quest Property DA04 Auto
Perk Property BloodHarvest  Auto  

Quest Property FreeformMarkarthO Auto
ReferenceAlias Property Nimhe Auto

Quest Property FreeformWhiterunQuest03 Auto
ObjectReference Property USLEEPBalgruufSwordDisplay Auto
ReferenceAlias Property Proventus Auto
Weapon Property FFSteelGreatswordBalgruuf Auto

Quest Property MS11 Auto ;By Talos, not you again!
MS11CheatStalkTriggerScript Property MS11Trigger Auto

FavorChangeLocationQuestScript Property Favor258 Auto
FavorChangeLocationQuestScript Property Favor257 Auto
FavorChangeLocationQuestScript Property Favor256 Auto

QF_dunBoulderfallQST_0003A74A Property dunSouthfringeQST Auto
AchievementsScript Property Achievements Auto

TGLeadershipQuestScript Property TGLeadership Auto

Quest Property MGR20B Auto
ReferenceAlias Property MGR20BookAlias Auto
ReferenceAlias Property MGR20BookChest Auto

Quest Property MGR21 Auto
Faction Property CollegeofWinterholdFaction Auto

Quest Property T01 Auto

Quest Property WE31 Auto

Quest Property FreeformWinterholdCFin Auto
Quest Property FreeformWinterholdC Auto

Quest Property MGCollegeLectureInfos Auto
Quest Property MG01 Auto

BardSongsScript Property BardSongs Auto
ActorBase Property TalsgarTheWanderer Auto
Scene Property BardSongsInstrumentalWedding01 Auto
Scene Property BardSongsInstrumentalWedding02 Auto
Quest Property DB05 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.0 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 200
		Retro201.Process()
		Stop()
		Return
	EndIf
	
	;Bug #13489 - Sanguine is never disabled after DA14 is done.
	if( DA14.GetStageDone(200) == 1 )
		Sanguine.TryToDisable()
	EndIf
	
	;Bug #13408 - Embry is not in the Riverwood inn faction and thus can't sleep there.
	Embry.TryToAddToFaction(RiverwoodSleepingGiantInnFaction)
	
	;Bug #13631 - MGRitual04QuestScript can become stuck in an endless update loop.
	if( MGR04.GetStageDone(200) == 1 )
		MGR04.UnregisterForUpdate()
	EndIf
	
	;Bug #13634 - Blood harvesting perk does not always clear properly if Septimus is dead in DA04.
	if( DA04.GetstageDone(200) == 1 )
		PlayerRef.RemovePerk(BloodHarvest)
	EndIf
	
	;Bug #13398 - Nimhe respawns even though it's implied to be a unique spider
	if( FreeformMarkarthO.GetStageDone(20) == 1 )
		Nimhe.TryToDisable()
	EndIf
	
	;Bug #9040 - Proventus equips Balgruuf's sword but shouldn't.
	if( FreeformWhiterunQuest03.GetStageDone(200) == 1 )
		Proventus.GetActorReference().RemoveItem(FFSteelGreatswordBalgruuf, 1)
		USLEEPBalgruufSwordDisplay.Enable()
	EndIf
	
	;Bug #13668 - Trigger missing necessary quest property for MS11
	MS11Trigger.MS11 = MS11
	
	;Bug #13642 - Favor258, Favor257, and Favor256 have incorrect display toggle Properties
	if( Favor258.GetStage() < 10 )
		Favor258.bDisplayObjective = False
	EndIf

	if( Favor257.GetStage() < 10 )
		Favor257.bDisplayObjective = False
	EndIf
	
	if( Favor256.GetStage() < 10 )
		Favor256.bDisplayObjective = False
	EndIf
	
	;Bug #13757 - Southfringe Sanctum quest never counts for the Side Quests achievement because the property is not set.
	if( dunSouthfringeQST.GetStageDone(100) == 1 && dunSouthfringeQST.GetStageDone(200) == 0 )
		Achievements.IncSideQuests()
	Else
		dunSouthfringeQST.AchievementsQuest = Achievements
	EndIf
	
	;Bug #13715 - TGLeadership can't advance to stage 50 due to a missing property check during stage 40
	if( TGLeadership.GetStage() < 40 )
		TGLeadership.pTGLeadershipQuest = TGLeadership ; Yeah, this is crazyness, I know.
	EndIf
	
	;Bug #13745 - MGR20B never moves the book to its proper chest, and also doesn't recognize if you have a copy already.
	if( MGR20B.Getstage() == 10 )
		book MGR20Book = MGR20BookAlias.GetReference().GetBaseObject() as book
		if( PlayerRef.GetItemCount(MGR20Book) > 0 )
			MGR20B.SetStage(20)
		Else
			MGR20BookChest.GetReference().Additem(MGR20BookAlias.GetReference())
		EndIf
	EndIf
	
	;Bug #13759 - MGR21 is active at game start but shouldn't have been since it can steal reserved locations.
	if( MGR21.GetStage() < 10 )
		MGR21.Stop()
		
		;Start it back up if the player is in the College.
		if( PlayerRef.IsInFaction(CollegeofWinterholdFaction) )
			Utility.Wait(2)
			MGR21.Start()
		EndIf
	EndIf

	;Bug #13744 - T01 is never stopped when completed after bringing the Sybil back.
	if( T01.GetStage() == 200 )
		T01.Stop()
	EndIf
	
	;No bug number - we've tried fixing this before to no avail. Now it'll be fixed for sure.
	if( WE31.GetStage() == 200 )
		WE31.Stop()
	EndIf
	
	;Bug #13911 - Birna's dialogue after Drowned Sorrows was conditioned improperly, Drowned Sorrows also never stopped when fully completed.
	if( FreeformWinterholdCFin.IsRunning() )
		FreeformWinterholdC.Stop()
	EndIf
	
	;Bug #8708 - College lecture scene handler is a bloat bomb. Let's slay it so we can raise it anew!
	MGCollegeLectureInfos.Stop()
	if( MG01.GetStageDone(200) == 1 )
		Utility.Wait(2)
		MGCollegeLectureInfos.Start()
	EndIf
	
	;Bug #13649, #13184 - Bard song for Vittoria's wedding attempts to play if the bard has no 3D loaded.
	BardSongs.TalsgarTheWanderer = TalsgarTheWanderer
	if( !DB05.IsRunning() )
		BardSongsInstrumentalWedding01.Stop()
		BardSongsInstrumentalWedding02.Stop()
	EndIf
	
	debug.trace( "USKP 2.0.0 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 200
	Retro201.Process()
	Stop()
EndFunction
