;/ Decompiled by Champollion V1.0.1
Source   : tos_AdvanceAndPaymentScript.psc
Modified : 2013-03-22 18:04:03
Compiled : 2013-03-22 18:04:07
User     : Callum
Computer : CALLUM-PC
/;
scriptName tos_AdvanceAndPaymentScript extends Quest conditional

;-- Properties --------------------------------------
globalvariable property tos_Rank auto conditional
globalvariable property tos_DLC_ChampionCount auto conditional
objectreference[] property tos_RewardWeapons auto conditional
message[] property tos_RankMessage auto conditional
globalvariable property tos_ChampionAvailable auto conditional
objectreference[] property tos_RewardItem auto conditional
referencealias property tos_NPCOwnerAlias auto
musictype property MUSReward auto
globalvariable property tos_DLC_PaymentNeeded auto conditional
Quest property tos_RankTrackingQuest auto conditional
miscobject property tos_Gold auto conditional
location property tos_TrainingHall auto conditional
globalvariable property tos_DLC_XP auto conditional
message property tos_UpdateMessage auto conditional
globalvariable property tos_AwaitingAdvance auto conditional
globalvariable property tos_XP auto conditional
cell[] property tos_AllArenaCells auto conditional

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

;function ResetRewardItems() ;закомментил всю функцию, потому чтохз вообще, зачем она нужна. Выдачу трофеев я сделал отдельно.

	;Int WeaponReset = 0
	;while WeaponReset < 13
		;if tos_RewardWeapons[WeaponReset].IsEnabled() && tos_RewardWeapons[WeaponReset].IsInLocation(tos_TrainingHall)
			;tos_RewardWeapons[WeaponReset].Reset(none)
		;endIf
		;WeaponReset += 1
	;endWhile
;endFunction

function Payment()
	
	int Payment = tos_Rank.GetValue() as Int * tos_Rank.GetValue() as Int * 125 + 500 ;здесь для итогового красивого числа пришлось написать так.
	if tos_Rank.GetValue() == 1 || tos_Rank.GetValue() as Int == 3
		Payment += 125
	endif
	if tos_Rank.GetValue() as Int == 5 || tos_Rank.GetValue() as Int == 7
		Payment -= 125
	endif	

	game.GetPlayer().AddItem(tos_Gold as form, Payment, false)
	GiveAdvance() ;я здесь это дописал, чтобы всё выдавалось независимо от кривого высчитывания ранга от какого-то там арена опыта.
	tos_DLC_PaymentNeeded.SetValue(0.000000)
	Int iElement = tos_AllArenaCells.length
	while iElement > 0
		iElement -= 1
		tos_AllArenaCells[iElement].Reset()
	endWhile
endFunction

function CheckForAdvance() ;не стал это комментить, но по идее, это сейчас ни на что не влияет по итогу.

	if game.GetPlayer().HasLOS(tos_NPCOwnerAlias.GetReference()) == false
		tos_NPCOwnerAlias.GetActorReference().Reset(none)
	endIf
	if tos_DLC_PaymentNeeded.GetValue() == 1 as Float
		if tos_DLC_ChampionCount.GetValue() < 100 as Float
			tos_ChampionAvailable.SetValue(tos_DLC_ChampionCount.GetValue())
		endIf
		if tos_XP.GetValue() + tos_DLC_XP.GetValue() >= (tos_Rank.GetValue() * 1.50000 + 1.00000) * 26.0000 && tos_Rank.GetValue() < 10.0000
			tos_AwaitingAdvance.SetValue(1.00000)
		endIf
	else
		tos_DLC_ChampionCount.SetValue(tos_ChampionAvailable.GetValue())
		if tos_XP.GetValue() >= (tos_Rank.GetValue() * 1.50000 + 1.00000) * 26.0000 && tos_Rank.GetValue() <= 10.0000
			tos_AwaitingAdvance.SetValue(1.00000)
		endIf
	endIf
endFunction

; Skipped compiler generated GetState

function GiveAdvance()

	tos_Rank.SetValue(tos_Rank.GetValue() + 1.00000) ;повышение ранга. После того, как я всё переделал, срабатывает после каждой награды.
	tos_ChampionAvailable.SetValue(tos_ChampionAvailable.GetValue() + 1.00000)
	tos_DLC_ChampionCount.SetValue(tos_ChampionAvailable.GetValue())
	tos_AwaitingAdvance.SetValue(0.000000)
	MUSReward.Add()
	tos_RankMessage[tos_Rank.GetValue() as Int].Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	;tos_RewardItem[(tos_Rank.GetValue() - 1.00000) as Int].Enable(false)
	tos_UpdateMessage.Show(0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000)
	tos_RankTrackingQuest.SetStage((tos_Rank.GetValue() * 10.0000) as Int)
	int i = tos_Rank.GetValue() as Int - 1
	tos_RewardWeapons[i].Disable(false) ;вот эта строчка дизейблит маркер, который энейблит трофей.

endFunction

; Skipped compiler generated GotoState
