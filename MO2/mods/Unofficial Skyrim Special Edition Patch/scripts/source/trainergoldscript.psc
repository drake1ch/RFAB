Scriptname TrainerGoldScript extends Actor

int Property TrainerType  Auto  

miscobject Property gold001  Auto  


Function CheckGold()

int MaxGold

	if TrainerType==1
		MaxGold=500
	elseif TrainerType==2
		MaxGold=800
	elseif TrainerType==3
		MaxGold=1500
	else
		MaxGold=500
	endif

int GoldCount=GetItemCount(Gold001)

	if GoldCount > MaxGold
		RemoveItem(Gold001, (GoldCount-MaxGold))
	endif

EndFunction

;USKP 2.0.3 - This script doesn't need to perform this action twice.
;Event OnDetachedFromCell()

;	CheckGold()

;EndEvent


Event OnCellDetach()

	CheckGold()

EndEvent