Scriptname USSEP_VersionTrackingScript extends Quest  

int Property LastVersion Auto Hidden
bool Property PreviousVersionsCheck Auto Hidden
Message Property USKPWarning Auto
Message Property UDGPWarning Auto
Message Property UHFPWarning Auto
Message Property UDBPWarning Auto
Message Property USLEEPWarning Auto

Quest Property USKPVersionTracking Auto
Quest Property UDGPVersionTracking Auto
Quest Property UHFPVersionTracking Auto
Quest Property UDBPVersionTracking Auto
USLEEP_VersionTrackingScript Property USLEEPVersionTracking Auto

;Yes, this list of quests will probably get tedious as time goes on.
USSEPRetroactive406Script Property Retro406 Auto ; Versions prior to 4.0.6 had no need for the script.
USSEPRetroactive407Script Property Retro407 Auto
USSEPRetroactive408Script Property Retro408 Auto
USSEPRetroactive413Script Property Retro413 Auto
USSEPRetroactive414Script Property Retro414 Auto
USSEPRetroactive415Script Property Retro415 Auto
USSEPRetroactive417Script Property Retro417 Auto ; Yes, 416 was skipped.
USSEPRetroactive420Script Property Retro420 Auto ; Yes, 418 and 419 were skipped.
USSEPRetroactive421Script Property Retro421 Auto
USSEPRetroactive423Script Property Retro423 Auto ; 422 was skipped.
USSEPRetroactive424Script Property Retro424 Auto
USSEPRetroactive425Script Property Retro425 Auto

Event OnInit()
	;Only fires once, assumes that none of the retro-scripts have fired. They chain-fire each other, so only start the oldest one here.
	LastVersion = 0
	ProcessRetroScripts()
EndEvent

Function ProcessRetroScripts()
	int skseversion = SKSE.GetVersion()

	;Check for old patches. Warn if present. Yes, USSEP now needs to block USLEEP. Oh, the irony.
	if( skseversion >= 2 )
		if( Game.IsPluginInstalled( "Unofficial Skyrim Legendary Edition Patch.esp" ) )
			USLEEPWarning.Show()
		endif

		if( Game.IsPluginInstalled( "Unofficial Skyrim Patch.esp" ) )
			USKPWarning.Show()
		endif

		if( Game.IsPluginInstalled( "Unofficial Dawnguard Patch.esp" ) )
			UDGPWarning.Show()
		endif

		if( Game.IsPluginInstalled( "Unofficial Hearthfire Patch.esp" ) )
			UHFPWarning.Show()
		endif

		if( Game.IsPluginInstalled( "Unofficial Dragonborn Patch.esp" ) )
			UDBPWarning.Show()
		endif
	else
		if( Game.GetFormFromFile(0x0000AF97, "Unofficial Skyrim Legendary Edition Patch.esp") != None )
			USLEEPWarning.Show()
		EndIf

		if( Game.GetFormFromFile(0x0000AF97, "Unofficial Skyrim Patch.esp") != None )
			USKPWarning.Show()
		EndIf

		if( Game.GetFormFromFile(0x0002D546, "Unofficial Dawnguard Patch.esp") != None )
			UDGPWarning.Show()
		EndIf

		if( Game.GetFormFromFile(0x00009E41, "Unofficial Hearthfire Patch.esp") != None )
			UHFPWarning.Show()
		EndIf

		if( Game.GetFormFromFile(0x000160D6, "Unofficial Dragonborn Patch.esp") != None )
			UDBPWarning.Show()
		EndIf
	endif

	;Take care of oddball loose ends after old versions are fully updated.
	While( USKPVersionTracking.IsRunning() )
		Utility.Wait(1)
	EndWhile

	While( UDGPVersionTracking.IsRunning() )
		Utility.Wait(1)
	EndWhile
	
	While( UHFPVersionTracking.IsRunning() )
		Utility.Wait(1)
	EndWhile
	
	While( UDBPVersionTracking.IsRunning() )
		Utility.Wait(1)
	EndWhile

	While( USLEEPVersionTracking.IsRunning() )
		Utility.Wait(1)
	EndWhile

	;Previous USLEEP script was handling tracking for both, bring over its version value if it's greater than 307, which was the last USLEEP retro script version.
	;Some of the stuff in the USSEP retro scripts should not be run twice.
	if( USLEEPVersionTracking.LastVersion > 307 && PreviousVersionsCheck == false )
		LastVersion = USLEEPVersionTracking.LastVersion
		PreviousVersionsCheck = true
	endif

	if( LastVersion < 425 )
		if( LastVersion < 406 )
			Retro406.Process()
		Elseif( LastVersion < 407 )
			Retro407.Process()
		Elseif( LastVersion < 408 )
			Retro408.Process()
		Elseif( LastVersion < 413 )
			Retro413.Process()
		Elseif( LastVersion < 414 )
			Retro414.Process()
		Elseif( LastVersion < 415 )
			Retro415.Process()
		Elseif( LastVersion < 417 )
			Retro417.Process()
		Elseif( LastVersion < 420 )
			Retro420.Process()
		Elseif( LastVersion < 421 )
			Retro421.Process()
		Elseif( LastVersion < 423 )
			Retro423.Process()
		Elseif( LastVersion < 424 )
			Retro424.Process()
		Elseif( LastVersion < 425 )
			Retro425.Process()
		EndIf
	EndIf
EndFunction
