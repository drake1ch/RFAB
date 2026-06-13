;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname PRKF_RFAB_Perk_Enchantin_000BEE97_255 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
int iIndex = EnchantmentChoice.Show()

EnchantmentChoiceGV.Value = iIndex

if (iIndex == 1)
	DisallowItems(TYPE_WEAPON)
elseif (iIndex == 2)
	DisallowItems(TYPE_ARMOR)
endif

if (iIndex != 0)
	RegisterForMenu("Crafting Menu")
endif

akTargetRef.Activate(akActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property MagicDisallowEnchanting Auto

Formlist Property DisallowedItems Auto

Message Property EnchantmentChoice Auto

GlobalVariable Property EnchantmentChoiceGV Auto

int Property TYPE_ARMOR = 26 AutoReadOnly
int Property TYPE_WEAPON = 41 AutoReadOnly

Event OnMenuClose(string asMenuName)
	AllowItems()
	UnregisterForMenu("Crafting Menu")
EndEvent

Function DisallowItems(int aiFormType)
	Form[] kObjects = PO3_SKSEFunctions.AddItemsOfTypeToArray(Game.GetPlayer(), aiFormType, false)

	int i = kObjects.Length
	while (i > 0)
		i -= 1
		if (!kObjects[i].HasKeyword(MagicDisallowEnchanting))
			DisallowedItems.AddForm(kObjects[i])
		endif
	endwhile

	i = DisallowedItems.GetSize()
	while (i > 0)
		i -= 1
		PO3_SKSEFunctions.AddKeywordToForm(DisallowedItems.GetAt(i), MagicDisallowEnchanting)
	endwhile
EndFunction

Function AllowItems()
	int i = DisallowedItems.GetSize()
	while (i > 0)
		i -= 1
		PO3_SKSEFunctions.RemoveKeywordOnForm(DisallowedItems.GetAt(i), MagicDisallowEnchanting)
	endwhile
	DisallowedItems.Revert()
EndFunction
