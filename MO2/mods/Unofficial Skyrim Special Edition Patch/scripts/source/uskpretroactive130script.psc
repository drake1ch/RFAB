Scriptname USKPRetroactive130Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive131Script Property Retro131 Auto

Actor Property CWFieldCOImperialHjaalmarchCapital  Auto
Key Property MorthalGuardhouseKey  Auto

Quest Property TGFences Auto
ObjectReference Property TGFenceGulumEiEnabler Auto

Quest Property C05 Auto
Quest Property C04 Auto
Cell Property DriftshadeSanctuary01 Auto
Cell Property DriftshadeSanctuary02 Auto
Location Property DriftshadeSanctuaryLocation Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.3.0 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 130
		Retro131.Process()
		Stop()
		Return
	EndIf
	
	; Give Legate Duilis a Morthal Guardhouse key - once more, since it was never added to his base NPC record.
	if CWFieldCOImperialHjaalmarchCapital.GetItemCount(MorthalGuardhouseKey) == 0
		CWFieldCOImperialHjaalmarchCapital.AddItem(MorthalGuardhouseKey)
	endif
	
	;Gulum-Ei's fence chest is not properly activated after TG04
	if( TGFences.GetStageDone(10) == 1 )
		TGFenceGulumEiEnabler.Enable()
	EndIf
	
	;Attempt to resuscitate Purity of Revenge if Blood's Honor ended with Driftshade Sanctuary being stuck and unable to start the quest.
	if( C04.GetstageDone(200) == 1 && C05.GetStageDone(10) == 0 )
		if( DriftshadeSanctuaryLocation.IsCleared() )
			DriftshadeSanctuary01.Reset()
			DriftshadeSanctuary02.Reset()
		EndIf
		C05.Start()
		C05.SetStage(1)
	EndIf
	
	debug.trace( "USKP 1.3.0 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 130
	Retro131.Process()
	Stop()
EndFunction
