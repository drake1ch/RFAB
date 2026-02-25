scriptName QF_FreeformWhiterunQuest04_00094E3C extends Quest hidden

referencealias property Alias_AmuletAlias auto
referencealias property Alias_AndursAlias auto
MiscObject property pGold auto
GlobalVariable property pFavorReward auto
referencealias property Alias_AmuletMarkerAlias auto
LeveledItem property qReward auto

function Fragment_10()

	self.SetObjectiveCompleted(10, true)
	self.SetObjectiveDisplayed(20, true, false)
endFunction

function Fragment_1()

	self.SetObjectiveDisplayed(10, true, false)
endFunction

function Fragment_0()

	Alias_AndursAlias.GetReference().AddItem(Alias_AmuletAlias.GetReference() as form, 1, false)
	Alias_AndursAlias.GetActorRef().SetRelationshipRank(game.GetPlayer(), 3)
	game.GetPlayer().AddItem(qReward as form, 1, false)
	self.SetObjectiveCompleted(20, true)
	utility.Wait(5 as float)
	self.Stop()
endFunction

function Fragment_3()

	self.UnRegisterForUpdate()
	self.FailAllObjectives()
	self.Stop()
endFunction