Scriptname UDBP_Retroactive203Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive204Script Property Retro204 Auto

Quest Property DLC2dunKolbjornQST Auto
Location property DLC2KolbjornBarrowLocation Auto

Quest Property DLC2WE11 Auto
Quest Property DLC2TT1b Auto

Formlist Property TrapGasMagicDrawn Auto
Spell Property DLC2Ignite Auto

Function Process()
	;Ignite spell is never added to the formlist that deals with setting off flammable gas traps.
	if( !TrapGasMagicDrawn.HasForm(DLC2Ignite) )
		TrapGasMagicDrawn.AddForm(DLC2Ignite)
	EndIf
	
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 2.0.3 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 203
		Retro204.Process()
		Stop()
		Return
	EndIf
	
	;Bug #14987 - The Kolbjorn quest doesn't shut down properly.
	if( DLC2dunKolbjornQST.IsRunning() )
		if( DLC2dunKolbjornQST.GetStageDone(550) == 1 )
			if( Game.GetPlayer().GetCurrentLocation() != DLC2KolbjornBarrowLocation )
				DLC2dunKolbjornQST.SetStage(600)
			EndIf
		EndIf
	EndIf
	
	;Bug #15020 - Morgul's thugs may still be out looking for you.
	if( DLC2TT1b.IsRunning() == 0 && DLC2TT1b.GetStage() >= 300 )
		if( DLC2WE11.IsRunning() )
			DLC2WE11.Stop()
		endif
	EndIf

	debug.trace( "UDBP 2.0.3 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 203
	Retro204.Process()
	Stop()
EndFunction
