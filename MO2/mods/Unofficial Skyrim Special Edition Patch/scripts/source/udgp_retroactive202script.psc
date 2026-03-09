Scriptname UDGP_Retroactive202Script extends Quest  

Quest Property MQ101 Auto
UDGP_VersionTrackingScript Property UDGPTracking Auto
UDGP_Retroactive203Script Property Retro203 Auto

Quest Property DLC1VQ07 Auto
DLC1_NPCMentalModelScript Property MM Auto
ReferenceAlias Property Serana Auto
DialogueFollowerScript Property dfScript auto

DLC1RadiantScript Property DLCRadiant Auto
ActorBase Property DLC1RadiantDisguisedVampireMerchant Auto

DLC1VQ07AurielsBowAliasScript Property BowAlias Auto
AchievementsScript Property AchievementsQuest  Auto  

FerrySystemScript Property FerrySystem Auto
Topic Property DialogueCarriageChatterTopic Auto

ReferenceAlias Property Crown Auto

Function Process()
	;Abort this if chargen is not sufficiently advanced. We do not have any bugfixes for the cart ride scene in Helgen.
	if( MQ101.GetStage() < 70 )
		debug.trace( "UDGP 2.0.2 Retroactive Updates Complete" )
		UDGPTracking.LastVersion = 202
		Retro203.Process()
		Stop()
		Return
	EndIf

	;Bug #14658 - Ferry system missing topic Property
	FerrySystem.DialogueCarriageChatterTopic = DialogueCarriageChatterTopic
	
	;Bug #14798 - Auriel's Bow should count toward Daedric artifacts
	BowAlias.AchievementsQuest = AchievementsQuest
	if( DLC1VQ07.GetStage() >= 200 )
		AchievementsQuest.IncDaedricArtifacts()
		Crown.TryToEnable() ;Bug #14881
	EndIf
	
	;Bug #14794 - Hide & Seek picks advisors instead of merchants
	DLCRadiant.DisguisedVampireActorBases[0] = DLC1RadiantDisguisedVampireMerchant
	
	;Bug #4783 - Serana is not supposed to allow the "Wait here" option during DLC1VQ07. Get her back.
	if( DLC1VQ07.IsRunning() )
		if( DLC1VQ07.GetStage() >= 10 && DLC1VQ07.GetStage() < 200 )
			if( Serana.GetActorReference().GetActorValue("WaitingForPlayer") == 1 )
				MM.StopWaiting()
			EndIf
			
			Serana.GetReference().MoveTo(Game.GetPlayer())
			if (dfScript.pPlayerFollowerCount.GetValueInt() > 0 && dfScript.pFollowerAlias.GetActorReference() != None && dfScript.pFollowerAlias.GetActorReference() != Serana.GetActorReference())
				dfScript.DismissFollower()
			endif
			
			MM.LockIn()
			MM.IsWillingToWait = False
			MM.CanBeDismissed = False
		EndIf
	EndIf

	debug.trace( "UDGP 2.0.2 Retroactive Updates Complete" )
	UDGPTracking.LastVersion = 202
	Retro203.Process()
	Stop()
EndFunction
