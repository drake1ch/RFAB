Scriptname UDBP_Retroactive204Script extends Quest  

Quest Property MQ101 Auto
UDBP_VersionTrackingScript Property UDBPTracking Auto
UDBP_Retroactive208Script Property Retro208 Auto

ReferenceAlias Property EbonyWarrior Auto
Faction Property CrimeFactionWhiterun Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDBP 2.0.4 Retroactive Updates Complete" )
		UDBPTracking.LastVersion = 207
		Retro208.Process()
		Stop()
		Return
	EndIf
	
	;Ebony Warrior should not be a member of CrimeFactionWhiterun.
	EbonyWarrior.TryToRemoveFromFaction(CrimeFactionWhiterun)
	EbonyWarrior.GetActorReference().SetCrimeFaction(None)

	debug.trace( "UDBP 2.0.4 Retroactive Updates Complete" )
	UDBPTracking.LastVersion = 207
	Retro208.Process()
	Stop()
EndFunction
