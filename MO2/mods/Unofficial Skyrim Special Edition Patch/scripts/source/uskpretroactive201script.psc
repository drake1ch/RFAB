Scriptname USKPRetroactive201Script extends Quest  

Quest Property MQ101 Auto
Actor Property PlayerRef Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive202Script Property Retro202 Auto

QF_MS06Start_00093807 Property MS06Start Auto
GlobalVariable Property GameDaysPassed Auto

Quest Property dunPOITundraWitchShackQST Auto
ReferenceAlias Property Anise Auto

Quest Property dunEldergleamT03 Auto
ReferenceAlias Property Asta Auto
ReferenceAlias Property Sond Auto

QF_DA04_0002D512 Property DA04 Auto
AchievementsScript Property AchievementsQuest Auto
ObjectReference Property AlftandMapMarker Auto
Perk Property BloodHarvest Auto
MiscObject Property Harvester Auto
MiscObject Property Lexicon Auto
Quest Property MQ205 Auto
ObjectReference Property MzarkMapMarker Auto
MiscObject Property Sphere Auto

Quest Property dunHighGateRuinsQST Auto
MiscObject Property HighGateScroll Auto

Quest Property FreeformKolskeggrA Auto
ObjectReference Property USLEEPForswornToggle  Auto  

Quest Property DA02 Auto
ObjectReference Property Champion Auto
ObjectReference Property DA02RubbleMarker Auto

Quest Property dunNilheimQST Auto
Actor Property Telrav Auto

Quest Property DB07 Auto
ObjectReference Property Blood Auto

Quest Property dunDarklightQST Auto
dunDarklightIlliaUnlockScript Property DarklightDoor Auto

CWMapTableSceneScript Property CW01WindhelmMapTableScene Auto
Scene Property CW01WindhelmMapTableSceneA Auto

Quest Property MGRitual04 Auto

dunAzurasMalynDeathEffect Property PortalFX Auto
ObjectReference Property ActualPortal Auto

Location Property WhiterunLocation Auto
Keyword Property CWOwner Auto
CWScript Property CW Auto
ObjectReference Property WhiterunWatchtowerSonsEnableMarker Auto
ObjectReference Property WhiterunWatchtowerImperialEnableMarker Auto

dunMistwatchQSTScript Property dunMistwatchQST Auto
Scene Property ChristerLeavesWorld  Auto 

Quest Property dunBloodletThroneQST Auto

Quest Property DA03 Auto
ReferenceAlias Property SebastianLort Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.1 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 201
		Retro202.Process()
		Stop()
		Return
	EndIf

	;CK ate our property. Doesn't anyone ever FEED that thing?
	MS06Start.GameDaysPassed = GameDaysPassed
	
	;Bug #14193 - Anise is never properly cleaned up after death and the quest needs to be properly cycled out to fix that.
	if( dunPOITundraWitchShackQST.IsRunning() )
		if( Anise.GetActorReference().IsDead() )
			dunPOITundraWitchShackQST.SetStage(40)
		Else
			dunPOITundraWitchShackQST.SetStage(0)
			dunPOITundraWitchShackQST.Stop()
		EndIf
	EndIf
	
	;Bug #14053 - Eldergleem Sanctuary NPCs never clean up if they're dead. Quest needs to cycle to get the new alias settings to apply.
	if( dunEldergleamT03.IsRunning() )
		if( Asta.GetActorReference().IsDead() && Sond.GetActorReference().IsDead() )
			dunEldergleamT03.Stop()
		Else
			int stage = dunEldergleamT03.GetStage()
			dunEldergleamT03.Stop()
			Utility.Wait(2)
			dunEldergleamT03.Start()
			dunEldergleamT03.SetStage(stage)
		EndIf
	EndIf
	
	;Bug #13934 - Loss of several properties in DA04 for unknown reasons. At least 3 people over the years have reported this so we'll fix it to be on the safe side now.
	DA04.AchievementsQuest = AchievementsQuest
	DA04.AlftandMapMarker = AlftandMapMarker
	DA04.BloodHarvest = BloodHarvest
	DA04.Harvester = Harvester
	DA04.Lexicon = Lexicon
	DA04.MQ205 = MQ205
	DA04.MzarkMapMarker = MzarkMapMarker
	DA04.Sphere = Sphere

	;Bug #14378 - We dun goof'd. Anska's dialogue shut down the quest before the scroll could be taken if given to her.
	if( dunHighGateRuinsQST.GetStageDone(100) == 1 )
		if( PlayerRef.GetItemCount(HighGateScroll) > 0 )
			PlayerRef.RemoveItem(HighGateScroll, 1)
		EndIf
	EndIf
	
	;Bug #14230 - Story manager had a second way to start the Kolskeggr quest and now we have to kill it.
	if( FreeformKolskeggrA.IsRunning() )
		if( USLEEPForswornToggle.IsDisabled() )
			FreeformKolskeggrA.SetStage(100)
			FreeformKolskeggrA.Stop()
		EndIf
	EndIf
	
	;Bug #14131 - DA02 breaks future radiant quests in Knifepoint Ridge
	if( DA02.GetStage() >= 50 )
		Champion.Disable()
		DA02RubbleMarker.Enable()
	EndIf
	
	;Bug #885, Bug #13965 - The Nilheim quest does not terminate upon Telrav being killed, leaving his guards behind as permanent corpses.
	if( Telrav.IsDead() )
		dunNilheimQST.Stop()
	EndIf
	
	;Bug #14208 - Blood outside Dawnstar Sanctuary is never cleaned up after DB07.
	if( DB07.GetStage() >= 200 )
		Blood.Disable()
	EndIf
	
	;Bug #14537 - A door in Darklight Tower missing its property.
	DarklightDoor.darklightQST = dunDarklightQST
	
	;Bug #14525 - Unset property in Ulfric's Jagged Crown Scene
	CW01WindhelmMapTableScene.myScene = CW01WindhelmMapTableSceneA
	
	;Bug #14446 - MGRitual04 is still getting stuck in infinite update loops. Time to break it out and reset it for single updates.
	if( MGRitual04.GetStage() == 40 )
		MGRitual04.UnregisterForUpdate()
		Utility.Wait(2)
		MGRitual04.RegisterForSingleUpdate(2)
	EndIf
	
	;Bug #14429 - Malyn's death doesn't move the "good" portal at the end of Azura's Star.
	PortalFX.portalWhiteFX = ActualPortal
	
	;Bug #14569 - Guards do not re-enable at the Watchtower after the Battle of Whiterun
	if( CW.WhiterunSiegeFinished == True )
		if( WhiterunLocation.GetKeywordData(CWOwner) == 1 )
			WhiterunWatchtowerImperialEnableMarker.Enable()
		Else
			WhiterunWatchtowerSonsEnableMarker.Enable()
		EndIf
	EndIf
	
	;Bug #14593 - dunMistwatchQST had a missing property for the ChristerLeavesWorld scene.
	dunMistwatchQST.ChristerLeavesWorld = ChristerLeavesWorld
	
	;Bug #14586 - dunBloodletThroneQST is never terminated.
	if( dunBloodletThroneQST.GetStageDone(200) == 1 )
		dunBloodletThroneQST.Stop()
	EndIf
	
	;Bug #14497 - Sebastian Lort never disabled after DA03
	if( DA03.GetStage() >= 200 )
		SebastianLort.TryToDisable()
	EndIf
	
	debug.trace( "USKP 2.0.1 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 201
	Retro202.Process()
	Stop()
EndFunction
