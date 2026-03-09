Scriptname USSEPRetroactive425Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto

LeveledItem Property LItemBanditWeaponArrows Auto
LeveledItem Property DLC2BaseArrowNordic75 Auto

Function Process()

	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )

		;A special case - this list still needs to get updated at game start, but doesn't need to do the revert specified below.
		LItemBanditWeaponArrows.AddForm( DLC2BaseArrowNordic75, 24, 20 )
		LItemBanditWeaponArrows.AddForm( DLC2BaseArrowNordic75, 25, 20 )
		LItemBanditWeaponArrows.AddForm( DLC2BaseArrowNordic75, 26, 20 )
		LItemBanditWeaponArrows.AddForm( DLC2BaseArrowNordic75, 27, 20 )

		debug.trace( "USSEP 4.2.5 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 425
		Stop()
		Return
	EndIf

	;Bug #31335 - Bad logic check in previous updates generated a runaway with this leveled list fix. So we'll need to revert the list to make sure it's safe and then rerun the fix one more time.
	LItemBanditWeaponArrows.Revert()
	Utility.Wait(1)
	LItemBanditWeaponArrows.AddForm( DLC2BaseArrowNordic75, 24, 20 )
	LItemBanditWeaponArrows.AddForm( DLC2BaseArrowNordic75, 25, 20 )
	LItemBanditWeaponArrows.AddForm( DLC2BaseArrowNordic75, 26, 20 )
	LItemBanditWeaponArrows.AddForm( DLC2BaseArrowNordic75, 27, 20 )

	debug.trace( "USSEP 4.2.5 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 425
	Stop()
EndFunction
