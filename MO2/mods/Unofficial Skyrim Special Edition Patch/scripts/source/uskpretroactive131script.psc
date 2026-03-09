Scriptname USKPRetroactive131Script extends Quest  

Quest Property MQ101 Auto
Actor Property PlayerRef Auto
USKP_VersionTrackingScript Property USKPTracking Auto
USKPRetroactive132Script Property Retro132 Auto

Quest Property DB09 Auto
ReferenceAlias Property Penitus1 Auto
ReferenceAlias Property Penitus2 Auto

Quest Property MS10 Auto
ReferenceAlias Property Stig Auto
ReferenceAlias Property Pirate1 Auto
ReferenceAlias Property Pirate2 Auto
ReferenceAlias Property Pirate3 Auto

Quest Property MGMainQuestBridge Auto
MG01QuestScript Property MG01 Auto
Quest Property MQ205 Auto

Quest Property dunBlindCliffQST Auto
Location Property BlindCliffCaveLocation Auto

Quest Property MQ206 Auto
Book Property ElderScroll Auto
DialogueWinterholdCollegeQuestScript Property ScrollQuest Auto

ObjectReference Property TG09Door Auto

ReferenceAlias Property WinterholdInnkeeper Auto
ReferenceAlias Property WinterholdBackupInnkeeper Auto

Actor Property GalmarRef  Auto
Actor Property UlfricREF  Auto

ReferenceAlias Property Varnius Auto
Faction Property TGNoPickpocketFaction Auto

Spell Property MS04RewardNoDisplay Auto
Quest Property MS04 Auto

CarriageSystemScript Property Carriages Auto
Topic Property DialogueCarriageSystemIdle Auto

ReferenceAlias Property Gloth Auto
Faction Property PelagiaFarmFaction Auto

QF_MGRitual04_000CD987 Property MGRitual04 Auto
GlobalVariable Property MGRitualRestBook Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "USKP 1.3.1 Retroactive Updates Complete" )
		USKPTracking.LastVersion = 131
		Retro132.Process()
		Stop()
		Return
	EndIf

	;Bug #12121 - Two Penitus Oculatus Agents outside Castle Dour are never disabled after DB09
	if( DB09.GetStage() >= 200 )
		Penitus1.TryToDisable()
		Penitus2.TryToDisable()
	EndIf

	;Bug #11985 - Stig and his pirates are never removed from Dawnstar in MS10.
	if( MS10.GetStage() >= 41 )
		Stig.TryToDisable()
		Pirate1.TryToDisable()
		Pirate2.TryToDisable()
		Pirate3.TryToDisable()
	EndIf

	;MGMainQuestBridge is spamming the logs due to an invalid property setting. It was left as "default" without a value set.
    ;Also stop it if it's running past MQ205 stage 60 as it doesn't need to be.
	if( MGMainQuestBridge.IsRunning() )
		MG01.WaitingForShout = 0
		
		if( MQ205.GetStage() == 50 )
			MG01.WaitingForShout = 1
		EndIf
		
		if( MQ205.GetStage() >= 60 )
			MGMainQuestBridge.Stop()
		EndIf
	endif
	
	;Bug #294 - Affairs of Hagravens never terminates when completed.
	if( PlayerRef.IsInLocation(BlindCliffCaveLocation) == 0 )
		if( dunBlindCliffQST.Getstage() >= 100 )
			dunBlindCliffQST.Stop()
		EndIf
	EndIf
	
	;Bug #12182 - Elder Scroll should be on display once sold to Urag.
	if( MQ206.GetStage() >= 220 )
		if( PlayerRef.GetItemCount(ElderScroll) == 0 )
			ScrollQuest.ScrollDonated = 1
		EndIf
	EndIf
	
	;Bug #12075 - Twighlight Sepulcher door is displaced due to an official patch.
	TG09Door.SetPosition(9088.0000, 3488.0000, -32.0000)
	
	;Bug 12064 - The Winterhold innkeeper alias did not have the swap on death script assigned.
	if( WinterholdInnkeeper.GetActorReference().IsDead() )
		Actor Backup = WinterholdBackupInnkeeper.GetActorReference()
		
		if( !Backup.IsDead() )
			WinterholdInnkeeper.ForceRefTo(Backup)
		EndIf
	EndIf
	
	;Retro fix from 1.0 doesn't work to clean up Ulfric and Galmar after they die in the war.
	if( UlfricREF.IsDead() )
		(UlfricRef as WIDeadBodyCleanupScript).cleanUpBody()
		(GalmarRef as WIDeadBodyCleanupScript).cleanUpBody()
	EndIf
	
	;Bug #12177 - Varnius Junius should not be a pickpocket target since he lives in Dragon Bridge
	Varnius.TryToAddToFaction(TGNoPickpocketFaction)
	
	;Fixing the fixes for the fixes.... Put Bethesda's perk spell back on the player now that ours is gone, if they've made it this far.
	if( MS04.GetStageDone(1000) == 1 )
		if( !PlayerRef.HasSpell(MS04RewardNoDisplay) )
			PlayerRef.AddSpell(MS04RewardNoDisplay)
		EndIf
	EndIf
	
	;Bug #12223 - Regression fix for erroneously changed dialogue topic Property
	Carriages.DialogueCarriageChatterTopic = DialogueCarriageSystemIdle
	
	Gloth.TryToAddToFaction(PelagiaFarmFaction)

	;Restoration Ritual Spell never activates the proper global to let Collete sell the Guardian Circle book.
	MGRitual04.MGRitualAltBook = MGRitualRestBook
	if( MGRitual04.GetStageDone(200) == 1 )
		MGRitualRestBook.SetValue(0)
	EndIf
	
	debug.trace( "USKP 1.3.1 Retroactive Updates Complete" )
	USKPTracking.LastVersion = 131
	Retro132.Process()
	Stop()
EndFunction
