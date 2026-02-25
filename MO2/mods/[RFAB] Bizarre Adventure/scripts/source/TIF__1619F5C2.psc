;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname TIF__1619F5C2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ObjectReference QuestItem = (GetOwningQuest().GetAliasByName("QuestItem") as ReferenceAlias).GetReference()

Game.GetPlayer().RemoveItem(QuestItem)
akSpeaker.UnequipItemSlot(31) ; Head
if QuestItem.GetDisplayName() == ItemBadName
	BadFinal.ForceStart()
else
	GoodFinal.ForceStart()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property GoodFinal Auto  

Scene Property BadFinal Auto  

String Property ItemBadName  Auto  
