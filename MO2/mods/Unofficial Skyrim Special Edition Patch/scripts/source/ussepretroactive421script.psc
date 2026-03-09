Scriptname USSEPRetroactive421Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive423Script Property Retro423 Auto

BYOH_QF_BYOHHouseBuilding_0100305D Property BYOHHouseBuilding Auto
MiscObject Property BYOHMaterialLog  Auto
ReferenceAlias Property Alias_Player Auto

Quest Property CWPostWhiterunObj Auto
Quest Property CWFinale Auto

Function Process()
	;Bug #27626 - Proper fix for the Material filter for cut logs.
	BYOHHouseBuilding.BYOHMaterialLog = BYOHMaterialLog
	Alias_Player.AddInventoryEventFilter(BYOHMaterialLog)

	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.2.1 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 421
		Retro423.Process()
		Stop()
		Return
	EndIf

	;Bug #27753 - Dangling objective to report to the Jarl of Whiterun.
	if( CWFinale.GetStageDone(400) )
		if( CWPostWhiterunObj.GetStageDone(100) == 0 )
			CWPostWhiterunObj.SetObjectiveDisplayed(1, abDisplayed = false)
		endif
		CWPostWhiterunObj.Stop()
	endif

	debug.trace( "USSEP 4.2.1 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 421
	Retro423.Process()
	Stop()
EndFunction
