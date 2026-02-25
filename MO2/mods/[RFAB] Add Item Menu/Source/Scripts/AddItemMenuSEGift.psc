Scriptname AddItemMenuSEGift extends ObjectReference  

import AddItemMenuSE

formlist Property listForm Auto
Actor Property GiftActor Auto

Event OnEquipped(Actor akActor)

;	int skse_VersionRelease = 64

	if (akActor != Game.GetPlayer())
		return
	endif
;	if (skse.GetVersionRelease() != skse_VersionRelease)
;		Debug.Notification("$AIM_SKSE_Required")
;		return
;	endif

	AIM_CloseAllMenu()
	utility.wait(0.1)

	GiftActor.ShowGiftMenu(false, listForm)
	utility.wait(0.1)
	if (GiftActor.GetNumItems() == 0)
		Game.GetPlayer().RemoveItem(Game.GetFormFromFile(0x0690D, "AddItemMenuSE.esp"), 1)
		GiftActor.disable()
	endif
endEvent
