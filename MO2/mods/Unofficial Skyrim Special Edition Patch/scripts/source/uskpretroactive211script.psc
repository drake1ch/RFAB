Scriptname USKPRetroactive211Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive212Script Property Retro212 Auto

TGRShellScript Property TGRShell Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.1.1 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 211
		Retro212.Process()
		Stop()
		Return
	EndIf

	;Uh, we forgot to retro these TurnedIn variables of ours at some point. OOPS.
	if( TGRShell.IsRunning() )
		if( TGRShell.pSolitude.Value == 1 )
			TGRShell.USKPSolitudeTurnedIn = True
		EndIf
		
		if( TGRShell.pWhiterun.Value == 1 )
			TGRShell.USKPWhiterunTurnedIn = True
		EndIf

		if( TGRShell.pWindhelm.Value == 1 )
			TGRShell.USKPWindhelmTurnedIn = True
		EndIf
	EndIf

	debug.trace( "USKP 2.1.1 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 211
	Retro212.Process()
	Stop()
EndFunction
