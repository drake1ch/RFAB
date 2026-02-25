scriptName QF_FreeformRiften05_00053309 extends Quest hidden

GlobalVariable property pFF05Global auto
ReferenceAlias property Alias_FFR05Dinya auto
Quest property pFFRiften05Quest auto
FFRiftenThaneQuestScript property pFFRTQS auto
LeveledItem property pReward auto
GlobalVariable property pThaneCount auto
Book property pFF05Pamphlet auto

function Fragment_6()

	self.ModObjectiveGlobal(1 as float, pFF05Global, 10, -1.00000, true, true, true)
	game.GetPlayer().RemoveItem(pFF05Pamphlet as form, 1, false, none)
	if pFF05Global.Value >= 20 as float
		pFFRiften05Quest.SetStage(30)
	endIf
endFunction

function Fragment_10()

	self.FailAllObjectives()
	self.Stop()
endFunction

function Fragment_4()

	game.GetPlayer().AddItem(pReward as form, 1, false)
	pThaneCount.Value = pThaneCount.Value + 1 as float
	Alias_FFR05Dinya.GetActorRef().SetRelationshipRank(game.GetPlayer(), 1)
	pFFRTQS.ThaneCheck()
	self.CompleteAllObjectives()
	self.Stop()
endFunction

function Fragment_1()

	self.SetObjectiveDisplayed(10, 1 as bool, false)
	game.GetPlayer().AddItem(pFF05Pamphlet as form, 20, false)
endFunction

function Fragment_0()

endFunction

function Fragment_3()

	self.SetObjectiveCompleted(10, 1 as bool)
	self.SetObjectiveDisplayed(20, 1 as bool, false)
endFunction