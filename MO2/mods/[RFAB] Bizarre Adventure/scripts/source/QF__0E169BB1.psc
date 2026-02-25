;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname QF__0E169BB1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DeviceQI
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeviceQI Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HillgrundsTombBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HillgrundsTombBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AnsilvundlBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AnsilvundlBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY YngvildBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_YngvildBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArtifactQI
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArtifactQI Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MedallionQI
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MedallionQI Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(32) 
SetObjectiveDisplayed(33)
kmyQuest.SetAllowToEspace()
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
SetObjectiveCompleted(22) 
SetObjectiveDisplayed(23)
kmyQuest.SetAllowToEspace()
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
SetObjectiveCompleted(12) 
SetObjectiveDisplayed(13)
kmyQuest.SetAllowToEspace()
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(11) 
SetObjectiveDisplayed(12)
kmyQuest.SetAllowToEspace(false)
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
SetObjectiveCompleted(21) 
SetObjectiveDisplayed(22)
kmyQuest.SetAllowToEspace(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest_Seryon_ManyItems02
Quest __temp = self as Quest
RFAB_BA_Quest_Seryon_ManyItems02 kmyQuest = __temp as RFAB_BA_Quest_Seryon_ManyItems02
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoToStage(4)
SetObjectiveCompleted(23)
SetObjectiveDisplayed(31)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest_Seryon_ManyItems02
Quest __temp = self as Quest
RFAB_BA_Quest_Seryon_ManyItems02 kmyQuest = __temp as RFAB_BA_Quest_Seryon_ManyItems02
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoToStage(3)
SetObjectiveCompleted(13)
SetObjectiveDisplayed(21)
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

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(31) 
SetObjectiveDisplayed(32)
kmyQuest.SetAllowToEspace(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
