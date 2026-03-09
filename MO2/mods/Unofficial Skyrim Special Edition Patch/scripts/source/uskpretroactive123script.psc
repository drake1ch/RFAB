Scriptname USKPRetroactive123Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive124Script Property Retro124 Auto

Quest Property USKPCWCampLeadersFix Auto
ReferenceAlias Property UlfricAlias Auto
ReferenceAlias Property TulliusAlias Auto
Actor Property USKP_Ulfric  Auto  
Actor Property USKP_Tullius  Auto  

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.2.3 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 123
		Retro124.Process()
		Stop()
		Return
	EndIf
	
	;Aliases on USKPCWCampLeadersFixScript were fubar, so let's fire this one off again now that they're fixed.
	if( USKPCWCampLeadersFix.IsRunning() == False )
		USKPCWCampLeadersFix.Start()
	Else
		UlfricAlias.ForceRefTo(USKP_Ulfric)
		TulliusAlias.ForceRefTo(USKP_Tullius)
	EndIf

	debug.trace( "USKP 1.2.3 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 123
	Retro124.Process()
	Stop()
EndFunction
