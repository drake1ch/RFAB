Scriptname GetPlayerInventoryWeightScript extends ReferenceAlias
;/
GlobalVariable Property gGetIW Auto

Event OnBatchItemsAdded(Form[] akBaseItems, Int[] aiItemCounts, ObjectReference[] akSourceContainers)

    gGetIW.SetValue(game.GetPlayer().GetAV("InventoryWeight") as Float)
EndEvent

Event OnBatchItemsRemoved(Form[] akBaseItems, Int[] aiItemCounts, ObjectReference[] akSourceContainers)

    gGetIW.SetValue(game.GetPlayer().GetAV("InventoryWeight") as Float)
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)

    gGetIW.SetValue(game.GetPlayer().GetAV("InventoryWeight") as Float)
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)

    gGetIW.SetValue(game.GetPlayer().GetAV("InventoryWeight") as Float)
EndEvent
/;