Scriptname RFAB_Mounts_Alias extends ReferenceAlias 

RFAB_Mounts Property Mounts Auto

Formlist Property BlankFilter Auto

Faction Property PlayerHorseFaction Auto

Actor Property PlayerRef Auto

Event OnInit()
	RegisterForModEvent("RFAB_PlayerStartGame", "OnPlayerStartGame")
EndEvent

Event OnPlayerStartGame()
	AddInventoryEventFilter(BlankFilter)
	RegisterForAnimationEvent(PlayerRef, "MountEnd")
	UnregisterForAllModEvents()
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Actor kMount = PO3_SKSEFunctions.GetMount(PlayerRef)
	if (kMount.IsInFaction(PlayerHorseFaction))
		Mounts.Mount = kMount
		(Mounts.GetAlias(1) as ReferenceAlias).ForceRefTo(kMount)
	endif
	Mounts.UpdateMountStats()
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	Mounts.UpdateWeightInMenu()
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	Mounts.UpdateWeightInMenu()
EndEvent

Event OnMenuOpen(String asMenuName)
	Mounts.UpdateWeightInMenu()
	if (Mounts.IsShowWeightInMenu)
		RemoveAllInventoryEventFilters()
	endif
EndEvent

Event OnMenuClose(String asMenuName)
	if (Mounts.IsShowWeightInMenu)
		AddInventoryEventFilter(BlankFilter)
	endif
	Mounts.UpdateWeightInName()
	UnRegisterForMenu(asMenuName)
EndEvent