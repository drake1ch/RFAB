;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname QF_RFAB_BA_Quest_Grishnak_Re_161C39F7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChampionTombBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChampionTombBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LastVigilBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LastVigilBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JolgierrBarrowBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JolgierrBarrowBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OblivionBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OblivionBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoulCairnBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoulCairnBoss Auto
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
SetObjectiveCompleted(32)
SetStage(40)
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
SetObjectiveCompleted(100)
CompleteAllObjectives()
kmyQuest.GiveExperienceForQuest()
kmyQuest.UnRegisterQuest()
Stop()
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
SetObjectiveCompleted(42)
SetObjectiveDisplayed(45)
SetStage(50)
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
kmyQuest.RegisterQuest()
Alias_LocationMarker.ForceRefTo(LastVigilMarker)
kmyQuest.QuestTravelStage = 12
Alias_QuestGiver.GetActorRef().RemoveItem(Alias_Note.GetReference().GetBaseObject(),  akOtherContainer = Game.GetPlayer())
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
Alias_LocationMarker.ForceRefTo(SoulCairnMarker)
kmyQuest.QuestTravelStage = 22
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
Game.GetPlayer().MoveTo(BizarreAdventure.GetDungeonScript().GetCurrentHubMarker())
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
kmyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(22)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
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

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
Alias_LocationMarker.ForceRefTo(ChampionTombMarker)
kmyQuest.QuestTravelStage = 42
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
Alias_LocationMarker.ForceRefTo(JolgierrBarrowMarker)
kmyQuest.QuestTravelStage = 32
SetObjectiveDisplayed(30)
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
kmyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(32)
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
kmyQuest.SetAllowToEspace(false)
SetObjectiveCompleted(50)
SetObjectiveDisplayed(52)
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
kmyQuest.SetAllowToEspace()
SetObjectiveCompleted(52)
SetObjectiveDisplayed(100)
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
kmyQuest.SetAllowToEspace()
SetObjectiveCompleted(12)
SetStage(20)
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
kmyQuest.SetAllowToEspace()
SetObjectiveCompleted(22)
SetStage(30)
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
Alias_LocationMarker.ForceRefTo(OblivionStart)
kmyQuest.QuestTravelStage = 52
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property LastVigilMarker Auto
ObjectReference Property SoulCairnMarker Auto
ObjectReference Property JolgierrBarrowMarker Auto
ObjectReference Property ChampionTombMarker Auto
ObjectReference Property OblivionStart Auto

