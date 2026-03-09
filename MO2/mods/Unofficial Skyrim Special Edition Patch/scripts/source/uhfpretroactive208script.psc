Scriptname UHFPRetroactive208Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto

ObjectReference Property LakeviewEnableMarker Auto
ObjectReference Property LakeviewRoofPiece Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 2.0.8 Retroactive Updates Complete" )
		debug.trace( "All retroactive updates for UHFP fixes have been processed." )
		UHFPTracking.LastVersion = 209
		;USLEEP 300 - Stop the version tracking for UHFP now.
		UHFPTracking.Stop()
		Stop()
		Return
	EndIf

	;Bug #17252 - Hawks on enable parents, need to be adjusted if site isn't owned yet.
	if( LakeviewEnableMarker.IsEnabled() )
		LakeviewEnableMarker.GetLinkedRef().Enable()
	Else
		LakeviewEnableMarker.GetLinkedRef().Disable()
	EndIf
	
	if( LakeviewRoofPiece.IsEnabled() )
		LakeviewRoofPiece.GetLinkedRef().Enable()
	Else
		LakeviewRoofPiece.GetLinkedRef().Disable()
	EndIf

	debug.trace( "UHFP 2.0.8 Retroactive Updates Complete" )
	debug.trace( "All retroactive updates for UHFP fixes have been processed." )
	UHFPTracking.LastVersion = 209
	
	;USLEEP 300 - Stop the version tracking for UHFP now.
	UHFPTracking.Stop()
	Stop()
EndFunction
