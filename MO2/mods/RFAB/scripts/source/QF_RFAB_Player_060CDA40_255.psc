;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_RFAB_Player_060CDA40_255 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Righteous
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Righteous Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ConsoleCommands
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ConsoleCommands Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjectUnpacker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObjectUnpacker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttributeBonuses
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttributeBonuses Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LevelUpBonuses
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LevelUpBonuses Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Enchantment[] kEnchs = PO3_SKSEFunctions.GetAllEnchantments()
Form[] kKeywords = EnchantmentsKeywords.ToArray()

int i = kEnchs.Length
while (i > 0)
	i -= 1
	Formlist kList = kEnchs[i].GetKeywordRestrictions()
	if (kList)
		kList.AddForms(kKeywords)
	endif
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property EnchantmentsKeywords  Auto  
