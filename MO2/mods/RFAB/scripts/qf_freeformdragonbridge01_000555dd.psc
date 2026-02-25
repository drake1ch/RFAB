;/ Decompiled by Champollion V1.0.1
Source   : QF_FreeformDragonBridge01_000555DD.psc
Modified : 2025-10-09 21:20:43
Compiled : 2025-10-09 21:21:04
User     : Nero
Computer : VELEN
/;
scriptName qf_freeformdragonbridge01_000555dd extends Quest hidden

;-- Properties --------------------------------------
rfab_xp_handler property Xp auto
referencealias property Alias_QuestItem auto
referencealias property Alias_Olda auto
referencealias property Alias_Horgeir auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_2()

	Alias_Olda.GetActorRef().SetRelationshipRank(game.GetPlayer(), 1)
	Alias_Horgeir.GetActorRef().SetRelationshipRank(game.GetPlayer(), -1)
	self.SetObjectiveCompleted(20, 1 as Bool)
	self.Stop()
endFunction

function Fragment_3()

	Alias_Horgeir.GetActorRef().SetRelationshipRank(game.GetPlayer(), 1)
	Alias_Olda.GetActorRef().SetRelationshipRank(game.GetPlayer(), -1)
	self.SetObjectiveFailed(20, 1 as Bool)
	self.Stop()
endFunction

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function Fragment_4()

	Xp.OnQuestComplete(self as Quest)
	self.UnRegisterForUpdate()
	self.FailAllObjectives()
	self.Stop()
endFunction

function Fragment_1()

	self.SetObjectiveCompleted(10, 1 as Bool)
	self.SetObjectiveDisplayed(20, 1 as Bool, false)
endFunction

function Fragment_0()

	self.SetObjectiveDisplayed(10, 1 as Bool, false)
	Alias_QuestItem.GetRef().Enable(false)
endFunction
