Scriptname USLEEPRetroactive301Script extends Quest  

Quest Property MQ101 Auto
USLEEP_VersionTrackingScript Property USLEEPTracking Auto
USLEEPRetroactive303Script Property Retro303 Auto

ReferenceAlias Property Celann Auto
ReferenceAlias Property Ingjard Auto
Outfit Property DLC1OutfitDawnguard02Heavy Auto
Outfit Property DLC1OutfitDawnguard01Heavy Auto

Quest Property WEJS02 Auto
GlobalVariable Property USLEEPWEJS02IsDone Auto

Quest Property DA14 Auto
ReferenceAlias Property DA14Hagraven Auto

LocationAlias Property DLC2AshfallowLocation Auto
Quest Property DLC2RR02 Auto

Quest Property WIAddItem03 Auto

ReferenceAlias Property Vilkas Auto
ReferenceAlias Property Ria Auto
ReferenceAlias Property Skjor Auto
ReferenceAlias Property Aela Auto
ReferenceAlias Property Njada Auto
ReferenceAlias Property Farkas Auto
ReferenceAlias Property Athis Auto
ReferenceAlias Property Torvar Auto
Faction Property CompanionsFaction Auto

ReferenceAlias Property Hroggar Auto
ReferenceAlias Property Lami Auto
ReferenceAlias Property Alva Auto
Faction Property VampireFaction Auto
Quest Property pMS14 Auto

BardSongsScript Property BardSongs Auto
Quest Property MQ201Party Auto
ReferenceAlias Property Bard1 Auto
ReferenceAlias Property Bard2 Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USLEEP 3.0.1 Retroactive Updates Complete" )
		USLEEPTracking.LastVersion = 301
		Retro303.Process()
		Stop()
		Return
	EndIf

	;Bug #19460 - Dawnguard members with incorrect armor for their skills.
	Celann.GetActorReference().SetOutfit(DLC1OutfitDawnguard02Heavy)
	Ingjard.GetActorReference().SetOutfit(DLC1OutfitDawnguard01Heavy)

	;Bug #19639 - WEJS02 is still not terminating properly.
	if( WEJS02.IsRunning() )
		if( WEJS02.GetStageDone(100) == 1 )
			USLEEPWEJS02IsDone.SetValue(1)
		EndIf
		WEJS02.Stop()
	EndIf

	;Bug #19660 - We forgot to disable Moira in 2.0.4 if stage 135 was done.
	if( DA14.GetstageDone(135) == 1 && DA14.IsRunning() )
		DA14Hagraven.GetReference().Disable()
	EndIf

	;Bug #19612 - Ashfallow Citadel should be blocked from use in radiant quests until DLC2RR02 is done.
	if( DLC2RR02.GetStageDone(200) == 1 )
		DLC2AshfallowLocation.Clear()
	EndIf

	;Bug #19826 - WIAddItem03 does not terminate if thugs are killed or turn hostile before talking to the player. Shut it down, it's likely been stuck for awhile.
	if( WIAddItem03.IsRunning() )
		WIAddItem03.SetStage(200)
	EndIf

	;Bug #19469 - Companions pulled from their normal crime faction by world encounters. Need to undo that.
	Vilkas.GetActorReference().SetCrimeFaction(CompanionsFaction)
	Ria.GetActorReference().SetCrimeFaction(CompanionsFaction)
	Skjor.GetActorReference().SetCrimeFaction(CompanionsFaction)
	Aela.GetActorReference().SetCrimeFaction(CompanionsFaction)
	Njada.GetActorReference().SetCrimeFaction(CompanionsFaction)
	Farkas.GetActorReference().SetCrimeFaction(CompanionsFaction)
	Athis.GetActorReference().SetCrimeFaction(CompanionsFaction)
	Torvar.GetActorReference().SetCrimeFaction(CompanionsFaction)

	;Bug #19618 - Hroggar and Lami should not be mean to the player if Alva was killed in Movarth's Lair.
	if( pMS14.GetStageDone(200) == 1 )
		if( Alva.GetActorReference().IsInFaction(VampireFaction) )
			if( Hroggar.GetActorReference().GetRelationshipRank(Game.GetPlayer()) < 1 )
				Hroggar.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
			endif
			if( Lami.GetActorReference().GetRelationshipRank(Game.GetPlayer()) < 1 )
				Lami.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
			endif
		EndIf
	EndIf

	;Bug #19501 - Stop bard songs and clear aliases to keep Illdi from dying.
	if( MQ201Party.GetStageDone(100) )
		BardSongs.StopAllSongs()
		Bard1.Clear()
		Bard2.Clear()
	endif
	
	debug.trace( "USLEEP 3.0.1 Retroactive Updates Complete" )
	USLEEPTracking.LastVersion = 301
	Retro303.Process()
	Stop()
EndFunction
