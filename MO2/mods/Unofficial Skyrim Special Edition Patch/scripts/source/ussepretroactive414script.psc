Scriptname USSEPRetroactive414Script extends Quest  

Quest Property MQ101 Auto
USSEP_VersionTrackingScript Property USSEPTracking Auto
USSEPRetroactive415Script Property Retro415 Auto

Quest Property DA04 Auto
Quest Property MQ205 Auto
DA04ElderScrollActivatorScript Property ScrollActivator Auto
ReferenceAlias Property ElderScroll Auto

Quest Property FreeformRiften17 Auto
ReferenceAlias Property Hafjorg Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USSEP 4.1.4 Retroactive Updates Complete" )
		USSEPTracking.LastVersion = 414
		Retro415.Process()
		Stop()
		Return
	EndIf

	;Bug #22423 - Elder Scroll activator is not using a safe alias. Change it to the MQ00 one. If it's not deleted the player can still go back for it normally now.
	if( !ScrollActivator.IsDisabled() && !ScrollActivator.IsDeleted() )
		ScrollActivator.ElderScroll = ElderScroll
	else
		;Bug #22423 - The activator is already deleted or disabled and DA04 is dead. This broke the MQ and the DG MQ. Give the player the scroll now so they can continue the game. We do not care at this point if it duplicates.
		if( DA04.GetStage() >= 200 ) ; It's stopped.
			if( MQ205.GetStage() < 100 ) ; MQ205 would therefore be impossible to hit, so give them the scroll now. The update loop on MQ205 will take care of things from there, and Dawnguard should also pick up on this.
				Game.GetPlayer().AddItem( ElderScroll.GetReference(), 1 )
			endif
		endif
	endif

	;Bug #24400 - Disposition should have gone to Hafjorg instead of Filnjar.
	if( FreeformRiften17.GetStage() == 200 )
		Hafjorg.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
	endif

	debug.trace( "USSEP 4.1.4 Retroactive Updates Complete" )
	USSEPTracking.LastVersion = 414
	Retro415.Process()
	Stop()
EndFunction
