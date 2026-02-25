;/ Decompiled by Champollion V1.0.1
Source   : DLC1_QF_DLC1VampireBaseIntro_0100594C.psc
Modified : 2012-05-12 10:01:21
Compiled : 2012-05-31 22:15:12
User     : builds
Computer : BUILDFARM05
/;
scriptName DLC1_QF_DLC1VampireBaseIntro_0100594C extends Quest hidden

;-- Properties --------------------------------------
LeveledItem Property Reward Auto
referencealias property Alias_StalfAlias auto
referencealias property Alias_Bloodspring auto
faction property DLC1VampireFaction auto
objectreference property RedwaterDenMapMarker auto
referencealias property TutorialThrall auto
faction property DLC1VampireIntroEnemyFaction auto
referencealias property Alias_SecretDoorParent auto
scene property DLC1VampireBaseGaranChaliceScene auto
referencealias property Alias_FilledChaliceAlias auto
ammo property ElderScrollAmmo auto
Quest property DLC1VQ03Vampire auto
dlc1vampirecastlecontrollerscript property CastleController auto
actor property Serana auto
referencealias property Alias_OrthjolfAlias auto
referencealias property Alias_GaranAlias auto
referencealias property Alias_SaloniaSpringMarker auto
faction property DLC1SeranaFaction auto
objectreference property OrthjolfSceneMarker auto
objectreference property VingalmoSceneMarker auto
referencealias property Alias_RedwaterDenDoor02 auto
referencealias property Alias_HoldingChestRef auto
referencealias property Alias_StalfSpringMarker auto
referencealias property Alias_SaloniaAlias auto
referencealias property Alias_DLC1VampireBaseIntroChaliceAlias auto
faction property PlayerFaction auto
Quest property AchievementsQuest auto
referencealias property Alias_RedwaterDenDoor auto
referencealias property Alias_VingalmoAlias auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

function Fragment_12()

	self.SetObjectiveCompleted(50, 1 as Bool)
	self.SetObjectiveDisplayed(60, 1 as Bool, false)
	Alias_RedwaterDenDoor.GetReference().Lock(false, false)
	Alias_RedwaterDenDoor02.GetReference().Lock(false, false)
	Alias_RedwaterDenDoor02.GetReference().SetLockLevel(0)
	Serana.UnequipItem(ElderScrollAmmo as form, false, false)
	Serana.RemoveItem(ElderScrollAmmo as form, 1, false, none)
endFunction

function Fragment_8()

	self.SetObjectiveDisplayed(35, 0 as Bool, false)
	self.SetObjectiveDisplayed(40, 1 as Bool, false)
	Alias_StalfAlias.GetActorReference().GetActorBase().SetEssential(false)
	Alias_SaloniaAlias.GetActorReference().GetActorBase().SetEssential(false)
	DLC1VampireIntroEnemyFaction.SetEnemy(PlayerFaction, false, false)
	CastleController.CleanSeranasRoom(true)
endFunction

function Fragment_14()

	Quest __temp = self as Quest
	dlc1vampirebaseintroquestscript kmyQuest = __temp as dlc1vampirebaseintroquestscript
	self.SetObjectiveCompleted(60, true)
	DLC1VQ03Vampire.Start()
	game.GetPlayer().RemoveItem(Alias_FilledChaliceAlias.GetReference() as form, 1, false, none)
	game.GetPlayer().AddItem(Reward, 1, false)
	self.CompleteAllObjectives()
	kmyQuest.DLC1Radiant.ChaliceFilled()
	kmyQuest.DLC1Radiant.IntroQuestCompleted(false, true)
	self.Stop()
endFunction

function Fragment_4()

	Quest __temp = self as Quest
	dlc1vampirebaseintroquestscript kmyQuest = __temp as dlc1vampirebaseintroquestscript
	self.SetObjectiveCompleted(15, 1 as Bool)
	self.SetObjectiveDisplayed(20, 1 as Bool, false)
	game.GetPlayer().AddItem(Alias_DLC1VampireBaseIntroChaliceAlias.GetReference() as form, 1, false)
	kmyQuest.DLC1Radiant.ChaliceRemoved()
	RedwaterDenMapMarker.AddToMap(false)
endFunction

function Fragment_10()

	self.SetObjectiveCompleted(40, 1 as Bool)
	self.SetObjectiveDisplayed(50, 1 as Bool, false)
endFunction

function Fragment_16()

	DLC1VampireBaseGaranChaliceScene.Start()
	self.SetObjectiveCompleted(10, true)
	self.SetObjectiveDisplayed(15, true, false)
	TutorialThrall.GetReference().Disable(false)
endFunction

function Fragment_0()

	self.SetObjectiveDisplayed(10, 1 as Bool, false)
	Alias_GaranAlias.GetActorReference().EvaluatePackage()
	Alias_GaranAlias.GetActorReference().MovetoPackageLocation()
	Alias_VingalmoAlias.GetReference().MoveTo(VingalmoSceneMarker, 0.000000, 0.000000, 0.000000, true)
	Alias_OrthjolfAlias.GetReference().MoveTo(OrthjolfSceneMarker, 0.000000, 0.000000, 0.000000, true)
endFunction

function Fragment_6()

	self.SetObjectiveCompleted(20, 1 as Bool)
	self.SetObjectiveDisplayed(30, 1 as Bool, false)
	Alias_RedwaterDenDoor.GetReference().Lock(true, false)
	Alias_SaloniaAlias.GetActorReference().RemoveFromFaction(DLC1VampireFaction)
	Alias_StalfAlias.GetActorReference().RemoveFromFaction(DLC1VampireFaction)
	Alias_SecretDoorParent.GetReference().Enable(Alias_SecretDoorParent.GetReference() as Bool)
endFunction

; Skipped compiler generated GetState

function Fragment_2()

	DLC1VampireFaction.SetAlly(DLC1SeranaFaction, false, false)
	self.SetStage(10)
endFunction
