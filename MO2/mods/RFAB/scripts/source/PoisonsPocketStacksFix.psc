Scriptname PoisonsPocketStacksFix extends ActiveMagicEffect
Keyword Property PoisonKeyword auto

Event OnItemAdded( Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer )
	if akBaseItem.hasKeyword(PoisonKeyword)
		UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "ContainerMenu")
	endif
EndEvent