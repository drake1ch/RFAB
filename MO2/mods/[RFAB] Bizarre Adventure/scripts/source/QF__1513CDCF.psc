;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF__1513CDCF Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestItem Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
kmyQuest.RegisterQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
kmyQuest.SetAllowToEspace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()
kmyQuest.GiveExperienceForQuest()
kmyQuest.UnRegisterQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
