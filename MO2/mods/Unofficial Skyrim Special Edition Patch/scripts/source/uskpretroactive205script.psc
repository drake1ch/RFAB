Scriptname USKPRetroactive205Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive206Script Property Retro206 Auto

Quest Property MG06 Auto
Quest Property MG05 Auto

ReferenceAlias Property Ulfric Auto
Quest Property MS11 Auto

Quest Property dunLabyrinthian Auto
Quest Property MG07 Auto
ReferenceAlias Property MG07Staff Auto
ReferenceAlias Property dunLabStaff Auto

PlayerHorseScript Property SolitudeHorseAlias Auto
Actor Property SolitudeHorse Auto
ObjectReference Property SolitudeHorseMarker Auto

Quest Property FreeformMarkarthE Auto

Quest Property TG07 Auto
ReferenceAlias Property TGRampMarker Auto

ObjectReference Property IvarsteadPilgramageChestRef Auto
MiscObject Property FFI04Sack Auto
Quest Property FreeformIvarstead04 Auto

Formlist Property TrapGasMagicDrawn Auto
Spell Property Incinerate Auto

ReferenceAlias Property Keerava Auto
ReferenceAlias Property FFRiften06Keerava Auto
Quest Property FreeformRiften06 Auto

Function Process()
	;Incinerate does not set off gas traps if readied.
	if( !TrapGasMagicDrawn.HasForm(Incinerate) )
		TrapGasMagicDrawn.AddForm(Incinerate)
	EndIf

	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.5 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 205
		Retro206.Process()
		Stop()
		Return
	EndIf

	;Bug #16216 - FreeformRiften06 should not be available if Keerava is dead, and should fail if the quest is in progress as well.
	if( FreeformRiften06.IsRunning() )
		if( Keerava.GetActorReference().IsDead() )
			FreeformRiften06.SetStage(250)
		Else
			FFRiften06Keerava.ForceRefTo(Keerava.GetReference())
		EndIf
	EndIf

	;Bug #15907 - MG05 could fail to start after MG06 is done.
	if( MG06.GetStage() >= 200 )
		if( MG05.GetStage() == 0 && !MG05.IsRunning() )
			MG05.Start()
		EndIf
	EndIf

	;Bug #16047 - TG07 needs to separate the ramp trigger from Vald's triggers.
	if( TG07.IsRunning() )
		if( TG07.GetStage() >= 40 )
			TGRampMarker.GetReference().Enable()
		EndIf
	EndIf

	;Ulfric has an unnecessary alias in MS11. Clear it.
	if( MS11.IsRunning() )
		Ulfric.Clear()
	EndIf

	;Staff of Magnus potentially duplicates because of an equipitem call in dunLabyrinthian
	if( MG07.IsRunning() && dunLabyrinthian.IsRunning() )
		dunLabStaff.ForceRefTo(MG07Staff.GetReference())
	EndIf

	;Horse at Katla's Farm is not set up correctly.
	SolitudeHorseAlias.MySelf = SolitudeHorse
	SolitudeHorseAlias.StablesPosition = SolitudeHorseMarker

	;FreeformMarkarthE never stops when completed.
	if( FreeformMarkarthE.GetStage() >= 20 )
		FreeformMarkarthE.Stop()
	EndIf

	;FreeformIvarstead04 does not remove Klimmek's supplies from the chest at the end.
	if( FreeformIvarstead04.GetStage() >= 200 )
		IvarsteadPilgramageChestRef.RemoveItem(FFI04Sack, 1)
	EndIf

	debug.trace( "USKP 2.0.5 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 205
	Retro206.Process()
	Stop()
EndFunction
