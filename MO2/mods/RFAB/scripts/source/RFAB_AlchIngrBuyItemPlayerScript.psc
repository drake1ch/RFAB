scriptName RFAB_AlchIngrBuyItemPlayerScript extends ReferenceAlias

import PO3_SKSEFunctions

keyword Property ingredientSet Auto
ObjectReference Property PlayerRef Auto

int kMisc = 32 
Form[] IngredientSetList

Event OnInit()
	RegisterForMenu("BarterMenu")
EndEvent

Event OnPlayerLoadGame()
	RegisterForMenu("BarterMenu")
EndEvent

Event OnMenuClose(String MenuName)
	if MenuName == "BarterMenu"
		IngredientSetList = AddItemsOfTypeToArray(PlayerRef, kMisc)
		UnpackIngredients()
	endif
EndEvent

Function UnpackIngredients()
	int IngredientSetCount = IngredientSetList.Length
	while IngredientSetCount
		IngredientSetCount -= 1
		Form CurrentObject = IngredientSetList[IngredientSetCount]
		if CurrentObject.HasKeyword(ingredientSet)
			(CurrentObject as RFAB_AlchIngrBuyItemScript).AddIngrs(PlayerRef.GetItemCount(CurrentObject))
			PlayerRef.RemoveItem(CurrentObject, PlayerRef.GetItemCount(CurrentObject), true)
		endif
	endwhile
EndFunction

;/
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If (akBaseItem.HasKeyword(ingredientSet))
		(akBaseItem as RFAB_AlchIngrBuyItemScript).AddIngrs(aiItemCount)
		self.GetActorReference().RemoveItem(akBaseItem, aiItemCount, true)
	EndIf
EndEvent
/;