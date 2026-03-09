Scriptname USKPOnLoad04aScript extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPOnLoad05Script Property Retro120 Auto

Quest Property WIAssault02  Auto  
dunBluePalaceArenaSCRIPT Property DA15ArenaScript Auto
Quest Property DA15 Auto
Quest Property FreeformRiften01 Auto
Location Property CragslaneCavernLocation Auto
GlobalVariable Property pFFR01Count Auto Conditional
Quest Property MG01Pointer Auto
Quest Property MG01 Auto
Quest Property SolitudeFreeform03 Auto
Quest Property MS06Start Auto
ObjectReference Property MS06RitualEnabler Auto
Quest Property DB02 Auto
Quest Property DBEntranceQuest Auto
Quest Property MS08 Auto
Actor Property MS08Warrior1 Auto
Actor Property MS08Warrior2 Auto
ObjectReference Property MS08QuestActive Auto
ObjectReference Property MS08QuestNotActive Auto
Quest Property FreeformKolskeggrA Auto
ObjectReference Property USLEEPForswornToggle Auto
Quest Property MS12 Auto
Quest Property MS12b Auto
Quest Property MS05KingOlafsFestival  Auto
Actor Property ViarmoREF  Auto
Light Property Torch01  Auto
Quest Property DA13 Auto
ReferenceAlias Property TGPitcher Auto
ObjectReference Property TGRealPitcher Auto
Quest Property TGREnablerHandler Auto
ReferenceAlias Property MQ201MalbornCaravanLeader Auto
Actor Property MQ201MalbornCaravanLeaderRef Auto
Quest Property MQ201Malborn Auto
ObjectReference Property USKPTG08AMapMarker Auto
Quest Property TG08A Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.1 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 110
		Retro120.Process()
		Stop()
		Return
	EndIf
	
	if( WIAssault02.GetStage() == 100 && WiAssault02.IsRunning() )
		WIAssault02.SetObjectiveCompleted(30)
		WIAssault02.Stop()
	endif
	
	if( DA15.GetStage() >= 200 )
		DA15ArenaScript.UnregisterForUpdate()
	EndIf
	
	if( FreeformRiften01.GetStage() == 30 && CragslaneCavernLocation.IsCleared() )
		pFFR01Count.SetValue(7)
		FreeformRiften01.SetStage(40)
	EndIf

	if( MG01.GetStage() >= 20 && MG01Pointer.IsRunning() )
		if( MG01Pointer.IsObjectiveDisplayed(10) )
			MG01Pointer.SetStage(200)
		Else
			MG01Pointer.SetStage(255)
		endif
	EndIf
	
	if( SolitudeFreeform03.GetStage() > 20 )
		SolitudeFreeform03.SetObjectiveDisplayed(10,false)
	endif
	
	if( MS06Start.GetStage() >= 250 )
		MS06Start.Stop()
		MS06RitualEnabler.disable()
	EndIf
	
	if( DB02.GetStage() >= 200 )
		DBEntranceQuest.Stop()
		DB02.Stop()
	EndIf
	
	if( MS08.GetStage() >= 200 )
		MS08Warrior1.disable()
		MS08Warrior2.disable()
		MS08QuestActive.Disable()
		MS08QuestNotActive.Enable()
	endif
	
	if( FreeformKolskeggrA.GetStage() >= 100 )
		USLEEPForswornToggle.disable()
	EndIf
	
	if( MS12b.GetStage() >= 100 )
		MS12.Stop()
		MS12b.Stop()
	EndIf
	
	; Fix Viarmo's perpetual torch ( maybe for real this time :P )
	if MS05KingOlafsFestival.IsStageDone(15) == 1
		if ViarmoREF.IsEquipped(Torch01) == 1
			ViarmoREF.UnEquipItem(Torch01)
		endif
		ViarmoREF.RemoveItem(Torch01)
	endif

	if( DA13.IsRunning() && DA13.GetStage() >= 100 )
		DA13.Stop()
	EndIf
	
	TGPitcher.ForceRefTo(TGRealPitcher)
	if( TGREnablerHandler.GetStageDone(60) == 1 )
		TGRealPitcher.Enable()
	EndIf

	if( MQ201Malborn.IsRunning() && MQ201Malborn.GetStage() < 110 )
		MQ201MalbornCaravanLeader.ForceRefTo(MQ201MalbornCaravanLeaderRef)
	EndIf

	if( TG08A.GetStage() < 20 )
		USKPTG08AMapMarker.disable()
	endif
	
	debug.trace( "USKP 1.1 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 110
	Retro120.Process()
	Stop()
EndFunction
