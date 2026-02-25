;/ Decompiled by Champollion V1.0.1
Source   : QF_FreeformWhiterunQuest05_00094E3F.psc
Modified : 2024-06-22 15:01:30
Compiled : 2024-06-22 15:01:31
User     : user
Computer : WIN-2V1G9CFBKBS
/;
scriptName QF_FreeformWhiterunQuest05_00094E3F extends Quest hidden

;-- Properties --------------------------------------
potion property pPotion1 auto
alias property FrostSaltsAlias auto
referencealias property Alias_ArcadiaAlias auto
referencealias property Alias_FrostSaltsAlias auto
potion property pPotion3 auto
globalvariable property pFavorReward auto
referencealias property Alias_FarengarAlias auto
potion property pPotion2 auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

function Fragment_1()

	self.setObjectiveDisplayed(10, true, false)
	game.GetPlayer().AddItem(Alias_FrostSaltsAlias.GetReference() as form, 1, false)
endFunction

function Fragment_0()

	Alias_ArcadiaAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt())
	Alias_FarengarAlias.GetActorRef().ModFavorPoints(pFavorReward.GetValueInt())
	game.GetPlayer().RemoveItem(Alias_FrostSaltsAlias.GetReference() as form, 1, false, none)
	game.GetPlayer().AddItem(pPotion1 as form, 1, false)
	game.GetPlayer().AddItem(pPotion2 as form, 1, false)
	game.GetPlayer().AddItem(pPotion3 as form, 1, false)
	self.SetObjectiveCompleted(10, true)
	utility.Wait(5 as Float)
	self.Stop()
endFunction

function Fragment_3()

	self.UnRegisterForUpdate()
endFunction

; Skipped compiler generated GotoState

function Fragment_10()

	if self.GetStageDone(200) == 0 as Bool
		self.FailAllObjectives()
	endIf
	self.Stop()
endFunction

; Skipped compiler generated GetState
