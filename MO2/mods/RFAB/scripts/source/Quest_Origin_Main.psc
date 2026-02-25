;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Quest_Origin_Main Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int i = 0
RecipeManager.LearnEnchantments(BretonSorcererEnchantments)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Enchantment[] Property BretonSorcererEnchantments  Auto  

RFAB_RecipeManager Property RecipeManager Auto
