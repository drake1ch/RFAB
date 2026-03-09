;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname BYOH_TIF__01004D07 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Next 2 lines added by UHFP 1.0.1 so players don't lose mannequin inventory
UHFPHoneysideMannequin1.RemoveAllItems(UHFPHoneysideChest)
UHFPHoneysideMannequin2.RemoveAllItems(UHFPHoneysideChest)
game.getplayer().removeitem(gold, HDRiftenChildRoom.value as int)
(GetOwningQuest() as BYOHRelationshipAdoptionHousePurchase).Riften_EnableChildBedroom()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property DecorateMarker  Auto  

MiscObject Property Gold  Auto  

int Property GoldAmount  Auto  

GlobalVariable Property HDRiftenChildRoom  Auto  
Actor Property UHFPHoneysideMannequin1  Auto  

Actor Property UHFPHoneysideMannequin2  Auto  

ObjectReference Property UHFPHoneysideChest  Auto  
