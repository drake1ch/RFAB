Scriptname NN01CrimsonNirnrootScript extends ReferenceAlias  Conditional

NN01QuestScript Property pNN01QS Auto
Ingredient Property pNirnrootRed Auto
Quest Property NN01Quest Auto

Event OnInit()

	AddInventoryEventFilter(pNirnrootRed)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if NN01Quest.GetStage() < 200
		if akBaseItem == pNirnrootRed
			pNN01QS.CountRoots() ; USKP 1.3.2 changed call from GotARoot()
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if NN01Quest.GetStage() < 200
		if akBaseItem == pNirnrootRed
			pNN01QS.CountRoots() ; USKP 1.3.2 changed call from LostARoot()
		endif
	endif

endEvent
