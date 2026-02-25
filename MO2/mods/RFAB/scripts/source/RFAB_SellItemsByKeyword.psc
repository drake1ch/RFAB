;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname RFAB_SellItemsByKeyword Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
actor player = Game.GetPlayer()
int numItems = player.GetNumItems()
int i = numItems
int reward = 0
while i > 0
	i -= 1
	form currentItem = player.GetNthForm(i)
	if (currentItem.HasKeyword(kwToSell))
		int currentItemCount = player.GetItemCount(currentItem)
		int currentItemValue = currentItem.GetGoldValue()
		reward += currentItemCount * currentItemValue
		player.RemoveItem(currentItem, currentItemCount, true)		
	endif
	
endwhile

player.AddItem(gold, reward)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property kwToSell  Auto  

MiscObject Property Gold  Auto  
