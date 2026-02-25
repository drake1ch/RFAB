;/ Decompiled by Champollion V1.0.1
Source   : tos_ArenaQuestScript.psc
Modified : 2013-03-20 14:02:57
Compiled : 2013-03-20 14:03:01
User     : Callum
Computer : CALLUM-PC
/;
scriptName tos_ArenaQuestScript extends Quest conditional

;-- Properties --------------------------------------
Quest property tos_MyQuest auto conditional
cell property tos_ArenaEnemyCell auto conditional
referencealias property tos_Combatant02Alias auto conditional
objectreference property tos_NPCBaseSpawn auto conditional
objectreference property tos_NPCBaseSpawn2 auto conditional
referencealias property tos_EnemySpawn01Alias auto conditional
referencealias property tos_CombatantChampionAlias auto
referencealias property tos_Combatant03Alias auto conditional
location property tos_CurrentLoc auto conditional hidden
Float property tos_XP auto conditional
message property tos_CantMoveMSG auto conditional
cell property tos_ArenaPrepCell auto conditional
globalvariable property tos_ChampionRunning auto
objectreference property tos_ClutterReward auto conditional
referencealias property tos_PlayerBaseSpawnAlias auto conditional
globalvariable property tos_EnemiesKilled auto
referencealias property tos_PlayerPrepSpawnAlias auto conditional
referencealias property tos_EnemySpawn02Alias auto conditional
referencealias property tos_NordFAlias auto conditional
globalvariable property tos_ChampionAvailable auto
objectreference property tos_EnemyGate auto conditional
referencealias property tos_NPCMarker auto conditional
musictype property MUSReward auto
globalvariable property tos_PaymentNeeded auto
objectreference property tos_EnemyGate02 auto conditional
race[] property combatantRace auto
referencealias property tos_PlayerSpawnAlias auto conditional
Quest property tos_PostQuest auto conditional
globalvariable property tos_Rank auto
objectreference property tos_PitMasterSpawn auto conditional
globalvariable property tos_WhichChampion auto
globalvariable property tos_GlobalXP auto
globalvariable property tos_AnyQuestRunning auto
referencealias property tos_NordMAlias auto conditional
referencealias property tos_Combatant01Alias auto conditional
referencealias property tos_RedguardAlias auto conditional
referencealias property tos_PitMasterAlias auto conditional
referencealias property tos_EnemySpawn03Alias auto conditional
objectreference property tos_EnemyGate03 auto conditional
cell property tos_ArenaCell auto conditional
globalvariable property tos_PostFightGlobal auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function ReturnToBase() ;здесь я вроде ничего не трогал, только подскрутил время тупняка.

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
		tos_ClutterReward.Disable(false)
	endIf
	game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
	utility.Wait(2 as Float)
	tos_MyQuest.SetStage(200)
	tos_PostQuest.Start()
	game.FadeOutGame(true, true, 0.000000, 1 as Float)
	utility.Wait(0.700000)
	game.GetPlayer().MoveTo(tos_PlayerBaseSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
	self.MoveNPCsFrom()
	game.FadeOutGame(false, true, 1 as Float, 1 as Float)
	utility.Wait(0.5 as Float)
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

function MoveNPCsTo()

	tos_PitMasterAlias.GetReference().MoveTo(tos_PitMasterSpawn, 0.000000, 0.000000, 0.000000, true)
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
		;game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0) ;убрал этот прикол, что у тебя при входе в бой оружие убиралось. Ещё тоже подрезал тупняк там ниже.
		utility.Wait(2 as Float)
		game.FadeOutGame(true, true, 0.000000, 1 as Float)
		utility.Wait(0.700000)
		game.GetPlayer().MoveTo(tos_PlayerSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		if tos_ChampionRunning.GetValue() == 1.00000
			tos_CombatantChampionAlias.GetReference().MoveTo(tos_EnemySpawn01Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		else
			tos_Combatant01Alias.GetReference().MoveTo(tos_EnemySpawn01Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
			if combatantRace.find(tos_Combatant01Alias.GetActorReference().GetRace(), 0) < 0
				tos_Combatant02Alias.GetReference().MoveTo(tos_EnemySpawn02Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
			endIf
			tos_Combatant03Alias.GetReference().MoveTo(tos_EnemySpawn03Alias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		endIf
		game.FadeOutGame(false, true, 0 as Float, 0.75 as Float)
		;utility.Wait(2 as Float)
		;game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
		tos_EnemyGate.Activate(game.GetPlayer() as objectreference, false)
		tos_MyQuest.SetObjectiveDisplayed(5, true, false)
		tos_PaymentNeeded.SetValue(2.00000)
		;utility.Wait(0.750000)
		if tos_ChampionRunning.GetValue() == 1.00000 ;здесь проходит проверка глобалки, доступен ли сейчас бой с чемпивоном. Ниже будет строчка, которая переключает эту глобалку.
			tos_CombatantChampionAlias.GetActorReference().StartCombat(game.GetPlayer())
		else
			tos_Combatant01Alias.GetActorReference().StartCombat(game.GetPlayer())
			if combatantRace.find(tos_Combatant01Alias.GetActorReference().GetRace(), 0) < 0
				tos_Combatant02Alias.GetActorReference().StartCombat(game.GetPlayer())
			endIf
			tos_Combatant03Alias.GetActorReference().StartCombat(game.GetPlayer())
		endIf
	else
		tos_AnyQuestRunning.SetValue(0.000000)
		tos_MyQuest.Stop()
	endIf
endFunction

function TravelToArena()

	tos_AnyQuestRunning.SetValue(1.00000)
	tos_CurrentLoc = game.GetPlayer().GetCurrentLocation()
	while game.GetPlayer().GetActorValue("InventoryWeight") > game.GetPlayer().GetActorValue("CarryWeight") && tos_CurrentLoc == game.GetPlayer().GetCurrentLocation()
		tos_CantMoveMSG.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		utility.Wait(2 as Float)
	endWhile
	if tos_CurrentLoc == game.GetPlayer().GetCurrentLocation()
		;game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
		game.FadeOutGame(true, true, 0.000000, 1 as Float)
		utility.Wait(0.700000)
		game.GetPlayer().MoveTo(tos_PlayerPrepSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		self.MoveNPCsTo()
		game.FadeOutGame(false, true, 3 as Float, 1 as Float)
		utility.Wait(2 as Float)
		;game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
		tos_MyQuest.SetObjectiveDisplayed(0, true, false)
	else
		tos_AnyQuestRunning.SetValue(0.000000)
		tos_MyQuest.Stop()
	endIf
endFunction

function QuitArena() ;всё закомментил, а то мемас получается. "Бля, мужики, что-то я передумал драться, сегодня не в настроении, пойду-ка отсюда"

	;tos_MyQuest.SetObjectiveFailed(0, true)
	;tos_ChampionRunning.SetValue(0.000000)
	;game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
	;utility.Wait(2 as Float)
	;game.FadeOutGame(true, true, 0.000000, 1 as Float)
	;utility.Wait(0.700000)
	;game.GetPlayer().MoveTo(tos_PlayerBaseSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
	;self.MoveNPCsFrom()
	;game.FadeOutGame(false, true, 2 as Float, 1 as Float)
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

; Skipped compiler generated GotoState

function MoveNPCsFrom()

	tos_PitMasterAlias.GetReference().MoveTo(tos_NPCBaseSpawn2, 0.000000, 0.000000, 0.000000, true)
	tos_NordFAlias.GetReference().MoveTo(tos_NPCBaseSpawn2, 0.000000, 0.000000, 0.000000, true)
	tos_NordMAlias.GetReference().MoveTo(tos_NPCBaseSpawn, 0.000000, 0.000000, 0.000000, true)
	tos_RedguardAlias.GetReference().MoveTo(tos_NPCBaseSpawn, 0.000000, 0.000000, 0.000000, true)
	tos_PitMasterAlias.Clear()
	tos_NordFAlias.Clear()
	tos_NordMAlias.Clear()
	tos_RedguardAlias.Clear()

endFunction

function EndArena()

	while game.GetPlayer().GetActorValue("InventoryWeight") > game.GetPlayer().GetActorValue("CarryWeight")
		tos_CantMoveMSG.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
		utility.Wait(2 as Float)
	endWhile

	tos_GlobalXP.SetValue(tos_GlobalXP.GetValue() + tos_XP)
	;tos_PostFightGlobal.SetValue(1.00000) ;здесь закомментил эту строчку, потому что она мне нужна в другом месте.
	tos_PitMasterAlias.GetActorReference().EvaluatePackage()
	MUSReward.Add()
	game.DisablePlayerControls(true, true, false, false, true, true, true, true, 0)
	tos_EnemyGate.Activate(game.GetPlayer() as objectreference, false)
	if tos_EnemiesKilled.GetValue() > 0.000000
		tos_EnemyGate02.Activate(game.GetPlayer() as objectreference, false)
		if tos_EnemiesKilled.GetValue() > 0.000000
			tos_EnemyGate03.Activate(game.GetPlayer() as objectreference, false)
		endIf
	endIf
	tos_EnemiesKilled.SetValue(0.000000)
	utility.Wait(2 as Float)
	game.FadeOutGame(true, true, 0.000000, 1 as Float)
	utility.Wait(0.700000)

	if tos_ChampionRunning.GetValue() == 1.00000 ;проверка на возможность драться с боссом. Можно было сделать if else наоборот, ну да пофиг.
		;game.GetPlayer().MoveTo(tos_PlayerPrepSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true) 
		game.GetPlayer().MoveTo(tos_PlayerBaseSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true)
		game.FadeOutGame(false, true, 1 as Float, 1 as Float)
		tos_PitMasterAlias.GetReference().MoveTo(tos_NPCBaseSpawn2, 0.000000, 0.000000, 0.000000, true)
		tos_PitMasterAlias.Clear()
		;tos_MyQuest.SetObjectiveDisplayed(10, true, false)
		tos_MyQuest.SetStage(200)
		tos_CombatantChampionAlias.GetActorReference().Reset(none)
		tos_PostFightGlobal.SetValue(1.00000) ;сделал так, что эта глобалка переключается только после боя с боссом.
		tos_ChampionRunning.SetValue(0)
		;ReturnToBase()
		utility.Wait(1 as Float)
		game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
		tos_AnyQuestRunning.SetValue(0.000000)
		tos_PostFightGlobal.SetValue(0.000000)
		tos_MyQuest.Stop()	
		tos_PostQuest.Start()
	else 
		Game.GetPlayer().MoveTo(tos_PlayerPrepSpawnAlias.GetReference(), 0.000000, 0.000000, 0.000000, true) ;телепорт после боя с лошком не домой, а в комнату подготовки к следующему бою с боссом.
		tos_MyQuest.SetObjectiveCompleted(5, true) ;квест двигается только до пятой стадии, а после боя с боссом - до десятой.
		tos_PostFightGlobal.SetValue(0.000000)
		tos_NordFAlias.Clear()
		tos_NordMAlias.Clear()
		tos_RedguardAlias.Clear()
		tos_Combatant01Alias.GetActorReference().Reset(none)
		tos_Combatant02Alias.GetActorReference().Reset(none)
		tos_Combatant03Alias.GetActorReference().Reset(none)
		tos_ChampionRunning.SetValue(1) ;переключается глобалка, что теперь можно драться с боссом. А раз игрок не улетает домой, он может сразу поговорить с питмастером и подраться ещё раз.
		game.EnablePlayerControls(true, true, true, true, true, true, true, true, 0)
	endif

endFunction
