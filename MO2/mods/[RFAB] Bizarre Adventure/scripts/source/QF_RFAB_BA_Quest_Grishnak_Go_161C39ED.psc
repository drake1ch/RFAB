;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname QF_RFAB_BA_Quest_Grishnak_Go_161C39ED Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GeirmundsHallBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GeirmundsHallBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FolgunthurBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FolgunthurBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaarthalBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaarthalBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAllowToEspace()
SetObjectiveCompleted(12)
SetStage(20)
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
kmyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAllowToEspace()
SetObjectiveCompleted(32)
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAllowToEspace()
SetObjectiveCompleted(22)
SetStage(30)
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
kmyQuest.RegisterQuest()
Alias_LocationMarker.ForceRefTo(FolgunthurMarker)
kmyQuest.QuestTravelStage = 12
Alias_QuestGiver.GetActorRef().RemoveItem(Alias_Note.GetReference().GetBaseObject(),  akOtherContainer = Game.GetPlayer())
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAllowToEspace()
SetObjectiveCompleted(42)
SetObjectiveDisplayed(45)
kmyQuest.UnregisterQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(10)
SetObjectiveDisplayed(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
Alias_LocationMarker.ForceRefTo(GeirmundsHallMarker)
kmyQuest.QuestTravelStage = 22
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
Alias_LocationMarker.ForceRefTo(ReachwaterRockMarker)
kmyQuest.QuestTravelStage = 42
SetObjectiveDisplayed(40)
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
Alias_LocationMarker.ForceRefTo(SaarthalMarker)
kmyQuest.QuestTravelStage = 32
SetObjectiveDisplayed(30)
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
kmyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(40)
SetObjectiveDisplayed(42)
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
SetObjectiveCompleted(45)
CompleteAllObjectives()
kmyQuest.GiveExperienceForQuest()
kmyQuest.UnRegisterQuest()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property FolgunthurMarker Auto
ObjectReference Property GeirmundsHallMarker Auto
ObjectReference Property SaarthalMarker Auto
ObjectReference Property ReachwaterRockMarker Auto
