;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_RFAB_BA_BizarreSewers_0801A670_255 Extends Quest Hidden

;BEGIN ALIAS PROPERTY LootAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LootAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TurtleAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TurtleAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE RFAB_BA_Quest
Quest __temp = self as Quest
RFAB_BA_Quest kmyQuest = __temp as RFAB_BA_Quest
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
game.getplayer().addspell(musictrackerspell, false)
kmyQuest.RegisterQuest()
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
SetObjectiveCompleted(40)

kmyQuest.GiveExperienceForQuest()
kmyQuest.UnRegisterQuest()
game.getplayer().removespell(musictrackerspell)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(20)

SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(30)

SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)

SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property musictrackerspell  Auto  
