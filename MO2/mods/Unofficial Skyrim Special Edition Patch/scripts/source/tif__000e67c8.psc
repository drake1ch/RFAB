;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000E67C8 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getplayer().removeitem(gold, HDWindhelmChildRoom.value as int)
(GetOwningQuest() as BYOHRelationshipAdoptionHousePurchase).Windhelm_EnableChildBedroom()
WindhelmPlayerHouseDecorateBasic.Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

ObjectReference Property DecorateMarker  Auto  

GlobalVariable Property HDWindhelmChildRoom  Auto  

ObjectReference Property WindhelmPlayerHouseDecorateBasic  Auto  
