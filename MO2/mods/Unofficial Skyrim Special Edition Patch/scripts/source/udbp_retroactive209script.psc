Scriptname UDBP_Retroactive209Script extends Quest  

Quest Property MQ101 Auto
Actor Property PlayerRef Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive211Script Property Retro211 Auto

Quest Property DLC2dunHaknirTreasureQST Auto
ObjectReference Property USSEPHaknirShoalReiklingMarker Auto

Armor Property DLC2IldariRobes Auto
Armor Property DLC2TelvaniRobes Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 2.0.9 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 209
		Retro211.Process()
		Stop()
		Return
	EndIf
	
	;Bug #17984 - Rieklings at Haknir's Shoal don't disable properly.
	if( DLC2dunHaknirTreasureQST.GetStage() >= 20 && DLC2dunHaknirTreasureQST.GetStage() < 80 )
		USSEPHaknirShoalReiklingMarker.Enable()
	EndIf

	;Bug #17930 - DLC2IldariRobes should not be playable. Swap for a regular Telvanni Robes, but only if they're carrying it.
	if( PlayerRef.GetItemCount(DLC2IldariRobes) > 0 )
		PlayerRef.RemoveItem(DLC2IldariRobes, 999)
		PlayerRef.AddItem(DLC2TelvaniRobes, 1)
	EndIf

	debug.trace( "UDBP 2.0.9 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 209
	Retro211.Process()
	Stop()
EndFunction
