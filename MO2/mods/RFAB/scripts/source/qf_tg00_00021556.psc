scriptName QF_TG00_00021556 extends Quest hidden

;-- Properties --------------------------------------
TG00QuestScript property pTG00QS auto
referencealias property Alias_MadesiAlias auto
Perk property pTG00Pickpockethelper auto
ActorBase property pTG00Brandshei auto
referencealias property Alias_BrynjolfAlias auto
referencealias property Alias_TG00HoldingSafe auto
referencealias property Alias_TG00PlayerAlias auto
ActorBase property pBrynjolf auto
Quest property pTG00SPQuest auto
locationalias property Alias_TG00City auto
Armor property pRing auto
referencealias property Alias_TG00RingAlias auto
ActorBase property pTG00Madesi auto
Quest property pTG00MaulHandler auto
referencealias property Alias_TG00MadesiChest auto
referencealias property Alias_BrandSheiAlias auto
ObjectReference property pTG09ShrineEnabler auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_10()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
	if kmyQuest.pTG00ArrestStopper == 0
		kmyQuest.pTG00SPArrest.Start()
	endIf
	if pTG00SPQuest.GetStage() < 200
		pTG00SPQuest.SetStage(200)
	endIf
	self.completeallobjectives()
	self.unregisterforupdate()
	game.GetPlayer().RemovePerk(pTG00Pickpockethelper)
	pBrynjolf.SetInvulnerable(false)
	kmyQuest.pTG01.SetStage(10)
	pTG09ShrineEnabler.Enable(false)
	self.stop()
endFunction

function Fragment_17()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
	kmyQuest.pTG00SP.SetStage(20)
	kmyQuest.pTGFailure.Value = kmyQuest.pTGFailure.Value + 1 as float
	kmyQuest.pTG00ArrestStopper = 1
	if self.IsObjectiveDisplayed(10) == 1 as bool
		self.SetObjectiveFailed(10, 1 as bool)
	endIf
	if self.IsObjectiveDisplayed(20) == 1 as bool
		self.SetObjectiveFailed(20, 1 as bool)
	endIf
	self.SetObjectiveDisplayed(30, 1 as bool, false)
endFunction

function Fragment_18()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
	kmyQuest.pTG00MiscHandler.Start()
	if pTG00MaulHandler.GetStage() == 10
		pTG00MaulHandler.SetStage(200)
	endIf
endFunction

; Skipped compiler generated GotoState

function Fragment_26()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
	kmyQuest.pTG00SP.SetStage(20)
	kmyQuest.pTGFailure.Value = kmyQuest.pTGFailure.Value + 1 as float
	kmyQuest.pTG00ArrestStopper = 1
	if self.IsObjectiveDisplayed(10) == 1 as bool
		self.SetObjectiveFailed(10, 1 as bool)
	endIf
	if self.IsObjectiveDisplayed(20) == 1 as bool
		self.SetObjectiveFailed(20, 1 as bool)
	endIf
	self.SetObjectiveDisplayed(30, 1 as bool, false)
endFunction

function Fragment_6()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
	self.SetObjectiveCompleted(10, 1 as bool)
	self.SetObjectiveDisplayed(20, 1 as bool, false)
endFunction

function Fragment_4()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
	game.GetPlayer().AddPerk(pTG00Pickpockethelper)
	Alias_BrynjolfAlias.GetActorRef().SetNotShowOnStealthMeter(true)
	pTG00QS.SetupTimer()
	self.RegisterForUpdate(30 as float)
	self.SetObjectiveCompleted(8, 1 as bool)
	self.SetObjectiveDisplayed(10, 1 as bool, false)
	pTG00Brandshei.SetEssential(false)
	pTG00Madesi.SetEssential(false)
	kmyQuest.pTG00SP.Start()
	Alias_TG00MadesiChest.GetRef().Additem(Alias_TG00RingAlias.GetRef() as form, 1, false)
	if Alias_TG00City.GetLocation().GetKeywordData(kmyQuest.pTG00CWOwner) == 1 as float
		kmyQuest.pTG00GuardImperial.Enable(false)
	else
		kmyQuest.pTG00GuardStormcloak.Enable(false)
	endIf
endFunction

function Fragment_14()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
	self.SetObjectiveDisplayed(8, 1 as bool, false)
	kmyQuest.pTG00MiscHandler.SetStage(200)
	if pTG00MaulHandler.GetStage() == 10
		pTG00MaulHandler.SetStage(200)
	endIf
endFunction

; Skipped compiler generated GetState

function Fragment_0()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
endFunction

function Fragment_8()

	Quest __temp = self as Quest
	tg00questscript kmyQuest = __temp as tg00questscript
	Alias_BrandSheiAlias.GetActorRef().RemoveItem(pRing as form, 1, false, none)
	self.SetObjectiveCompleted(20, 1 as bool)
	self.SetObjectiveDisplayed(30, 1 as bool, false)
	kmyQuest.pTG00SP.SetStage(20)
endFunction