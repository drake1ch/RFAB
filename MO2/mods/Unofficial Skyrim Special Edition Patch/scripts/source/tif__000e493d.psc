;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000E493D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getplayer().removeitem(gold, HDMarkarthChildRoom.value as int)
(GetOwningQuest() as BYOHRelationshipAdoptionHousePurchase).Markarth_EnableChildBedroom()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int Property GoldAmount  Auto  

MiscObject Property Gold  Auto  

ObjectReference Property DecorateMarker  Auto  

GlobalVariable Property HDMarkarthChildRoom  Auto  
