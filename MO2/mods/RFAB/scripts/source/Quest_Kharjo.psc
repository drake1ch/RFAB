;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname Quest_Kharjo Extends Quest Hidden

;BEGIN ALIAS PROPERTY Kharjo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kharjo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StrongBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StrongBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Amulet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Amulet Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Igrok podobral amylet
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Igrok vzyal quest
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Igrok otdal amylet Kharjo
SetObjectiveCompleted(20)
Game.GetPlayer().RemoveItem(Alias_Amulet.GetRef(), 1, True)
Game.GetPlayer().AddItem(Gold001, 1000)
if (Alias_Kharjo.GetActorRef().GetRelationshipRank(Game.GetPlayer()) < 1)
  Alias_Kharjo.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
endif
XP.OnQuestComplete(self)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Kharjo ymer
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

RFAB_XP_Handler Property XP Auto
