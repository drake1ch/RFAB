;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_RFAB_BA_Quest_WhitePh_07005AD8_255 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DiaryAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DiaryAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PhialAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PhialAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
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
