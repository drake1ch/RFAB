;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_RFAB_Quest_GiveEnchantmen_0D00AA61 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE RFAB_Script_GiveNewEnchantments
Quest __temp = self as Quest
RFAB_Script_GiveNewEnchantments kmyQuest = __temp as RFAB_Script_GiveNewEnchantments
;END AUTOCAST
;BEGIN CODE
kmyQuest.GiveEnchantments()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE RFAB_Script_GiveNewEnchantments
Quest __temp = self as Quest
RFAB_Script_GiveNewEnchantments kmyQuest = __temp as RFAB_Script_GiveNewEnchantments
;END AUTOCAST
;BEGIN CODE
kmyQuest.GiveSuperEnchantments()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
