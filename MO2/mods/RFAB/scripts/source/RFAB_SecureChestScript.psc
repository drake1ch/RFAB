Scriptname RFAB_SecureChestScript extends ObjectReference  

ObjectReference Property SecureChest auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		SecureChest.Activate(akActionRef)
		RegisterForMenu("ContainerMenu")
	endif
EndEvent

Event OnMenuClose(String asMenuName)
	SetOpen(false)
	UnregisterForMenu("ContainerMenu")
EndEvent