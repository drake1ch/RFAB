;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname qf_tbmchrysamerequest_020154c7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CaveTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaveTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReliquaryDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReliquaryDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Taunt3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Taunt3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Courier
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Courier Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaveEntryTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaveEntryTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChrysamerePorter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChrysamerePorter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReliquaryExit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReliquaryExit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Taunt1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Taunt1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TamrielicLoreBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TamrielicLoreBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Taunt2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Taunt2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReliquaryKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReliquaryKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReturnPorter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReturnPorter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RealChrysamere
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RealChrysamere Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE qf_tbmchrysamerequest_020154c7
Quest __temp = self as Quest
qf_tbmchrysamerequest_020154c7 kmyQuest = __temp as qf_tbmchrysamerequest_020154c7
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(5, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
setObjectiveCompleted(40)
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveCompleted(50)
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(60)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
setObjectiveCompleted(30)
setObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property StarterMessage  Auto  

Scene Property introScene  Auto  
