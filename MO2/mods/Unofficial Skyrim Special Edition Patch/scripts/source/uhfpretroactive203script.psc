Scriptname UHFPRetroactive203Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive204Script Property Retro204 Auto

ObjectReference Property HFBed1 Auto
ObjectReference Property HFBed2 Auto
ObjectReference Property HFBed3 Auto
ObjectReference Property HFBed4 Auto
ObjectReference Property HFBed5 Auto
ObjectReference Property HFBed6 Auto
ObjectReference Property HFBed7 Auto
ObjectReference Property HFBed8 Auto
ObjectReference Property HFBed9 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 2.0.3 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 203
		Retro204.Process()
		Stop()
		Return
	EndIf

	;Bug #12592 - Stewards can't sleep in the extra bed because of ownership issues.
	if( HFBed1.IsEnabled() )
		HFBed1.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	if( HFBed2.IsEnabled() )
		HFBed2.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	if( HFBed3.IsEnabled() )
		HFBed3.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	if( HFBed4.IsEnabled() )
		HFBed4.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	if( HFBed5.IsEnabled() )
		HFBed5.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	if( HFBed6.IsEnabled() )
		HFBed6.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	if( HFBed7.IsEnabled() )
		HFBed7.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	if( HFBed8.IsEnabled() )
		HFBed8.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	if( HFBed9.IsEnabled() )
		HFBed9.GetLinkedRef().SetFactionOwner(None)
	EndIf
	
	debug.trace( "UHFP 2.0.3 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 203
	Retro204.Process()
	Stop()
EndFunction
