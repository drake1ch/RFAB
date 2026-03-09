Scriptname USLEEPRetroactive307Script extends Quest  

Quest Property MQ101 Auto
USLEEP_VersionTrackingScript Property USLEEPTracking Auto

ObjectReference Property DA13s14Marker  Auto
Quest Property DA13 Auto

Quest Property TGStatus Auto
GlobalVariable Property TGRDone Auto

ObjectReference Property TreeSapSpigot Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USLEEP 3.0.7 Retroactive Updates Complete" )
		debug.trace( "All retroactive updates for USLEEP fixes have been processed." )
		USLEEPTracking.LastVersion = 307
		USLEEPTracking.Stop()
		Stop()
		Return
	EndIf

	;Bug #21293 - Afflicted don't spawn outside Bthardamz during DA13.
	if( DA13.GetStage() >= 40 && DA13.GetStage() < 100 )
		DA13s14Marker.Enable()
	endif

	;Bug #21238 - Guild status never set to completed once last Ragged Flagon upgrade is done.
	if( TGStatus.GetStageDone(40) == 1 )
		TGRDone.SetValue(1)
	endif

	;Bug #21053 - Sleeping Tree Sap spigot comes home at last.
	TreeSapSpigot.MoveToMyEditorLocation()

	debug.trace( "USLEEP 3.0.7 Retroactive Updates Complete" )
	debug.trace( "All retroactive updates for USLEEP fixes have been processed." )
	USLEEPTracking.LastVersion = 307
	USLEEPTracking.Stop()
	Stop()
EndFunction
