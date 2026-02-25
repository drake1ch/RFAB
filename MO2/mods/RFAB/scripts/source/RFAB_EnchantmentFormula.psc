Scriptname RFAB_EnchantmentFormula extends ObjectReference

RFAB_RecipeManager Property RecipeManager Auto

Book Property SelfRef Auto

Enchantment Property Ench Auto

Event OnEquipped(Actor akActor)
	Learn(akActor)
EndEvent

Function Learn(Actor akActor)
	bool bSuccessful = RecipeManager.LearnEnchantment(Ench)
	if (bSuccessful)
		akActor.RemoveItem(SelfRef, 1, true)
	endif
	PO3_SKSEFunctions.SetReadFlag(SelfRef)
EndFunction