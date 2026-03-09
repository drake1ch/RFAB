Scriptname UDBP_Retroactive208Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive209Script Property Retro209 Auto

Quest Property DLC2SV02AncarionMerchant Auto
ReferenceAlias Property Ancarion Auto

ReferenceAlias Property CaptainVeleth Auto
Faction Property IsGuardFaction Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 2.0.8 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 208
		Retro209.Process()
		Stop()
		Return
	EndIf
	
	;Bug #17943 - Ancarion's dead does not stop DLC2SV02AncarionMerchant
	if( DLC2SV02AncarionMerchant.IsRunning() )
		if( Ancarion.GetActorReference().IsDead() )
			DLC2SV02AncarionMerchant.SetObjectiveFailed(10)
			DLC2SV02AncarionMerchant.Stop()
		EndIf
	EndIf

	;Bug #17994 - Veleth isn't in the required guard faction to make arrests
	CaptainVeleth.TryToAddToFaction(IsGuardFaction)

	debug.trace( "UDBP 2.0.8 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 208
	Retro209.Process()
	Stop()
EndFunction
