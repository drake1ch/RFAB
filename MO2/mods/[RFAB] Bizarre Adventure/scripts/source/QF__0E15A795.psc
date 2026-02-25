;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname QF__0E15A795 Extends Quest Hidden

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NarisPotion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NarisPotion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DwemerDevice
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DwemerDevice Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RannveigsFastBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RannveigsFastBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MorvunskarBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MorvunskarBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SildScroll
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SildScroll Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HarmugstahlBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HarmugstahlBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JaphetsFollyBoatBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JaphetsFollyBoatBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CornalBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CornalBook Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(31) 
SetObjectiveDisplayed(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetAllowToEspace()
SetObjectiveCompleted(32) 
SetObjectiveDisplayed(33)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetAllowToEspace()
SetObjectiveCompleted(22) 
SetObjectiveDisplayed(23)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetAllowToEspace()
SetObjectiveCompleted(12) 
SetObjectiveDisplayed(13)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(21) 
SetObjectiveDisplayed(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest_Seryon_ManyItems
Quest __temp = self as Quest
RFAB_BA_Quest_Seryon_ManyItems kmyQuest = __temp as RFAB_BA_Quest_Seryon_ManyItems
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(11) 
SetObjectiveDisplayed(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetAllowToEspace()
SetObjectiveCompleted(42) 
SetObjectiveDisplayed(43)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kMyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(41) 
SetObjectiveDisplayed(42)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest_Seryon_ManyItems
Quest __temp = self as Quest
RFAB_BA_Quest_Seryon_ManyItems kmyQuest = __temp as RFAB_BA_Quest_Seryon_ManyItems
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoToNextStage(2)
SetObjectiveCompleted(23)
SetObjectiveDisplayed(31)
; Морвунскар
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
kmyQuest.UnRegisterQuest()
kmyQuest.GiveExperienceForQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest_Seryon_ManyItems
Quest __temp = self as Quest
RFAB_BA_Quest_Seryon_ManyItems kmyQuest = __temp as RFAB_BA_Quest_Seryon_ManyItems
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoToNextStage(3)
SetObjectiveCompleted(33)
SetObjectiveDisplayed(41)
; Обитель Рангвейн
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterQuest()
SetObjectiveDisplayed(11)
; Хармугстал
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest_Seryon_ManyItems
Quest __temp = self as Quest
RFAB_BA_Quest_Seryon_ManyItems kmyQuest = __temp as RFAB_BA_Quest_Seryon_ManyItems
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoToNextStage(1)
SetObjectiveCompleted(13)
SetObjectiveDisplayed(21)
; Каприз Иафета
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
