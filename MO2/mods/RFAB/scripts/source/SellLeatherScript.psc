Scriptname SellLeatherScript extends TopicInfo

Keyword Property Leather Auto
MiscObject Property Gold Auto

Function Fragment_0(ObjectReference akSpeakerRef)
	Actor Player = Game.GetPlayer()
	int iReward = 0
	int i = Player.GetNumItems()
	while (i > 0)
		i -= 1
		Form kItem = Player.GetNthForm(i)
		if (kItem.HasKeyword(Leather))
			iReward += kItem.GetGoldValue() * Player.GetItemCount(kItem)
			Player.RemoveItem(kItem, Player.GetItemCount(kItem), true)
		endif
	endwhile
	if (iReward > 0)
		Player.AddItem(Gold, iReward, false)
	endif
EndFunction