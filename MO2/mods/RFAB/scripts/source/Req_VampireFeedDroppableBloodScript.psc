Scriptname Req_VampireFeedDroppableBloodScript extends REQ_PlayerAlias  
{automatically bottle blood from fallen creatures, or consume it, if no bottle is at hand}

Potion Property DroppedBlood  Auto  
SPELL Property DroppedBloodSpell  Auto  
MiscObject Property BloodConserver  Auto  
Potion Property bloodPotion  Auto

Event OnAliasInit()
	AddInventoryEventFilter(DroppedBlood)
EndEvent

Event OnPlayerLoadGame()
	AddInventoryEventFilter(DroppedBlood)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	int bottles = Player.GetItemCount(BloodConserver)
	Player.RemoveItem(DroppedBlood, aiItemCount, true)

	If (bottles >= aiItemCount)
		Player.RemoveItem(BloodConserver, aiItemCount, true)
		Player.AddItem(BloodPotion, aiItemCount, true)
	Else
		If (bottles > 0)
			Player.RemoveItem(BloodConserver, bottles, true)
			Player.AddItem(BloodPotion, bottles, true)
		EndIf

		DroppedBloodSpell.Cast(Player, Player)
	EndIf
EndEvent
