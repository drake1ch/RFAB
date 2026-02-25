scriptName QF_FreeformRiverwood01_00074A83 extends Quest hidden

ReferenceAlias property Alias_Sven auto
ReferenceAlias property Alias_FaendalsLetter auto
Faction property FavorCompletedFaction auto
GlobalVariable property FavorReward auto
ReferenceAlias property Alias_Camilla auto
MiscObject property Gold auto
ReferenceAlias property Alias_SvensLetter auto
LocationAlias property Alias_Location auto
Quest property FavorControlQuest auto
Keyword property pFavorScene auto
ReferenceAlias property Alias_RiverwoodQuestItemHoldingChest auto
ReferenceAlias property Alias_Faendal auto
LeveledItem property SvenReward auto
LeveledItem property FendalReward auto

function Fragment_10()

	Alias_Sven.GetActorRef().SetRelationshipRank(game.GetPlayer(), -1)
	Alias_Camilla.GetActorRef().SetRelationshipRank(Alias_Sven.GetActorRef(), -1)
	self.SetObjectiveCompleted(10, 1 as bool)
	self.SetObjectiveDisplayed(20, 0 as bool, false)
	self.SetObjectiveDisplayed(210, 1 as bool, false)
endFunction

function Fragment_17()

	Alias_Faendal.GetActorRef().SetRelationshipRank(game.GetPlayer(), -1)
	Alias_Camilla.GetActorRef().SetRelationshipRank(Alias_Faendal.GetActorRef(), -1)
	self.SetObjectiveCompleted(110, 1 as bool)
	self.SetObjectiveDisplayed(120, 0 as bool, false)
	self.SetObjectiveDisplayed(220, 1 as bool, false)
endFunction

function Fragment_9()

	self.SetObjectiveDisplayed(10, 1 as bool, false)
	self.SetObjectiveDisplayed(20, 1 as bool, false)
endFunction

function Fragment_12()

endFunction

function Fragment_15()

endFunction

function Fragment_18()

	Alias_Sven.GetActorRef().SetRelationshipRank(game.GetPlayer(), -1)
	Alias_Camilla.GetActorRef().SetRelationshipRank(Alias_Sven.GetActorRef(), -1)
	self.SetObjectiveCompleted(110, 1 as bool)
	self.SetObjectiveDisplayed(120, 0 as bool, false)
	self.SetObjectiveDisplayed(210, 1 as bool, false)
endFunction

function Fragment_16()

endFunction

function Fragment_13()

	self.SetObjectiveDisplayed(110, 1 as bool, false)
	self.SetObjectiveDisplayed(120, 1 as bool, false)
endFunction

function Fragment_11()

endFunction

function Fragment_23()

endFunction

function Fragment_20()

	self.SetObjectiveDisplayed(10, 0 as bool, false)
	self.SetObjectiveCompleted(20, 1 as bool)
	self.SetObjectiveDisplayed(110, 1 as bool, false)
endFunction

function Fragment_25()

	self.FailAllObjectives()
	self.Stop()
endFunction

function Fragment_24()

	game.GetPlayer().AddItem(SvenReward as form, 1, false)
	Alias_Sven.GetActorRef().SetRelationshipRank(game.GetPlayer(), 2)
	self.CompleteAllObjectives()
	self.Stop()
endFunction

function Fragment_22()

	game.GetPlayer().AddItem(FendalReward as form, 1, false)
	Alias_Faendal.GetActorRef().SetRelationshipRank(game.GetPlayer(), 2)
	self.CompleteAllObjectives()
	self.Stop()
endFunction

function Fragment_21()

	self.SetObjectiveDisplayed(110, 0 as bool, false)
	self.SetObjectiveCompleted(120, 1 as bool)
	self.SetObjectiveDisplayed(10, 1 as bool, false)
endFunction

function Fragment_14()

	Alias_Faendal.GetActorRef().SetRelationshipRank(game.GetPlayer(), -1)
	Alias_Camilla.GetActorRef().SetRelationshipRank(Alias_Faendal.GetActorRef(), -1)
	self.SetObjectiveCompleted(10, 1 as bool)
	self.SetObjectiveDisplayed(20, 0 as bool, false)
	self.SetObjectiveDisplayed(220, 1 as bool, false)
endFunction