scriptName QF_FreeformSalviusFarmA_000931BF extends Quest hidden

MiscObject property Gold auto
referencealias property Alias_QuestGiver auto
referencealias property Alias_Leonitus auto
referencealias property Alias_Letter auto
LeveledItem property qReward auto
ObjectReference property OldHroldanMapMarker auto
GlobalVariable property NDstart auto

function Fragment_2()

	self.SetObjectiveCompleted(10, 1 as bool)
	Alias_Leonitus.GetActorRef().AddItem(Alias_Letter.GetRef() as form, 1, false)
			if !NDstart.getvalue()
	game.GetPlayer().AddItem(qReward as form, 1, false)
			endif
	Alias_QuestGiver.GetActorRef().SetRelationshipRank(game.GetPlayer(), 1)
endFunction

function Fragment_1()

	self.SetObjectiveDisplayed(10, 1 as bool, false)
	Alias_Letter.GetRef().Enable(false)
	game.GetPlayer().AddItem(Alias_Letter.GetRef() as form, 1, false)
	OldHroldanMapMarker.AddtoMap(false)
endFunction

function Fragment_10()

	self.FailAllObjectives()
	self.Stop()
endFunction