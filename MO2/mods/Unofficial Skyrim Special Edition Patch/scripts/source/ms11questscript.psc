Scriptname MS11QuestScript extends Quest Conditional

bool Property QuestionedWitness1 Auto Conditional
bool Property QuestionedWitness2 Auto Conditional
bool Property QuestionedWitness3 Auto Conditional
bool Property PlayerHasAuthority Auto Conditional
bool Property PlayerHasFoundHorridRoom Auto Conditional
bool Property CalixtoDead Auto Conditional
bool Property SentViolaToHjerim Auto Conditional
bool Property GotRedHerringFromCalixto Auto Conditional
bool Property PlayerInStoneQuarter Auto Conditional
bool Property PlayerInMurderZone Auto Conditional ; best variable name ever?

bool Property PlayerReadJournal2 auto conditional
bool Property GetInHjerimTovaPointer auto conditional
bool Property GetInHjerimUlfricPointer auto conditional
bool Property GetInHjerimHousePointer auto conditional
bool Property InvestigateViolaPointer auto conditional
bool Property InvestigateCalixtoPointer auto conditional
bool Property GuardGavePlayerStory auto conditional

bool Property ViolaConversationShunt = false auto conditional
bool Property PlayerTalkedToViolaAboutButcher auto conditional

bool Property SiegeOfWindhelmTakingPlace auto conditional

ReferenceAlias Property Calixto auto
ReferenceAlias Property Arivanya auto
ReferenceAlias Property PotentialThirdVictim auto
ReferenceAlias Property FinalVictim auto

; 77465: bad deletion of disabled corpse
ReferenceAlias Property InitialVictimBody auto
ActorBase Property AlternateBody auto
ReferenceAlias Property CrimeScene auto
Faction Property HarmlessCorpse auto
; /77465

Package Property VictimWanderPackage auto
Scene Property CalixtoKILLKILLKILLScene auto
Armor Property InnocuousAmulet auto
Armor Property NecromancersAmulet auto

Quest Property ShadowQuest auto
ObjectReference Property HjerimDoor auto

ReferenceAlias Property Helgird auto
ObjectReference Property OriginalBody auto
ObjectReference Property HallOfDeadBrowseMarker auto
bool Property BodyIsInHallOfDead auto conditional
bool Property TalkedToHelgird auto conditional

bool Property WuunferthArrested auto conditional

Perk Property Investigator auto

ActorBase Property USKPSecondAlternateBody Auto ;Added by USKP 1.2.1
ReferenceAlias Property BodyInHallOfDead Auto ;Added by USKP 1.2.1
ReferenceAlias Property SecondVictimEssential Auto ;Added by USKP 2.0.4
bool Property MS11QuestLogged Auto Conditional ;Added by USKP 2.0.4
bool Property USKPAltBodyCreated Auto ;Added by USKP 2.0.4
bool Property USKPSecondAltBodyCreated Auto ;Added by USKP 2.0.4
bool Property USKPButcherFlyerSeen Auto Conditional ;USKP 2.1.3 Bug #19281
bool Property USKPStrangeAmuletSeen Auto Conditional ;USKP 2.1.3 Bug #19281
bool Property USLEEPSoldAmulet Auto Conditional ;USLEEP 3.0.5 Bug #20930

Function Setup()
	; set up investigation stuff
	Game.GetPlayer().AddPerk(Investigator)

	; change Hjerim door from impossible to very hard
	HjerimDoor.SetLockLevel(100)
	
; 	Debug.Trace("MS11: Kicked off.")
EndFunction

; 77465: bad deletion of disabled corpse
Function CheckForDeletedBody()
;	Debug.Trace("MS11: Checking for presence of bug 77465.")
	if (InitialVictimBody.GetReference() == None)
;		Debug.Trace("MS11: 77465 detected; correcting.")
		Actor alt = CrimeScene.GetReference().PlaceAtMe(AlternateBody) as Actor
		alt.AddToFaction(HarmlessCorpse)
		alt.Kill()
		InitialVictimBody.ForceRefTo(alt)
;		Debug.Trace("MS11: Crime scene is " + CrimeScene)
;		Debug.Trace("MS11: Alt is " + alt)
		USKPAltBodyCreated = True
	endif
EndFunction
; /77465

;Hey guys, ya missed a body! - USKP 1.2.1
Function USKPCheckForDeletedBody()
	if (BodyInHallOfDead.GetReference() == None)
		Actor alt = HallOfDeadBrowseMarker.PlaceAtMe(USKPSecondAlternateBody) as Actor
		alt.AddToFaction(HarmlessCorpse)
		alt.Kill()
		BodyInHallOfDead.ForceRefTo(alt)
		USKPSecondAltBodyCreated = True
	endif
EndFunction

Function DisableIfNotCompleted(int objective)
	if (!IsObjectiveCompleted(objective))
		SetObjectiveDisplayed(objective, 0)
	endif
EndFunction

Function ResolveObjective(int complete, int display)
	Quest targetQuest = None
	if (ShadowQuest.IsRunning())
		; we're running MS11b based on the quest "resuming"
		targetQuest = ShadowQuest
	else
		; player is good detective
		targetQuest = self
	endif
	
	if (complete != 0)
; 		Debug.Trace("MS11: Setting obj " + complete + " completed on " + targetQuest)
		targetQuest.SetObjectiveCompleted(complete, true)
	endif
	if (display != 0)
; 		Debug.Trace("MS11: Setting obj " + display + " displayed on " + targetQuest)
		targetQuest.SetObjectiveDisplayed(display, true)
	endif
EndFunction

Function MoveBody()
	if (!BodyIsInHallOfDead)
		; move Susanna's body to the hall of the dead
		BodyIsInHallOfDead = true
		InitialVictimBody.GetReference().Disable()
		if( USKPAltBodyCreated )
			InitialVictimBody.GetReference().Delete() ; USKP 2.0.4 - It's a PlaceAtMe ref.
		EndIf
		HallOfDeadBrowseMarker.Enable()
		USKPCheckForDeletedBody() ;Added by USKP 1.2.1
		Actor helgirdAct = Helgird.GetActorReference()
		helgirdAct.MoveTo(HallOfDeadBrowseMarker)
		helgirdAct.EvaluatePackage()
	endif
EndFunction

Function CleanupHallOfDead()
	if (BodyIsInHallOfDead)
		BodyIsInHallOfDead = false
		HallOfDeadBrowseMarker.Disable()
		if( USKPSecondAltBodyCreated )
			BodyInHallOfDead.GetReference().Disable() ;Added by USKP 1.2.1
			BodyInHallofDead.GetReference().Delete() ;Added by USKP 2.0.4 - It's a PlaceAtMe ref.
		EndIf
		Helgird.TryToEvaluatePackage()
	endif
EndFunction

Function SetupStakeout()
	; give him the real article
	if (Calixto.GetActorReference().GetItemCount(InnocuousAmulet) > 0)
		Calixto.GetActorReference().RemoveItem(InnocuousAmulet, 1)
		Calixto.GetActorReference().AddItem(NecromancersAmulet, 1)
	endif
	
	; pick the poor victim
	if (!Arivanya.GetActorReference().IsDead())
		SecondVictimEssential.Clear() ;USKP 2.0.4
		FinalVictim.ForceRefTo(Arivanya.GetActorReference())
	else
		FinalVictim.ForceRefTo(PotentialThirdVictim.GetActorReference())
	endif
	
	; just start the scene -- anything more fancy just breaks :-(
	CalixtoKILLKILLKILLScene.Start()

	; start checking as to when to start the scene
	; RegisterForUpdate(10)
EndFunction


Function Teardown()
	Game.GetPlayer().RemovePerk(Investigator)
EndFunction

;stubbed in by jduvall
function CivilWarBattle(bool BattleActive)
{When called the Civil War siege script is starting or stopping in Windhelm. BattleActive = true means starting, = false means stopping.}

; 	debug.trace("MS11QuestScript CivilWarBattle(" + BattleActive + ")")

	SiegeOfWindhelmTakingPlace = BattleActive

EndFunction

