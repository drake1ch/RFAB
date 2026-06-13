;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_RFAB_Enchanting_060CDF5B_255 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Form[] kKeywords = ArmorEnchantKeywords.ToArray()

int i = EnchsArmorNonUnique.GetSize()
while (i > 0)
	i -= 1
	Enchantment kEnch = EnchsArmorNonUnique.GetAt(i) as Enchantment
	if (kEnch)
		Formlist kList = kEnch.GetKeywordRestrictions()
		if (kList)
			kList.AddForms(kKeywords)
		endif
	endif
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
RecipeManager.LearnEnchantmentsList(EnchsWeaponUnique)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
RecipeManager.LearnEnchantmentsList(EnchsArmorUnique)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RFAB_RecipeManager Property RecipeManager Auto

Formlist Property EnchsArmorNonUnique Auto
Formlist Property EnchsArmorUnique Auto
Formlist Property EnchsWeaponUnique Auto

FormList Property ArmorEnchantKeywords Auto
