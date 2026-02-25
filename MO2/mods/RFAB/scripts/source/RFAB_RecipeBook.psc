Scriptname RFAB_RecipeBook extends ObjectReference  

RFAB_RecipeManager Property RecipeManager Auto

Book Property SelfRef Auto

GlobalVariable[] Property RecipesGlobals Auto

Event OnEquipped(Actor akActor)
	Learn(akActor)
EndEvent

Function Learn(Actor akActor)
	bool bSuccessful = RecipeManager.LearnRecipes(RecipesGlobals)
	if (bSuccessful)
		akActor.RemoveItem(SelfRef, 1, true)
	endif
	PO3_SKSEFunctions.SetReadFlag(SelfRef)
EndFunction