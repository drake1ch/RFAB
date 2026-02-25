Scriptname NN01CrimsonNirnrootScript extends ReferenceAlias 

NN01QuestScript Property pNN01QS Auto
Ingredient Property pNirnrootRed Auto
Quest Property NN01Quest Auto

Event OnInit()
	AddInventoryEventFilter(pNirnrootRed)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	pNN01QS.GotARoot(aiItemCount)
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	pNN01QS.LostARoot(aiItemCount)
EndEvent