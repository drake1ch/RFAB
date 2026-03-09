Scriptname MS12bPlayerScript extends ReferenceAlias  

Ingredient Property BriarHeart auto
ReferenceAlias Property Ingredient3 auto
MS12bQuestScript Property MS12b Auto

bool Property __done = false Auto Hidden

;USKP 2.0.1 - Redid this whole mess to use the updated function from Patch 1.9 because it wasn't properly handling the BriarHeart
Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if (akBaseItem == BriarHeart && !__done)
		__done = true
		MS12b.GotIngredientBase(akBaseItem)
	endif
EndEvent
