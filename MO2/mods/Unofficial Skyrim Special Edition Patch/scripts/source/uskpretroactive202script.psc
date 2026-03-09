Scriptname USKPRetroactive202Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive203Script Property Retro203 Auto

TGFencesQuestScript Property TGFences Auto
ObjectReference Property EnthirChestMarker Auto

Quest Property TG08B Auto
LocationAlias Property BronzeWaterCave Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.2 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 202
		Retro203.Process()
		Stop()
		Return
	EndIf
	
	;Bug #14844 - Enthir's fence chest is not handled correctly.
	if( TGFences.pEnthirReady == 1 )
		EnthirChestMarker.Enable()
	EndIf
	
	;Bug #14858 - Bronzewater Cave can't be cleared from the TG reserves list because it wasn't optional.
	if( TG08B.GetStageDone(200) == 1 )
		BronzeWaterCave.Clear()
	EndIf
	
	debug.trace( "USKP 2.0.2 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 202
	Retro203.Process()
	Stop()
EndFunction
