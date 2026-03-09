Scriptname UHFPRetroactive110Script extends Quest  

Quest Property MQ101 Auto
UHFP_VersionTrackingScript Property UHFPTracking Auto
UHFPRetroactive111Script Property Retro111 Auto

MiscObject Property FlowerBaskets Auto
ActorBase Property BYOHUrchin_Sofie Auto
ReferenceAlias Property Child1 Auto
ReferenceAlias Property Child2 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UHFP 1.1.0 Retroactive Updates Complete" )
		UHFPTracking.LastVersion = 110
		Retro111.Process()
		Stop()
		Return
	EndIf

	;Ooops, we forgot to retro-clean Sofie's flower baskets!
	if( Child1 != None )
		if( Child1.GetActorReference() != None )
			if( Child1.GetActorReference().GetActorBase() == BYOHUrchin_Sofie )
				Child1.GetActorReference().RemoveItem(FlowerBaskets, 9999)
			EndIf
		EndIf
	EndIf
	
	if( Child2 != None )
		if( Child2.GetActorReference() != None )
			if( Child2.GetActorReference().GetActorBase() == BYOHUrchin_Sofie )
				Child2.GetActorReference().RemoveItem(FlowerBaskets, 9999)
			EndIf
		EndIf
	EndIf
	
	debug.trace( "UHFP 1.1.0 Retroactive Updates Complete" )
	UHFPTracking.LastVersion = 110
	Retro111.Process()
	Stop()
EndFunction
