scriptName FFSareth01QuestScript extends Quest conditional

Ingredient property pFFS01Jazbay auto conditional
GlobalVariable property pFFS01Total auto conditional
Quest property pFFS01Quest auto conditional
LeveledItem property pFFS01Potions auto conditional
GlobalVariable property pFFS01Count auto conditional
GlobalVariable property NDstart auto

function EndSwap()

	game.GetPlayer().RemoveItem(pFFS01Jazbay as form, 20, false, none)
		if !NDstart.getvalue()
	game.GetPlayer().AddItem(pFFS01Potions as form, 1, false)
		endif
endFunction

function GrapesCounted()

	float CurrentCount = game.GetPlayer().GetItemCount(pFFS01Jazbay as form) as float
	if pFFS01Quest.GetStage() < 30
		pFFS01Count.Value = CurrentCount
		self.UpdateCurrentInstanceGlobal(pFFS01Count)
		self.SetObjectiveDisplayed(10, true, true)
		if CurrentCount >= 20 as float
			pFFS01Quest.SetStage(30)
		endIf
	endIf
endFunction