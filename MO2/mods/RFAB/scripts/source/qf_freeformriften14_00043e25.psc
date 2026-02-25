scriptName QF_FreeformRiften14_00043E25 extends Quest hidden

ReferenceAlias property Alias_FFRiften14WylandriahAlias auto
ReferenceAlias property Alias_FFRiften14SpoonAlias auto
ReferenceAlias property Alias_FFRiften14SoulGemAlias auto
ReferenceAlias property Alias_FFRiften14IngotAlias auto
FFRiftenThaneQuestScript property pFFRTQS auto
ReferenceAlias property Alias_FFRiften14Satchel03Alias auto
GlobalVariable property pCount auto
LeveledItem property pReward auto
ReferenceAlias property Alias_FFRiften14Satchel01Alias auto
GlobalVariable property pThaneCount auto
ReferenceAlias property Alias_FFRiften14Satchel02Alias auto
GlobalVariable property NDstart auto

function Fragment_2()

	self.SetObjectiveDisplayed(10, 1 as bool, false)
	self.SetObjectiveDisplayed(20, 1 as bool, false)
	self.SetObjectiveDisplayed(30, 1 as bool, false)
endFunction

function Fragment_3()

	game.GetPlayer().RemoveItem(Alias_FFRiften14SpoonAlias.GetRef() as form, 1, false, none)
	game.GetPlayer().RemoveItem(Alias_FFRiften14IngotAlias.GetRef() as form, 1, false, none)
	game.GetPlayer().RemoveItem(Alias_FFRiften14SoulGemAlias.GetRef() as form, 1, false, none)
	Alias_FFRiften14Satchel01Alias.GetRef().Disable(false)
	Alias_FFRiften14Satchel02Alias.GetRef().Disable(false)
	Alias_FFRiften14Satchel03Alias.GetRef().Disable(false)
			if !NDstart.getvalue()
	game.GetPlayer().AddItem(pReward as form, 1, false)
			endif
	Alias_FFRiften14WylandriahAlias.GetActorRef().SetRelationshipRank(game.GetPlayer(), 1)
	pThaneCount.Value = pThaneCount.Value + 1 as float
	pFFRTQS.ThaneCheck()
	self.CompleteAllObjectives()
	self.Stop()
endFunction

function Fragment_14()

	self.FailAllObjectives()
	self.Stop()
endFunction

function Fragment_10()

	self.SetObjectiveCompleted(30, 1 as bool)
	pCount.Value = pCount.Value + 1 as float
	if pCount.Value >= 3 as float
		self.setstage(60)
	endIf
endFunction

function Fragment_0()

endFunction

function Fragment_12()

	self.SetObjectiveDisplayed(40, 1 as bool, false)
endFunction

function Fragment_7()

	self.SetObjectiveCompleted(10, 1 as bool)
	pCount.Value = pCount.Value + 1 as float
	if pCount.Value >= 3 as float
		self.setstage(60)
	endIf
endFunction

function Fragment_8()

	self.SetObjectiveCompleted(20, 1 as bool)
	pCount.Value = pCount.Value + 1 as float
	if pCount.Value >= 3 as float
		self.setstage(60)
	endIf
endFunction