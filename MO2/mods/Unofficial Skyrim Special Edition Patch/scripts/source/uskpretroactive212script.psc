Scriptname USKPRetroactive212Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive213Script Property Retro213 Auto

Cell Property FortNeugrad01 Auto
Cell Property FortNeugrad02 Auto
Cell Property FortSnowhawk01 Auto
Cell Property FortSnowhawk02 Auto
Cell Property FortSungard01 Auto
Cell Property FortSungard02 Auto
Cell Property FortSungard03 Auto
Cell Property FortSungard04 Auto
Cell Property FortSungard05 Auto
Cell Property FortGreymoor01 Auto
Cell Property FortGreymoor02 Auto
Cell Property FortGreenwall01 Auto
Cell Property FortGreenwall02 Auto
Cell Property FortGreenwall03 Auto
Cell Property FortDunstad01 Auto
Cell Property FortDunstad02 Auto
Cell Property FortDunstad03 Auto
Cell Property FortDunstad04 Auto
Cell Property FortHraggstad01 Auto
Cell Property FortHraggstad02 Auto
Cell Property FortAmol01 Auto
Cell Property FortAmol02 Auto
dunSetFortOwnership Property NeugradMarker Auto
dunSetFortOwnership Property SnowhawkMarker Auto
dunSetFortOwnership Property SungardMarker Auto
dunSetFortOwnership Property GreymoorMarker Auto
dunSetFortOwnership Property GreenwallMarker Auto
dunSetFortOwnership Property DunstadMarker Auto
dunSetFortOwnership Property HraggstadMarker Auto
dunSetFortOwnership Property AmolMarker Auto

Quest Property DunHarmugstahlQST Auto

Quest Property dunUstengravQST Auto

Quest Property pTGRShell Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.1.2 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 212
		Retro213.Process()
		Stop()
		Return
	EndIf

	;Bug #19198 - Numerous forts do not get their ownership settings toggled correctly.
	NeugradMarker.FortInteriorCell01 = FortNeugrad01
	NeugradMarker.FortInteriorCell02 = FortNeugrad02
	SnowhawkMarker.FortInteriorCell01 = FortSnowhawk01
	SnowhawkMarker.FortInteriorCell02 = FortSnowhawk02
	SungardMarker.FortInteriorCell01 = FortSungard01
	SungardMarker.FortInteriorCell02 = FortSungard02
	SungardMarker.FortInteriorCell03 = FortSungard03
	SungardMarker.FortInteriorCell04 = FortSungard04
	SungardMarker.FortInteriorCell05 = FortSungard05
	GreymoorMarker.FortInteriorCell01 = FortGreymoor01
	GreymoorMarker.FortInteriorCell02 = FortGreymoor02
	GreenwallMarker.FortInteriorCell01 = FortGreenwall01
	GreenwallMarker.FortInteriorCell02 = FortGreenwall02
	GreenwallMarker.FortInteriorCell03 = FortGreenwall03
	DunstadMarker.FortInteriorCell01 = FortDunstad01
	DunstadMarker.FortInteriorCell02 = FortDunstad02
	DunstadMarker.FortInteriorCell03 = FortDunstad03
	DunstadMarker.FortInteriorCell04 = FortDunstad04
	HraggstadMarker.FortInteriorCell01 = FortHraggstad01
	HraggstadMarker.FortInteriorCell02 = FortHraggstad02
	AmolMarker.FortInteriorCell01 = FortAmol01
	AmolMarker.FortInteriorCell02 = FortAmol02

	;Bug #19138 - DunHarmugstahlQST is never terminated properly.
	if( DunHarmugstahlQST.GetStage() == 100 )
		DunHarmugstahlQST.Stop()
	EndIf

	;Bug #19132 - dunUstengravQST is never terminated properly.
	if( dunUstengravQST.GetState() == 50 )
		dunUstengravQST.Stop()
	EndIf

	;Bug #19336 - in order for Delvin's dialogue to appear correctly in an ongoing game, pTGRFirstCap needs to equal the number of city-retaking quests available. This has no effect on saves where the player is already Guildmaster because the "cap count" will be four, for which Delvin has no available dialogue.
	(pTGRShell as TGRShellScript).pTGRFirstCap = 0
	if (pTGRShell.GetStageDone(160))
		(pTGRShell as TGRShellScript).pTGRFirstCap += 1
	endif
	if (pTGRShell.GetStageDone(170))
		(pTGRShell as TGRShellScript).pTGRFirstCap += 1
	endif
	if (pTGRShell.GetStageDone(180))
		(pTGRShell as TGRShellScript).pTGRFirstCap += 1
	endif
	if (pTGRShell.GetStageDone(190))
		(pTGRShell as TGRShellScript).pTGRFirstCap += 1
	endif

	debug.trace( "USKP 2.1.2 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 212
	Retro213.Process()
	Stop()
EndFunction
