scriptName QF_FreeformRiften17_0005B2DE extends Quest hidden

ReferenceAlias property Alias_FFRiften17FilnjarAlias auto
ReferenceAlias property Alias_FFRiften17HoldingAlias auto
ObjectReference property pShorsStoneMapMarker auto
ReferenceAlias property Alias_FFRiften17OreAlias auto
LeveledItem property pReward auto
FFRiftenThaneQuestScript property pFFRTQS auto
GlobalVariable property pThaneCount auto
ReferenceAlias property Alias_FFRiften17HafjorgAlias auto
GlobalVariable property NDstart auto

function Fragment_2()

	game.GetPlayer().AddItem(Alias_FFRiften17OreAlias.GetRef() as form, 1, false)
	self.SetObjectiveCompleted(10, 1 as bool)
	self.SetObjectiveDisplayed(20, 1 as bool, false)
endFunction

function Fragment_5()

	self.FailAllObjectives()
	self.Stop()
endFunction

function Fragment_1()

	self.SetObjectiveDisplayed(10, 1 as bool, false)
	pShorsStoneMapMarker.AddToMap(false)
endFunction

function Fragment_0()

endFunction

function Fragment_3()

	game.GetPlayer().RemoveItem(Alias_FFRiften17OreAlias.GetRef() as form, 1, false, none)
		if !NDstart.getvalue()
	game.GetPlayer().AddItem(pReward as form, 1, false)
		endif
	pThaneCount.Value = pThaneCount.Value + 1 as float
	pFFRTQS.ThaneCheck()
	Alias_FFRiften17FilnjarAlias.GetActorRef().SetRelationshipRank(game.GetPlayer(), 1)
	self.CompleteAllObjectives()
	self.Stop()
endFunction