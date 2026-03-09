Scriptname UHFPRetroactive112Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive200Script Property Retro200 Auto

ObjectReference Property FalkreathEntrywayChest Auto
ObjectReference Property FalkreathEndTable Auto
ObjectReference Property HjaalmarchEntrywayChest Auto
ObjectReference Property HjaalmarchEndTable Auto
ObjectReference Property PaleEntrywayChest Auto
ObjectReference Property PaleEndTable Auto
BYOHHouseScript Property FalkreathHouse Auto
BYOHHouseScript Property HjaalmarchHouse Auto
BYOHHouseScript Property PaleHouse Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 1.1.2 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 112
		Retro200.Process()
		Stop()
		Return
	EndIf

	;Bug #13049 - End table is not removed when "small house" is converted to "entry way"
	if( FalkreathHouse.bRoom1Remodeled == True )
		if( FalkreathEndTable.IsEnabled() )
			FalkreathEndTable.RemoveAllItems(FalkreathEntrywayChest)
			FalkreathEndTable.Disable()
		EndIf
	EndIf
	
	if( HjaalmarchHouse.bRoom1Remodeled == True )
		if( HjaalmarchEndTable.IsEnabled() )
			HjaalmarchEndTable.RemoveAllItems(HjaalmarchEntrywayChest)
			HjaalmarchEndTable.Disable()
		EndIf
	EndIf
	
	if( PaleHouse.bRoom1Remodeled == True )
		if( PaleEndTable.IsEnabled() )
			PaleEndTable.RemoveAllItems(PaleEntrywayChest)
			PaleEndTable.Disable()
		EndIf
	EndIf
	;End Bug #13049
	
	debug.trace( "UHFP 1.1.2 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 112
	Retro200.Process()
	Stop()
EndFunction
