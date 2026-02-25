;/ Decompiled by Champollion V1.0.1
Source   : QF_MS02_00040A5E.psc
Modified : 2024-06-25 21:15:33
Compiled : 2024-06-25 21:15:34
User     : user
Computer : WIN-2V1G9CFBKBS
/;
scriptName QF_MS02_00040A5E extends Quest hidden

;-- Properties --------------------------------------
referencealias property Alias_PlayerBed auto
referencealias property Alias_MarkarthRuinsDoor auto
actorbase property pNeposActorBase auto
faction property pCidhnaMineCombatFaction auto
crimeguardsscript property DialogueCrimeGuards auto
faction property ForswornAttack auto
referencealias property Alias_Uraccen auto
achievementsscript property AchievementsQuest auto
referencealias property Alias_BorkulKey auto
scene property pEscapeScene auto
faction property MS02GrisvarEnemyFaction auto
objectreference property SilverOre auto
referencealias property Alias_Urzoga auto
armor property SilverFishRing auto
referencealias property Alias_Duach auto
Quest property MS01GuardAmbushQuest auto
Quest property MS02FIN auto
referencealias property Alias_Borkul auto
faction property TownCidhnaMinePrisonerFaction auto
faction property DruadachRedoubtFaction auto
key property MS02BorkulKey auto
referencealias property Alias_Nepos auto
key property MS02MadanachKey auto
faction property MS02CidhnaMineEnemyFaction auto
referencealias property Alias_EscapeTunnelDoor auto
referencealias property Alias_MS02MadanachNote auto
referencealias property Alias_Grisvar auto
Quest property MS01 auto
referencealias property Alias_Braig auto
scene property MS02BorkulOpenDoor auto
referencealias property Alias_MadanachDoor auto
referencealias property Alias_Odvan auto
potion property pSkooma auto
referencealias property Alias_Player auto
referencealias property Alias_DoortoTunnel auto
scene property MS02GrisvarScene auto
weapon property Shiv auto
faction property pCrimeReachFaction auto
referencealias property Alias_Madanach auto
faction property CrimeFactionCidhnaMine auto
referencealias property Alias_Thonar auto
faction property pCidhnaMineFaction auto
faction property CidhnaMineCrimeFaction auto
faction property CrimeFactionReach auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_73()

	self.SetObjectiveCompleted(50, 1 as Bool)
	self.SetObjectiveDisplayed(60, 1 as Bool, false)
endFunction

function Fragment_75()

	AchievementsQuest.IncSideQuests()
	self.SetObjectiveCompleted(220, 1 as Bool)
	game.ClearPrison()
	SilverOre.Enable(false)
	Alias_Thonar.GetActorRef().SetRelationshipRank(game.GetPlayer(), 1)
	MS02FIN.Start()
	Alias_PlayerBed.GetRef().Enable(false)
	Alias_Borkul.GetActorRef().Kill(none)
	Alias_Braig.GetActorRef().Kill(none)
	Alias_Odvan.GetActorRef().Kill(none)
	Alias_Duach.GetActorRef().Kill(none)
	Alias_Uraccen.GetActorRef().Kill(none)
	Alias_Grisvar.GetActorRef().Kill(none)
	self.Stop()
endFunction

function Fragment_87()

	self.SetObjectiveCompleted(200, 1 as Bool)
	self.SetObjectiveDisplayed(210, 1 as Bool, false)
endFunction

function Fragment_83()

	self.SetObjectiveCompleted(60, 1 as Bool)
	self.SetObjectiveDisplayed(70, 1 as Bool, false)
	pEscapeScene.Start()
endFunction

function Fragment_80()

	self.SetObjectiveCompleted(25, 1 as Bool)
	self.SetObjectiveDisplayed(30, 1 as Bool, false)
endFunction

; Skipped compiler generated GotoState

function Fragment_88()

	self.SetObjectiveCompleted(210, 1 as Bool)
	self.SetObjectiveDisplayed(220, 1 as Bool, false)
endFunction

function Fragment_82()

	Alias_Grisvar.GetActorRef().AddtoFaction(MS02GrisvarEnemyFaction)
	Alias_Grisvar.GetActorRef().SetAv("Aggression", 2 as Float)
endFunction

function Fragment_84()

	Alias_EscapeTunnelDoor.GetRef().Lock(false, false)
	Alias_DoortoTunnel.GetRef().Lock(false, false)
	Alias_Borkul.GetActorRef().EvaluatePackage()
	Alias_Odvan.GetActorRef().EvaluatePackage()
	Alias_Uraccen.GetActorRef().EvaluatePackage()
	Alias_Duach.GetActorRef().EvaluatePackage()
	Alias_Braig.GetActorRef().EvaluatePackage()
endFunction

function Fragment_86()

	Alias_Madanach.GetActorRef().AddItem(MS02MadanachKey as form, 1, false)
	self.SetObjectiveCompleted(150, 1 as Bool)
	self.SetObjectiveDisplayed(200, 1 as Bool, false)
endFunction

function Fragment_79()

	if self.GetStageDone(200) == 0 as Bool
		self.SetObjectiveCompleted(10, 1 as Bool)
		self.SetObjectiveCompleted(20, 1 as Bool)
		self.SetObjectiveDisplayed(25, 1 as Bool, false)
	endIf
endFunction

function Fragment_67()

	self.SetObjectiveCompleted(40, 1 as Bool)
	self.SetObjectiveDisplayed(50, 1 as Bool, false)
	if Alias_Grisvar.GetActorRef().IsDead() == 1 as Bool
		self.SetStage(60)
	endIf
	Alias_Grisvar.GetActorRef().RemoveFromFaction(CrimeFactionCidhnaMine)
	Alias_Grisvar.GetActorRef().RemoveFromFaction(TownCidhnaMinePrisonerFaction)
	Alias_Grisvar.GetActorRef().SetCrimeFaction(none)
endFunction

function Fragment_2()

	game.GetPlayer().AddItem(MS02BorkulKey as form, 1, false)
	Alias_MadanachDoor.GetRef().Lock(false, false)
	self.SetStage(25)
endFunction

function Fragment_85()

	Alias_EscapeTunnelDoor.GetRef().Lock(false, false)
	Alias_DoortoTunnel.GetRef().Lock(false, false)
	Alias_Madanach.GetActorRef().EvaluatePackage()
endFunction

function Fragment_72()

	AchievementsQuest.IncSideQuests()
	self.SetObjectiveCompleted(70, 1 as Bool)
	game.ClearPrison()
	game.GetPlayer().AddtoFaction(DruadachRedoubtFaction)
	SilverOre.Enable(false)
	Alias_PlayerBed.GetRef().Enable(false)
	MS02FIN.Start()
	self.Stop()
endFunction

; Skipped compiler generated GetState

function Fragment_47()

	pCrimeReachFaction.SendPlayerToJail(true, true)
	Alias_PlayerBed.GetRef().Disable(false)
	SilverOre.Disable(false)
	Alias_Thonar.GetActorRef().GetActorBase().SetEssential(false)
	MS01GuardAmbushQuest.SetStage(100)
	utility.Wait(3 as Float)
	self.SetObjectiveDisplayed(10, true, false)
endFunction

function Fragment_77()

	game.GetPlayer().AddtoFaction(MS02CidhnaMineEnemyFaction)
	self.SetObjectiveFailed(10, 1 as Bool)
	self.SetObjectiveFailed(20, 1 as Bool)
	self.SetObjectiveFailed(25, 1 as Bool)
	self.SetObjectiveFailed(30, 1 as Bool)
	self.SetObjectiveFailed(40, 1 as Bool)
	self.SetObjectiveFailed(50, 1 as Bool)
	self.SetObjectiveFailed(60, 1 as Bool)
	self.SetObjectiveFailed(70, 1 as Bool)
	self.SetObjectiveDisplayed(150, 1 as Bool, false)
endFunction

function Fragment_90()

	; Empty function
endFunction

function Fragment_48()

	DialogueCrimeGuards.SetupCidhnaMine()
	MS01.SetStage(90)
	MS01.SetStage(100)
	self.SetStage(5)
endFunction

function Fragment_81()

	self.SetObjectiveCompleted(30, 1 as Bool)
	self.SetObjectiveDisplayed(40, 1 as Bool, false)
endFunction

function Fragment_78()

	self.SetObjectiveCompleted(10, 1 as Bool)
	self.SetObjectiveDisplayed(20, 1 as Bool, false)
endFunction
