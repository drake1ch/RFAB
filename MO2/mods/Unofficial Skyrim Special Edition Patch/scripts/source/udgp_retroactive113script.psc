Scriptname UDGP_Retroactive113Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive120Script Property Retro120 Auto

ReferenceAlias Property Bear Auto
ReferenceAlias Property BossMarker Auto
ActorBase Property NewBear Auto
Quest Property GunmarQuest Auto

Outfit Property DLC1FlorentiusOutfit Auto
ReferenceAlias Property Florentius Auto
Quest Property DLC1RV10 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 1.1.3 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 114 ; Yes, 114 is correct since 1.1.4 has no retro-script.
		Retro120.Process()
		Stop()
		Return
	EndIf
	
	;Bugzilla #7941 - Gunmar's bear can be deleted before the player arrives to kill it.
	if( GunmarQuest.IsRunning() && GunmarQuest.GetStage() < 50 )
		if( Bear.GetReference().IsDeleted() )
			ObjectReference Replacement = BossMarker.GetReference().PlaceAtMe(NewBear)
			Bear.ForceRefTo(Replacement)
		EndIf
	EndIf
	
	;Florentius never switches his outfit when it's time to wipe out the Dawnguard.
	if( DLC1RV10.GetStage() >= 10 )
		Florentius.GetActorReference().SetOutfit(DLC1FlorentiusOutfit)
	EndIf
	
	debug.trace( "UDGP 1.1.3 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 114 ; Yes, 114 is correct since 1.1.4 has no retro-script.
	Retro120.Process()
	Stop()
EndFunction
