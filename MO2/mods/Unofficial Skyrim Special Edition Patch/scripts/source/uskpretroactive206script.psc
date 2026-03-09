Scriptname USKPRetroactive206Script extends Quest  

Quest Property MQ101 Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive207Script Property Retro207 Auto

QF_WE31_000753CA Property WE31Script Auto
GlobalVariable Property USLEEPWE31Completed Auto

QF_MS14_00025F3E Property MS14Script Auto
Faction Property CurrentFollowerFaction Auto

ReferenceAlias Property Vekel Auto
Faction Property JobMiscFaction Auto

ReferenceAlias Property Oengul Auto
ObjectReference Property USKPQueenSwordRef Auto
Faction Property Favor205QuestGiverFaction Auto

QF_FreeformRiften13_00043E1A Property FreeformRiften13 Auto
LeveledItem Property LItemSpellTOmes50Restoration Auto

Quest Property C05 Auto
Quest Property C06 Auto

Quest Property WEDL04 Auto
Quest Property WEDL03 Auto

Quest Property WEJS14 Auto

Quest Property MG02 Auto
ReferenceAlias Property ArnielLectureAlias Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 2.0.6 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 206
		Retro207.Process()
		Stop()
		Return
	EndIf

	;Bug #16642 - CK ate a property again. This is seriously getting old.
	WE31Script.USLEEPWE31Completed = USLEEPWE31Completed

	;Unfilled property on MS14
	MS14Script.CurrentFollowerFaction = CurrentFollowerFaction

	;Bug #16552 - Vekel has improper merchant dialogue. Need to remove his JobMisc faction.
	Vekel.TryToRemoveFromFaction(JobMiscFaction)

	;Bug #16619 - Queen Freydis Sword is never put on display.
	if( !Oengul.GetActorReference().IsInFaction(Favor205QuestGiverFaction) )
		USKPQueenSwordRef.Enable()
	EndIf

	;Bug #16410 - FreeformRiften13 was never processed by a retro script.
	FreeformRiften13.pReward = LItemSpellTOmes50Restoration

	;Bug #16958 - Skjor's dead body can cause C06 to fail to start. So if C05 is done, kick C06 in the ass now that the alias error is fixed.
	if( C05.GetStage() >= 200 && C06.GetStage() < 1 )
		C06.Start()
	EndIf

	;Bug #16960 - WEDL04 is supposed to shut down once generated, and never come back again. WEDL03 should stop too, but probably hasn't due to "run once" bugs.
	if( WEDL04.IsRunning() )
		WEDL04.Stop()
	EndIf
	
	if( WEDL03.IsRunning() )
		WEDL03.Stop()
	EndIf

	;Bug #16959 - WEJS14 should not have "run once" checked.
	if( WEJS14.IsRunning() )
		WEJS14.Stop()
	EndIf

	;Bug #15570 - Arniel tries to go back to the College when MG02 is running.
	if( MG02.IsRunning() )
		ArnielLectureAlias.Clear()
	EndIf

	debug.trace( "USKP 2.0.6 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 206
	Retro207.Process()
	Stop()
EndFunction
