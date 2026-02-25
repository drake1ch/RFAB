scriptName QF_FreeformMorthalB_00021896 extends Quest hidden

referencealias property Alias_Note auto
referencealias property Alias_Aldis auto
miscobject property Gold001 auto
referencealias property Alias_Gorm auto
LeveledItem Property qReward auto
GlobalVariable property NDstart auto

function Fragment_2()

	self.FailAllObjectives()
	self.Stop()
endFunction

function Fragment_1()

	Alias_Gorm.GetActorReference().SetRelationshipRank(game.GetPlayer(), 1)
			if !NDstart.getvalue()
	game.GetPlayer().AddItem(qReward as form, 1, false)
			endif
	game.GetPlayer().RemoveItem(Alias_Note.GetReference() as form, 1, false, none)
	self.Stop()
endFunction

function Fragment_0()

	game.GetPlayer().AddItem(Alias_Note.GetReference() as form, 1, false)
endFunction