scriptName QF_FreeformFalkreathQuest03_000B83C3 extends Quest hidden

Quest property VigharQuest auto
ReferenceAlias property Alias_Dengeir auto
LeveledItem property qReward auto

function Fragment_1()

	self.SetObjectiveCompleted(10, true)
	self.SetObjectiveDisplayed(20, true, false)
endFunction

function Fragment_0()

	Quest __temp = self as Quest
	freeformfalkreathquest03script kmyQuest = __temp as freeformfalkreathquest03script
	VigharQuest.SetObjectiveDisplayed(10, true, false)
	kmyQuest.LairMapMarker.AddToMap(false)
endFunction

function Fragment_3()

	Quest __temp = self as Quest
	freeformfalkreathquest03script kmyQuest = __temp as freeformfalkreathquest03script
	self.SetObjectiveCompleted(20, true)
	game.GetPlayer().AddItem(qReward as form, 1, false)
	Alias_Dengeir.GetActorRef().SetRelationshipRank(game.GetPlayer(), 1)
endFunction