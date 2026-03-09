Scriptname UHFPRetroactive111Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive112Script Property Retro112 Auto

BYOHHouseScript Property WindstadManor Auto
ObjectReference Property BYOHHouse2DummyMarker01 Auto
ObjectReference Property BYOHHouse2InteriorWorkbenchRoom12Ref001 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 1.1.1 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 111
		Retro112.Process()
		Stop()
		Return
	EndIf

	;Bug #12566 - Workbench in Windstad Manor pointing to Lakeview Manor
	WindstadManor.DisableList[0] = BYOHHouse2DummyMarker01
	WindstadManor.DisableList[154] = BYOHHouse2InteriorWorkbenchRoom12Ref001
	
	debug.trace( "UHFP 1.1.1 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 111
	Retro112.Process()
	Stop()
EndFunction
