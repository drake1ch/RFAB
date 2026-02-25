;/ Decompiled by Champollion V1.0.1
Source   : tos_DLC_ArenaQuestScript.psc
Modified : 2013-03-31 00:07:10
Compiled : 2013-03-31 00:07:13
User     : Callum
Computer : CALLUM-PC
/;
scriptName tos_DLC_ArenaQuestScript extends Quest conditional

;-- Properties --------------------------------------
referencealias property tos_PlayerSpawnAlias auto conditional
globalvariable property tos_GlobalXP auto
globalvariable property tos_WhichChampion auto
Float property tos_XP auto conditional
referencealias property tos_Combatant01Alias auto conditional
referencealias property tos_NPCMarker auto conditional
globalvariable property tos_AnyQuestRunning auto
referencealias property tos_ClutterReward auto conditional
globalvariable property tos_EnemiesKilled auto
globalvariable property tos_DLC_PaymentNeeded auto
location property tos_CurrentLoc auto conditional hidden
referencealias property tos_EnemySpawn01Alias auto conditional
referencealias property tos_RedguardAlias auto conditional
globalvariable property tos_ChampionRunning auto
referencealias property tos_CombatantChampionAlias auto
referencealias property tos_Combatant03Alias auto conditional
referencealias property tos_NordFAlias auto conditional
referencealias property tos_PlayerBaseSpawnAlias auto conditional
globalvariable property tos_ChampionAvailable auto
message property tos_CantMoveMSG auto conditional
referencealias property tos_TeamSpawn01Alias auto conditional
referencealias property tos_NordMAlias auto conditional
referencealias property tos_EnemySpawn02Alias auto conditional
Quest property tos_MyQuest auto conditional
referencealias property tos_Combatant02Alias auto conditional
Bool property tos_DLC_TeamFight auto conditional
referencealias property tos_PlayerPrepSpawnAlias auto conditional
referencealias property tos_EnemySpawn03Alias auto conditional
referencealias property tos_TeamSpawn02Alias auto conditional
cell property tos_ArenaPrepCell auto conditional
cell property tos_ArenaEnemyCell auto conditional
musictype property MUSReward auto
objectreference property tos_PitMasterSpawn auto conditional
cell property tos_ArenaCell auto conditional
referencealias property tos_PitMasterAlias auto conditional
globalvariable property tos_PostFightGlobal auto
Quest property tos_PostQuest auto conditional

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function QuitArena() ;весь код всех функций ниже на 99% схож с tos_ArenaQuestScript, а мне впадлу переносить комментарии оттуда. Хз, зачем автор мода сделал копию.

	;tos_MyQuest.SetObjectiveFailed(0, true)
	;tos_ChampionRunning.SetValue(0.000000)
	;game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
	;utility.Wait(2 as Float)
	;game.FadeOutGame(true, true, 0.000000, 2 as Float)
	;utility.Wait(0.700000)
	;game.GetPlayer().MoveTo(tos_PlayerBaseSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
	;self.ClearNPCAlias()
	;game.FadeOutGame(false, true, 2 as Float, 2 as Float)
	;utility.Wait(2 as Float)
	;tos_Combatant01Alias.GetActorReference().Reset(none)
	;tos_Combatant02Alias.GetActorReference().Reset(none)
	;tos_Combatant03Alias.GetActorReference().Reset(none)
	;tos_CombatantChampionAlias.GetActorReference().Reset(none)
	;tos_ArenaCell.Reset()
	;tos_ArenaPrepCell.Reset()
	;tos_ArenaEnemyCell.Reset()
	;game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
	;tos_AnyQuestRunning.SetValue(0.000000)
	;tos_MyQuest.Stop()
endFunction

; Skipped compiler generated GetState

function EndArena()

	while game.GetPlayer().GetActorValue("InventoryWeight") > game.GetPlayer().GetActorValue("CarryWeight")
		tos_CantMoveMSG.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		utility.Wait(2 as Float)
	endWhile
	tos_MyQuest.SetObjectiveCompleted(5, true)
	tos_GlobalXP.SetValue(tos_GlobalXP.GetValue() + tos_XP)
	;tos_PostFightGlobal.SetValue(1.00000)
	tos_PitMasterAlias.GetActorReference().EvaluatePackage()
	MUSReward.Add()
	game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
	tos_EnemiesKilled.SetValue(0.000000)
	utility.Wait(2 as Float)
	game.FadeOutGame(true, true, 0.000000, 1 as Float)
	utility.Wait(0.700000)

	if tos_DLC_TeamFight == true && tos_ChampionRunning.GetValue() != 1.00000
		self.MoveNPCsFrom()
	endIf

	if tos_ChampionRunning.GetValue() == 1.00000
		game.GetPlayer().MoveTo(tos_PlayerBaseSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		tos_PitMasterAlias.GetReference().MoveTo(tos_NPCMarker.GetReference(), 0.000000, 0.000000, 0.000000, true)
		tos_PitMasterAlias.Clear()
		game.FadeOutGame(false, true, 1 as Float, 1 as Float)
		tos_MyQuest.SetStage(200)
		tos_CombatantChampionAlias.GetActorReference().Reset(none)
		tos_PostFightGlobal.SetValue(1.00000)
		tos_ChampionRunning.SetValue(0)
		utility.Wait(1 as Float)
		game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
		tos_AnyQuestRunning.SetValue(0.000000)
		tos_PostFightGlobal.SetValue(0.000000)
		tos_MyQuest.Stop()
		tos_PostQuest.Start()
	else 
		Game.GetPlayer().MoveTo(tos_PlayerPrepSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		tos_MyQuest.SetObjectiveCompleted(5, true)
		tos_PostFightGlobal.SetValue(0.000000)
		tos_NordFAlias.Clear()
		tos_NordMAlias.Clear()
		tos_RedguardAlias.Clear()
		tos_Combatant01Alias.GetActorReference().Reset(none)
		tos_Combatant02Alias.GetActorReference().Reset(none)
		tos_Combatant03Alias.GetActorReference().Reset(none)
		tos_ChampionRunning.SetValue(1)
		game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
	endif

endFunction

function ReturnToBase()

	while game.GetPlayer().GetActorValue("InventoryWeight") > game.GetPlayer().GetActorValue("CarryWeight")
		tos_CantMoveMSG.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		utility.Wait(2 as Float)
	endWhile
	tos_MyQuest.SetObjectiveCompleted(10, true)
	tos_PostFightGlobal.SetValue(0.000000)
	if tos_ChampionRunning.GetValue() == 1.00000
		tos_ChampionAvailable.SetValue(tos_ChampionAvailable.GetValue() - 1.00000)
		tos_ChampionRunning.SetValue(0.000000)
		tos_WhichChampion.SetValue(tos_WhichChampion.GetValue() + 1.00000)
		tos_ClutterReward.GetReference().Disable(false)
	endIf
	game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
	utility.Wait(2 as Float)
	tos_MyQuest.SetStage(200)
	game.FadeOutGame(true, true, 0.000000, 2 as Float)
	utility.Wait(0.700000)
	game.GetPlayer().MoveTo(tos_PlayerBaseSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
	self.ClearNPCAlias()
	game.FadeOutGame(false, true, 1 as Float, 1 as Float)
	utility.Wait(1 as Float)
	tos_Combatant01Alias.GetActorReference().Reset(none)
	tos_Combatant02Alias.GetActorReference().Reset(none)
	tos_Combatant03Alias.GetActorReference().Reset(none)
	tos_CombatantChampionAlias.GetActorReference().Reset(none)
	tos_ArenaCell.Reset()
	tos_ArenaPrepCell.Reset()
	tos_ArenaEnemyCell.Reset()
	game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
	tos_AnyQuestRunning.SetValue(0.000000)
	tos_MyQuest.Stop()
endFunction

; Skipped compiler generated GotoState

function TravelToArena()

	tos_AnyQuestRunning.SetValue(1.00000)
	tos_CurrentLoc = game.GetPlayer().GetCurrentLocation()
	while game.GetPlayer().GetActorValue("InventoryWeight") > game.GetPlayer().GetActorValue("CarryWeight") && tos_CurrentLoc == game.GetPlayer().GetCurrentLocation()
		tos_CantMoveMSG.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		utility.Wait(2 as Float)
	endWhile
	if tos_CurrentLoc == game.GetPlayer().GetCurrentLocation()
		game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
		game.FadeOutGame(true, true, 0.000000, 2 as Float)
		utility.Wait(0.700000)
		game.GetPlayer().MoveTo(tos_PlayerPrepSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		self.MoveNPCsTo()
		game.FadeOutGame(false, true, 3 as Float, 2 as Float)
		utility.Wait(2 as Float)
		game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
		tos_MyQuest.SetObjectiveDisplayed(0, true, false)
	else
		tos_AnyQuestRunning.SetValue(0.000000)
		tos_MyQuest.Stop()
	endIf

endFunction

function MoveNPCsTo()

	tos_PitMasterAlias.GetReference().MoveTo(tos_PitMasterSpawn, 0.000000, 0.000000, 0.000000, true)
	tos_NordFAlias.GetReference().MoveTo(tos_NPCMarker.GetReference(), 0.000000, 0.000000, 0.000000, true)
	tos_NordMAlias.GetReference().MoveTo(tos_NPCMarker.GetReference(), 0.000000, 0.000000, 0.000000, true)
	tos_RedguardAlias.GetReference().MoveTo(tos_NPCMarker.GetReference(), 0.000000, 0.000000, 0.000000, true)
endFunction

function ClearNPCAlias()

	tos_PitMasterAlias.Clear()
	tos_NordFAlias.Clear()
	tos_NordMAlias.Clear()
	tos_RedguardAlias.Clear()

endFunction

function MoveNPCsFrom()

	tos_NordFAlias.GetReference().MoveTo(tos_NPCMarker.GetReference(), 0.000000, 0.000000, 0.000000, true)
	tos_NordMAlias.GetReference().MoveTo(tos_NPCMarker.GetReference(), 0.000000, 0.000000, 0.000000, true)
	tos_RedguardAlias.GetReference().MoveTo(tos_NPCMarker.GetReference(), 0.000000, 0.000000, 0.000000, true)
endFunction

function StartArena()

	tos_CurrentLoc = game.GetPlayer().GetCurrentLocation()
	while game.GetPlayer().GetActorValue("InventoryWeight") > game.GetPlayer().GetActorValue("CarryWeight") && tos_CurrentLoc == game.GetPlayer().GetCurrentLocation()
		tos_CantMoveMSG.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		utility.Wait(2 as Float)
	endWhile
	if tos_CurrentLoc == game.GetPlayer().GetCurrentLocation()
		tos_MyQuest.SetObjectiveCompleted(0, true)
		;game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
		utility.Wait(2 as Float)
		game.FadeOutGame(true, true, 0.000000, 1 as Float)
		utility.Wait(0.700000)
		game.GetPlayer().MoveTo(tos_PlayerSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		if tos_DLC_TeamFight == true && tos_ChampionRunning.GetValue() != 1.00000
			self.MoveNPCsToArena()
		endIf
		if tos_ChampionRunning.GetValue() == 1.00000
			tos_CombatantChampionAlias.GetReference().MoveTo(tos_EnemySpawn01Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		else
			tos_Combatant01Alias.GetReference().MoveTo(tos_EnemySpawn01Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
			tos_Combatant02Alias.GetReference().MoveTo(tos_EnemySpawn02Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
			tos_Combatant03Alias.GetReference().MoveTo(tos_EnemySpawn03Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		endIf
		game.FadeOutGame(false, true, 0 as Float, 0.75 as Float)
		;utility.Wait(2 as Float)
		;game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
		tos_MyQuest.SetObjectiveDisplayed(5, true, false)
		tos_DLC_PaymentNeeded.SetValue(1.00000)
		tos_ClutterReward.GetReference().GetParentCell().Reset()
		utility.Wait(0.750000)
		if tos_ChampionRunning.GetValue() == 1.00000
			tos_CombatantChampionAlias.GetActorReference().StartCombat(game.GetPlayer())
		else
			tos_Combatant01Alias.GetActorReference().StartCombat(game.GetPlayer())
			tos_Combatant02Alias.GetActorReference().StartCombat(game.GetPlayer())
			tos_Combatant03Alias.GetActorReference().StartCombat(game.GetPlayer())
			if tos_DLC_TeamFight == true
				tos_RedguardAlias.GetActorReference().StartCombat(tos_Combatant01Alias.GetActorReference())
				tos_NordFAlias.GetActorReference().StartCombat(tos_Combatant02Alias.GetActorReference())
				tos_NordMAlias.GetActorReference().StartCombat(tos_Combatant03Alias.GetActorReference())
			endIf
		endIf
	else
		tos_AnyQuestRunning.SetValue(0.000000)
		tos_MyQuest.Stop()
	endIf
endFunction

function MoveNPCsToArena()

	tos_RedguardAlias.GetReference().MoveTo(tos_TeamSpawn01Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
	if utility.RandomInt(0, 100) < 50
		tos_NordMAlias.GetReference().MoveTo(tos_TeamSpawn02Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
	else
		tos_NordFAlias.GetReference().MoveTo(tos_TeamSpawn02Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
	endIf
endFunction
