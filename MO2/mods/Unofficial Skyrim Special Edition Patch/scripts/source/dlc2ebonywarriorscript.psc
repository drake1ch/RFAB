Scriptname DLC2EbonyWarriorScript extends Actor  

Ammo Property IronArrow  Auto  
FormList Property DLC2EbonyWarriorEquipment Auto ; UDBP 2.0 - Restores missing property. Purpose unknown, but the formlist is valid.

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState == 1
		AddItem(IronArrow, 7)
	endif
EndEvent 