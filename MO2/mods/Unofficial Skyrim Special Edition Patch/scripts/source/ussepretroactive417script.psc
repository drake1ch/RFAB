Scriptname USSEPRetroactive417Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive420Script Property Retro420 Auto ; Yes, 418 and 419 were skipped.

CCHouseQuestScript Property CCQuest Auto

bool isprocessing = false

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.1.7 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 417
		Retro420.Process()
		Stop()
		Return
	EndIf

	if( !isprocessing )
		isprocessing = true ; Need to stop the control alias from calling this over and over before it has a chance to finish waiting.

		;Bug #25562 - CC House array initialization was not thread safe. We more or less have to wait for an unreasonable time and then assume the arrays are initialized on existing saves or future CC houses will be unable to initialize themselves.
		Utility.Wait(60)
		CCQuest.USSEP_ArraysInitialized = True

		debug.trace( "USSEP 4.1.7 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 417
		Retro420.Process()
		Stop()
	endif
EndFunction
