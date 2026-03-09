Scriptname USKPRetroactive133Script extends Quest  

Quest Property MQ101 Auto
Actor Property PlayerRef Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive200Script Property Retro200 Auto

Quest Property DA13 Auto
Actor Property Orchendor Auto

FormList Property VoicesFollowerAll Auto
VoiceType Property FemaleNord Auto

Quest Property MS05Start Auto
Quest Property MS05 Auto

ReferenceAlias Property UHToggle Auto
Quest Property TGTQ04 Auto

ReferenceAlias Property Nurelion Auto
Quest Property MS12 Auto
Faction Property TGNoPickpocketFaction Auto

ReferenceAlias Property WoundedSoldier Auto
Faction Property CWPrepareCityCitizenCityCenterExlusion Auto

ReferenceAlias Property Froki Auto
ReferenceAlias Property Haming Auto
Faction Property CrimeFactionRift Auto

Quest Property MS09 Auto
Scene Property WhiterunCivilWarArgueScene Auto

Key Property MorthalGuardhouseKey Auto
ReferenceAlias Property Arrad Auto

Perk Property MGEnthirVendorPerk Auto
Quest Property MG06 Auto

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property USLEEPMS06StartDay Auto
Quest Property MS06Start Auto
Quest Property MS06 Auto

Function Process()
	;Bug #12889 - FemaleNord voice type is not available, preventing some NPCs from being hired as stewards.
	VoicesFollowerAll.AddForm(FemaleNord)
	
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.3.3 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 133
		Retro200.Process()
		Stop()
		Return
	EndIf

	;Orchendor can show up dead yet not trigger the quest to advance.
	if( DA13.GetStageDone(40) == 1 && DA13.GetStageDone(75) == 0 )
		if( Orchendor.IsDead() )
			DA13.SetStage(75)
		EndIf
	EndIf

	;Bug #12953 - Investingating the college after finding the book skips stage 75 and goes directly to 90. Previous bug fix only caught stage 75.
	if( MS05.GetStageDone(90) == 1 )
		if( MS05Start.IsRunning() )
			MS05Start.SetObjectiveCompleted(10)
			MS05Start.Stop()
		EndIf
	EndIf
	
	;Bug #12832 - Uttering Hills Cave is not returned to normal use after TGTQ04.
	if( TGTQ04.GetStageDone(200) == 1 )
		UHToggle.TryToDisable()
	EndIf
	
	;Bug #1453 - Nurelion needs to get added to TGNoPickpocketFaction after MS12 is done.
	if( MS12.Getstage() >= 100 )
		Nurelion.TryToAddToFaction(TGNoPickpocketFaction)
	EndIf
	
	;Bug #13021 - Wounded soldier from the temple could get pulled into a CWPrepareCity alias.
	WoundedSoldier.TryToAddToFaction(CWPrepareCityCitizenCityCenterExlusion)
	
	;Bug #13027 - Froki and Haming have no crime faction and thus no reaction to werewolves or the Dawnguard vampire lord form.
	Froki.TryToAddToFaction(CrimeFactionRift)
	if( Froki.GetActorReference() != None )
		Froki.GetActorReference().SetCrimeFaction(CrimeFactionRift)
	EndIf
	Haming.TryToAddToFaction(CrimeFactionRift)
	if( Haming.GetActorReference() != None )
		Haming.GetActorReference().SetCrimeFaction(CrimeFactionRift)
	EndIf
	
	;Bug #12720 - Fralia's argument scene should not play past MS09 stage 10.
	if( MS09.GetStage() >= 10 )
		WhiterunCivilWarArgueScene.Stop()
	EndIf
	
	;Yep, the other field CO needed one too. Imagine that.
	Arrad.GetActorReference().AddItem(MorthalGuardhouseKey)
	
	;Bug #6693 - If you don't speak to Enthir before becoming Archmage, you can't trade with him without completing the Thieves Guild "Hard Answers" quest.
	if( MG06.GetStage() >= 60 )
		PlayerRef.AddPerk(MGEnthirVendorPerk)
	EndIf
	
	;Improved fix for MS06 level 81 bug
	if( MS06Start.GetStageDone(250) == 1 && MS06.GetStageDone(5) == 0 )
		int DayV = GameDaysPassed.GetValueInt()
		USLEEPMS06StartDay.SetValue( DayV + 7 )
	EndIf
	
	debug.trace( "USKP 1.3.3 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 133
	Retro200.Process()
	Stop()
EndFunction
