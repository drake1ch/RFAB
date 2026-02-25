scriptName C01QuestScript extends CompanionsStoryQuest conditional

weapon property FarkasBaseRangedWeapon auto
actor property Farkas auto
spell property WerewolfChangeFX auto
Bool property ObserverDismissed auto conditional
message property TempMessage auto
referencealias property AmbushFighter5 auto
Bool property ObserverCloseBy auto conditional
idle property IdleWerewolfTransformation auto
scene property ObserverGoesNuts auto
Bool property ObserverReadyForReveal auto conditional
Bool property DogsOutOfTheBag auto conditional
Bool property DoRealTransform = false auto
outfit property FarkasOutfit auto
weapon property AelaBaseRangedWeapon auto
faction property SilverHandFaction auto
faction property dunPrisonerFaction auto
Bool property SkjorGaveLowdown auto conditional
keyword property WeapTypeBow auto
outfit property AelaOutfit auto
referencealias property AmbushFighter2 auto
Bool property FakeFight = true auto
Bool property ObserverTransform auto conditional
objectreference property ObserverCompensationPoint auto conditional
weapon property FarkasBaseMeleeWeapon auto
weapon property AelaBaseMeleeWeapon auto
Bool property AmbushLeverPulled auto conditional
scene property PostAmbush auto
Bool property PlayerInAmbushSpace auto conditional
referencealias property AmbushFighter4 auto
armor property WolfSkinFXArmor auto
referencealias property Observer auto
faction property SilverHandFactionPacified auto
referencealias property ObserverLycanStorage auto
quest property C02Kicker auto
Bool property PlayerWalkedAwayFromFromOffer auto conditional
referencealias property AmbushFighter3 auto
race property WerewolfRace auto
actor property Aela auto
referencealias property DebugFollower auto
scene property AmbushScene auto
referencealias property AmbushFighter1 auto

race __observerOriginalRace
Bool __transformTracked = false
Bool __observerWeaponWasBow = false


function OnAnimationEvent(objectreference akSource, String asEventName)

	if asEventName == "SetRace" && akSource == Observer.GetReference()
		self.ObserverActuallyTransform()
	endIf
endFunction

function ObserverDropWeapon()

	actor obs = Observer.GetActorReference()
	weapon observerWeapon = obs.GetEquippedWeapon(false)
	objectreference obsWeapRef = obs.DropObject(observerWeapon as form, 1)
	if obsWeapRef.HasKeyword(WeapTypeBow)
		__observerWeaponWasBow = true
	endIf
endFunction

Function FightStart()
	Actor af1 = AmbushFighter1.GetActorReference()
	Actor af2 = AmbushFighter2.GetActorReference()
	Actor af3 = AmbushFighter3.GetActorReference()
	Actor af4 = AmbushFighter4.GetActorReference()
	Actor af5 = AmbushFighter5.GetActorReference()
	Actor obs = Observer.GetActorReference()

	af1.RemoveFromFaction(SilverHandFactionPacified)
	af2.RemoveFromFaction(SilverHandFactionPacified)
	af3.RemoveFromFaction(SilverHandFactionPacified)
	af4.RemoveFromFaction(SilverHandFactionPacified)
	af5.RemoveFromFaction(SilverHandFactionPacified)
	af1.RemoveFromFaction(dunPrisonerFaction)
	af2.RemoveFromFaction(dunPrisonerFaction)
	af3.RemoveFromFaction(dunPrisonerFaction)
	af4.RemoveFromFaction(dunPrisonerFaction)
	af5.RemoveFromFaction(dunPrisonerFaction)
	af1.SetGhost(false)
	af2.SetGhost(false)
	af3.SetGhost(false)
	af4.SetGhost(false)
	af5.SetGhost(false)

	af1.AddToFaction(SilverHandFaction)
	af2.AddToFaction(SilverHandFaction)
	af3.AddToFaction(SilverHandFaction)
	af4.AddToFaction(SilverHandFaction)
	af5.AddToFaction(SilverHandFaction)

	af1.StartCombat(obs)
	af2.StartCombat(obs)
	af3.StartCombat(obs)
	af4.StartCombat(obs)
	af5.StartCombat(obs)

	obs.StartCombat(af3)

	; temp
	if (FakeFight)
		debug.MessageBox("TEMP: Werewolves are awesome; fight ends.")
		af1.ForceAV("health", 1)
		af2.ForceAV("health", 1)
		af3.ForceAV("health", 1)
		af4.ForceAV("health", 1)
		af5.ForceAV("health", 1)

		Utility.Wait(0.5)
		af1.Kill(obs)
		Utility.Wait(0.5)
		af2.Kill(obs)
		Utility.Wait(0.5)
		af3.Kill(obs)
		Utility.Wait(0.5)
		af4.Kill(obs)
		Utility.Wait(0.5)
		af5.Kill(obs)
	else
		af1.ForceAV("health", 1)
		af2.ForceAV("health", 1)
		af3.ForceAV("health", 1)
		af4.ForceAV("health", 1)
		af5.ForceAV("health", 1)
	endif

	AmbushFighter1.GetActorReference().ClearLookAt()
	AmbushFighter2.GetActorReference().ClearLookAt()
	AmbushFighter3.GetActorReference().ClearLookAt()
	AmbushFighter4.GetActorReference().ClearLookAt()
	AmbushFighter5.GetActorReference().ClearLookAt()

EndFunction

function ObserverDoTransform()

	actor obs = Observer.GetActorReference()
	__observerOriginalRace = obs.GetActorBase().GetRace()
	obs.GetActorBase().SetInvulnerable(true)
	WerewolfChangeFX.Cast(obs as objectreference, none)
	self.RegisterForAnimationEvent(obs as objectreference, "SetRace")
	utility.Wait(1 as Float)
	self.ObserverActuallyTransform()
endFunction

function AmbusherKilled()

	if AmbushFighter1.GetActorReference().IsDead() && AmbushFighter2.GetActorReference().IsDead() && AmbushFighter3.GetActorReference().IsDead() && AmbushFighter4.GetActorReference().IsDead() && AmbushFighter5.GetActorReference().IsDead()
		Observer.GetActorReference().GetActorBase().SetInvulnerable(false)
		Observer.GetActorReference().SetGhost(false)
		Observer.GetActorReference().StopCombatAlarm()
		game.GetPlayer().StopCombatAlarm()
		PostAmbush.Start()
	endIf
endFunction

function Teardown()

	(CentralQuest as companionshousekeepingscript).DustmansCairn.Clear()
	DebugFollower.Clear()
	parent.Teardown()
endFunction

function PlayerEnteredAmbushZone(Bool entered)

	if entered
		PlayerInAmbushSpace = true
		Observer.GetActorReference().SetPlayerTeammate(false, false)
		Observer.GetActorReference().EvaluatePackage()
	else
		PlayerInAmbushSpace = false
		Observer.GetActorReference().SetPlayerTeammate(true, false)
		Observer.GetActorReference().EvaluatePackage()
	endIf
endFunction

function AmbushPrep()

	actor obs = Observer.GetActorReference()
	obs.ResetHealthAndLimbs()
	obs.SetGhost(true)
	actor af1 = AmbushFighter1.GetActorReference()
	actor af2 = AmbushFighter2.GetActorReference()
	actor af3 = AmbushFighter3.GetActorReference()
	actor af4 = AmbushFighter4.GetActorReference()
	actor af5 = AmbushFighter5.GetActorReference()
	af1.Enable(false)
	af2.Enable(false)
	af3.Enable(false)
	af4.Enable(false)
	af5.Enable(false)
	af1.SetGhost(true)
	af2.SetGhost(true)
	af3.SetGhost(true)
	af4.SetGhost(true)
	af5.SetGhost(true)
	af1.SetLookAt(obs as objectreference, true)
	af2.SetLookAt(obs as objectreference, true)
	af3.SetLookAt(obs as objectreference, true)
	af4.SetLookAt(obs as objectreference, true)
	af5.SetLookAt(obs as objectreference, true)
endFunction

function ObserverActuallyTransform()

	if __transformTracked
		return 
	endIf
	__transformTracked = true
	ObserverTransform = false
	DogsOutOfTheBag = true
	AmbushScene.Stop()
	self.FightStart()
endFunction

function ObserverTurnBack()

	if Observer.GetActorReference().GetActorBase().GetRace() == WerewolfRace
		actor obs = Observer.GetActorReference()
		obs.SetRace(__observerOriginalRace)
		if obs.GetItemCount(WolfSkinFXArmor as form) > 0
			obs.Removeitem(WolfSkinFXArmor as form, 1, true, none)
		endIf
		__observerOriginalRace = none
		ObserverLycanStorage.GetReference().RemoveAllItems(Observer.GetActorReference() as objectreference, false, false)
		if obs == Aela
			obs.SetOutfit(AelaOutfit, false)
			if __observerWeaponWasBow
				obs.AddItem(AelaBaseRangedWeapon as form, 1, false)
				obs.EquipItem(AelaBaseRangedWeapon as form, false, false)
			else
				obs.AddItem(AelaBaseMeleeWeapon as form, 1, false)
				obs.EquipItem(AelaBaseMeleeWeapon as form, false, false)
			endIf
		elseIf obs == Farkas
			obs.SetOutfit(FarkasOutfit, false)
			if __observerWeaponWasBow
				obs.AddItem(FarkasBaseRangedWeapon as form, 1, false)
				obs.EquipItem(FarkasBaseRangedWeapon as form, false, false)
			else
				obs.AddItem(FarkasBaseMeleeWeapon as form, 1, false)
				obs.EquipItem(FarkasBaseMeleeWeapon as form, false, false)
			endIf
		endIf
	endIf
	Observer.GetActorReference().SetPlayerTeammate(true, true)
endFunction

function Init()

	actor selectedObserver = (CentralQuest as companionshousekeepingscript).GetFavoriteQuestgiver()
	selectedObserver = (CentralQuest as companionshousekeepingscript).Farkas.GetActorReference()
	Observer.ForceRefTo(selectedObserver as objectreference)
	(CentralQuest as companionshousekeepingscript).TrialObserver.ForceRefTo(Observer.GetReference())
	DebugFollower.ForceRefTo(selectedObserver as objectreference)
	actor af1 = AmbushFighter1.GetActorReference()
	actor af2 = AmbushFighter2.GetActorReference()
	actor af3 = AmbushFighter3.GetActorReference()
	actor af4 = AmbushFighter4.GetActorReference()
	actor af5 = AmbushFighter5.GetActorReference()
	af1.AddToFaction(SilverHandFactionPacified)
	af2.AddToFaction(SilverHandFactionPacified)
	af3.AddToFaction(SilverHandFactionPacified)
	af4.AddToFaction(SilverHandFactionPacified)
	af5.AddToFaction(SilverHandFactionPacified)
	af1.AddToFaction(dunPrisonerFaction)
	af2.AddToFaction(dunPrisonerFaction)
	af3.AddToFaction(dunPrisonerFaction)
	af4.AddToFaction(dunPrisonerFaction)
	af5.AddToFaction(dunPrisonerFaction)
	af1.RemoveFromFaction(SilverHandFaction)
	af2.RemoveFromFaction(SilverHandFaction)
	af3.RemoveFromFaction(SilverHandFaction)
	af4.RemoveFromFaction(SilverHandFaction)
	af5.RemoveFromFaction(SilverHandFaction)
endFunction
