Scriptname RFAB_VendorContainer extends ObjectReference

LeveledItem Property InitialStock Auto
LeveledItem Property RemainingStock Auto

Auto State Init
	Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	EndEvent

	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	EndEvent

	Event OnUpdate()
		int i = InitialStock.GetNumForms()
		while (i > 0)
			i -= 1
			Form kItem = InitialStock.GetNthForm(i)
			int iCount = InitialStock.GetNthCount(i)

			StorageUtil.FormListAdd(self, "StockItems", kItem)
			StorageUtil.IntListAdd(self, "StockCounts", iCount)

			AddInventoryEventFilter(kItem)
			RemainingStock.AddForm(kItem, 1, iCount)
		endwhile
		GoToState("")
	EndEvent
EndState

Event OnInit()
	RegisterForSingleUpdate(1.0)
EndEvent

Event OnUpdate()
	Form[] kItems = StorageUtil.FormListToArray(self, "StockItems")
	int[] iCounts = StorageUtil.IntListToArray(self, "StockCounts")

	RemainingStock.Revert()

	int i = kItems.Length
	while (i > 0)
		i -= 1
		if (iCounts[i] > 0)
			RemainingStock.AddForm(kItems[i], 1, iCounts[i])
		endif
	endwhile
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	TryModStockCount(akBaseItem, aiItemCount)
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	TryModStockCount(akBaseItem, -aiItemCount)
EndEvent

Function TryModStockCount(Form akItem, int aiCount)
	int iIndex = StorageUtil.FormListFind(self, "StockItems", akItem)

	if (iIndex == -1)
		return
	endif

	StorageUtil.IntListAdjust(self, "StockCounts", iIndex, aiCount)
	RegisterForSingleUpdate(0.5)
EndFunction