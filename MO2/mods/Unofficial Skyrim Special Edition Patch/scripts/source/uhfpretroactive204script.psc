Scriptname UHFPRetroactive204Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive208Script Property Retro208 Auto

RelationshipMarriageSpouseHouseScript Property RMSH Auto
BYOHRelationshipAdoptionScript Property Adoption Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 2.0.4 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 207
		Retro208.Process()
		Stop()
		Return
	EndIf

	;Need to readjust bed ownerships according to where your spouse lives (which is where the kids live). This is vanilla + mod aware.
	Adoption.UHFP_ReassignBedOwnerships( RMSH.SpouseCurrentHome )

	debug.trace( "UHFP 2.0.4 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 207
	Retro208.Process()
	Stop()
EndFunction
