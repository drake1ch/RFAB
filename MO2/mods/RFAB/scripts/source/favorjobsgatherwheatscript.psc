scriptName FavorJobsGatherWheatScript extends Quest

;-- Properties --------------------------------------
Ingredient property Nirnroot auto
Int property PlayerCropCount auto
Potion property FoodPotato auto
Int property PlayerGoldReward auto
Potion property FoodCabbage auto
Ingredient property Wheat auto
Potion property FoodLeek auto
MiscObject property pGold auto
Potion property Gourd auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function SellPotato(Actor Foreman)

	PlayerCropCount = game.GetPlayer().GetItemCount(FoodPotato as form)
	if Foreman.GetRelationshipRank(game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(game.GetPlayer(), 1)
	endIf
	PlayerGoldReward = PlayerCropCount * FoodPotato.GetGoldValue()
	game.GetPlayer().RemoveItem(FoodPotato as form, PlayerCropCount, false, none)
	game.GetPlayer().AddItem(pGold as form, PlayerGoldReward, false)
endFunction

function SellNirnroot(Actor Foreman)

	PlayerCropCount = game.GetPlayer().GetItemCount(Nirnroot as form)
	if Foreman.GetRelationshipRank(game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(game.GetPlayer(), 1)
	endIf
	PlayerGoldReward = PlayerCropCount * Nirnroot.GetGoldValue()
	game.GetPlayer().RemoveItem(Nirnroot as form, PlayerCropCount, false, none)
	game.GetPlayer().AddItem(pGold as form, PlayerGoldReward, false)
endFunction

function SellLeek(Actor Foreman)

	PlayerCropCount = game.GetPlayer().GetItemCount(FoodLeek as form)
	if Foreman.GetRelationshipRank(game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(game.GetPlayer(), 1)
	endIf
	PlayerGoldReward = PlayerCropCount * FoodLeek.GetGoldValue()
	game.GetPlayer().RemoveItem(FoodLeek as form, PlayerCropCount, false, none)
	game.GetPlayer().AddItem(pGold as form, PlayerGoldReward, false)
endFunction

function SellWheat(Actor Foreman)

	PlayerCropCount = game.GetPlayer().GetItemCount(Wheat as form)
	if Foreman.GetRelationshipRank(game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(game.GetPlayer(), 1)
	endIf
	PlayerGoldReward = PlayerCropCount * Wheat.GetGoldValue()
	game.GetPlayer().RemoveItem(Wheat as form, PlayerCropCount, false, none)
	game.GetPlayer().AddItem(pGold as form, PlayerGoldReward, false)
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function SellGourd(Actor Foreman)

	PlayerCropCount = game.GetPlayer().GetItemCount(Gourd as form)
	if Foreman.GetRelationshipRank(game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(game.GetPlayer(), 1)
	endIf
	PlayerGoldReward = PlayerCropCount * 1
	game.GetPlayer().RemoveItem(Gourd as form, PlayerCropCount, false, none)
	game.GetPlayer().AddItem(pGold as form, PlayerGoldReward, false)
endFunction

function SellCabbage(Actor Foreman)

	PlayerCropCount = game.GetPlayer().GetItemCount(FoodCabbage as form)
	if Foreman.GetRelationshipRank(game.GetPlayer()) == 0
		Foreman.SetRelationshipRank(game.GetPlayer(), 1)
	endIf
	PlayerGoldReward = PlayerCropCount * FoodCabbage.GetGoldValue()
	game.GetPlayer().RemoveItem(FoodCabbage as form, PlayerCropCount, false, none)
	game.GetPlayer().AddItem(pGold as form, PlayerGoldReward, false)
endFunction