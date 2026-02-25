;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname Quest_BardsCollegeLute Extends Quest Hidden

;BEGIN ALIAS PROPERTY FinnsLute
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinnsLute Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Inge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Inge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Inge has given the quest to the player

SetObjectiveDisplayed(20,1)
MapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Player grabbed item before getting the quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Lute has been recovered

SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Lute has been returned to Inge

SetObjectiveCompleted(40,1)
Alias_Inge.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Game.GetPlayer().RemoveItem(Alias_FinnsLute.GetRef(), 1, abSilent = true)

XP.OnQuestComplete(self)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


string Property Speechcraft  Auto  

string Property LightArmor  Auto  

string Property Pickpocket  Auto  

string Property Sneak  Auto  

string Property Alchemy  Auto  

string Property Lockpicking  Auto  

ObjectReference Property MapMarker  Auto  

RFAB_XP_Handler Property Xp  Auto  
