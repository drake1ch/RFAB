Scriptname USLEEP_VersionTrackingScript extends Quest  

int Property LastVersion Auto Hidden
Message Property USKPWarning Auto
Message Property UDGPWarning Auto
Message Property UHFPWarning Auto
Message Property UDBPWarning Auto
Message Property USLEEPWarning Auto

Quest Property USKPVersionTracking Auto
Quest Property UDGPVersionTracking Auto
Quest Property UHFPVersionTracking Auto
Quest Property UDBPVersionTracking Auto

;Yes, this list of quests will probably get tedious as time goes on.
USLEEPRetroactive300Script Property Retro300 Auto
USLEEPRetroactive301Script Property Retro301 Auto
USLEEPRetroactive303Script Property Retro303 Auto
USLEEPRetroactive304Script Property Retro304 Auto
USLEEPRetroactive306Script Property Retro306 Auto
USLEEPRetroactive307Script Property Retro307 Auto

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

	if( LastVersion < 307 )
		if( LastVersion < 300 )
			Retro300.Process()
		Elseif( LastVersion < 301 )
			Retro301.Process()
		Elseif( LastVersion < 303 )
			Retro303.Process()
		Elseif( LastVersion < 304 )
			Retro304.Process()
		Elseif( LastVersion < 306 )
			Retro306.Process()
		Elseif( LastVersion < 307 )
			Retro307.Process()
			Stop()
		endif
	Else
		Stop()
	endif
EndFunction
