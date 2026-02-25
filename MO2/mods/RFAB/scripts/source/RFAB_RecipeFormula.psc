Scriptname RFAB_RecipeFormula extends ObjectReference

RFAB_RecipeManager Property RecipeManager Auto

Book Property SelfRef Auto

GlobalVariable Property RecipeGlobal Auto

string Property RecipeName Auto

Event OnEquipped(Actor akActor)
	Learn(akActor)
EndEvent

Function Learn(Actor akActor)
	bool bSuccessful = RecipeManager.LearnRecipe(RecipeGlobal, RecipeName)
	if (bSuccessful)
		akActor.RemoveItem(SelfRef, 1, true)
	endif
	PO3_SKSEFunctions.SetReadFlag(SelfRef)
EndFunction