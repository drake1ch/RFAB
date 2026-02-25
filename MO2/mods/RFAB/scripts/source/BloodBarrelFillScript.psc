Scriptname BloodBarrelFillScript extends ObjectReference  


MiscObject Property REQ_Misc_BloodConservingPhial  Auto  

Potion Property RFAB_ReadyPotion_BloodPotion  Auto  

Sound Property FillBloodPhialSound  Auto  

int BloodPhialsCount

Event OnActivate(ObjectReference akActionRef)
	
	BloodPhialsCount = Game.GetPlayer().GetItemCount(REQ_Misc_BloodConservingPhial  )
	if (BloodPhialsCount > 0 )
	
	Game.GetPlayer().RemoveItem(REQ_Misc_BloodConservingPhial , BloodPhialsCount, true)
	Game.GetPlayer().AddItem(RFAB_ReadyPotion_BloodPotion  , BloodPhialsCount, true)
	
	Debug.Notification("Флаконы вновь заполнены: " + BloodPhialsCount )
	FillBloodPhialSound.Play(akActionRef)
	else
	Debug.Notification("У меня нет флаконов крови" )
	endif
endevent

