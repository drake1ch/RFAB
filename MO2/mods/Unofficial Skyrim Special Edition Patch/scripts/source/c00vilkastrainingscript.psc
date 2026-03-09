Scriptname C00VilkasTrainingScript extends Quest Conditional

Quest Property ParentQuest auto
bool Property VilkasShouldForceGreet auto conditional
Faction Property CombatFaction auto
Faction Property HateFaction auto

ReferenceAlias Property Vilkas auto
ReferenceAlias Property Sword auto ; on C00
ReferenceAlias Property QuestSword auto ; on C00

float Property VilkasConfidence auto

Function StartTheFight()
	VilkasShouldForceGreet = false
	Vilkas.GetActorReference().BlockActivation(true)
	(Vilkas as C00TrainerScript).ResetHits()
	Vilkas.GetActorReference().EvaluatePackage()
	VilkasConfidence = Vilkas.GetActorReference().GetAV("confidence")
	Vilkas.GetActorReference().SetAV("confidence", 4) ; foolhardy
	;USKP 2.0.6 - To stop him from using combat taunts temporarily.
	Vilkas.GetActorReference().SetPlayerTeammate()
	Vilkas.GetActorReference().AddToFaction(HateFaction)
	Vilkas.GetActorReference().StartCombat(Game.GetPlayer())
EndFunction

Function StopTheFight()
	;USKP 2.0.6 - To stop him from using combat taunts temporarily.
	Vilkas.GetActorReference().SetPlayerTeammate(false)
	Vilkas.GetActorReference().BlockActivation(false)
	Vilkas.GetActorReference().StopCombat()
	Vilkas.GetActorReference().SetAV("confidence", VilkasConfidence)
	Vilkas.GetActorReference().RemoveFromFaction(HateFaction)
	Vilkas.GetActorReference().ResetHealthAndLimbs()

	VilkasShouldForceGreet = true
	Vilkas.GetActorReference().EvaluatePackage()
EndFunction

Function PassTheSword()
	ObjectReference s = Sword.GetReference()
	(ParentQuest as CompanionsHousekeepingScript).VilkasHasHisSwordBack = False
	QuestSword.ForceRefTo(s)
	Game.GetPlayer().AddItem(s)
EndFunction


Function PlayerSheathe()
	Game.DisablePlayerControls(abMovement = false, abMenu = false, abActivate = false, abFighting = true)
	Utility.Wait(5)
	Game.EnablePlayerControls()
EndFunction
