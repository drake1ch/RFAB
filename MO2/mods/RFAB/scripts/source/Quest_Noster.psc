;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname Quest_Noster Extends Quest Hidden

;BEGIN ALIAS PROPERTY Helmet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helmet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Noster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Noster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Container
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Container Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(15)

;Game.GetPlayer().RemoveItem(Alias_Helmet.GetRef(), 1, true, Alias_Noster.GetRef()) ; SE X
if (Alias_Noster.GetActorRef().GetRelationshipRank(Game.GetPlayer()) < 1)
    Alias_Noster.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
endif
Game.GetPlayer().RemoveItem(Alias_Helmet.GetRef(), 1, true) ; SE XI
XP.OnQuestComplete(self)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveCompleted(10)
setObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RFAB_XP_Handler Property XP Auto
