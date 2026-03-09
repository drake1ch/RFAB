;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname UDGP_TIF_ElderScrollSell_030602B3 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(DA04ElderScroll,1)
Game.GetPlayer().AddItem(Gold001, 2000)
ScrollQuest.ScrollDonated = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DialogueWinterholdCollegeQuestScript Property ScrollQuest Auto
book Property DA04ElderScroll  Auto  
MiscObject Property Gold001  Auto 
