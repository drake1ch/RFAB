Scriptname RFAB_Script_GiveNewEnchantments extends Quest  

RFAB_RecipeManager Property RecipeManager Auto

Enchantment[] Property Enchantments050 Auto

Enchantment[] Property Enchantments075 Auto

Function GiveEnchantments()
	RecipeManager.LearnEnchantments(Enchantments050)
EndFunction


Function GiveSuperEnchantments()
	RecipeManager.LearnEnchantments(Enchantments075)
EndFunction