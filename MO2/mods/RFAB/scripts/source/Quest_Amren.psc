;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname Quest_Amren Extends Quest Hidden

;BEGIN ALIAS PROPERTY Amren
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Amren Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sword
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sword Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Container
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Container Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(15)

;Alias_Amren.GetRef().AddItem(Alias_Sword.GetRef(), abSilent = true) ; SE X
if (Alias_Amren.GetActorRef().GetRelationshipRank(Game.GetPlayer()) < 1)
    Alias_Amren.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
endif
Game.GetPlayer().RemoveItem(Alias_Sword.GetRef(), 1, true) ; SE XI
XP.OnQuestComplete(self)
Stop()
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
