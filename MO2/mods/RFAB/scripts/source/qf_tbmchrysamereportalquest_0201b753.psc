;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_tbmChrysamerePortalQuest_0201B753 Extends Quest Hidden

;BEGIN ALIAS PROPERTY tbmPorterAlias007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterAlias007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tbmPorterPlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterPlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tbmPorterAlias000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterAlias000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tbmPorterAlias004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterAlias004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tbmPorterAlias001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterAlias001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tbmPorterAlias003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterAlias003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tbmPorterAlias006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterAlias006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tbmPorterAlias005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterAlias005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY tbmPorterAlias002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_tbmPorterAlias002 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; shutdown stage
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; port to cave entrance
Alias_tbmPorterPlayerAlias.GetRef().MoveTo(caveEntranceMarker)
Alias_tbmPorterAlias000.GetRef().MoveTo(caveEntranceMarker)
Alias_tbmPorterAlias001.GetRef().MoveTo(caveEntranceMarker)
Alias_tbmPorterAlias002.GetRef().MoveTo(caveEntranceMarker)
Alias_tbmPorterAlias003.GetRef().MoveTo(caveEntranceMarker)
Alias_tbmPorterAlias004.GetRef().MoveTo(caveEntranceMarker)
Alias_tbmPorterAlias005.GetRef().MoveTo(caveEntranceMarker)
Alias_tbmPorterAlias006.GetRef().MoveTo(caveEntranceMarker)
Alias_tbmPorterAlias007.GetRef().MoveTo(caveEntranceMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; port to dragon
Alias_tbmPorterPlayerAlias.GetRef().MoveTo(caveExitMarker)
Alias_tbmPorterAlias000.GetRef().MoveTo(caveExitMarker)
Alias_tbmPorterAlias001.GetRef().MoveTo(caveExitMarker)
Alias_tbmPorterAlias002.GetRef().MoveTo(caveExitMarker)
Alias_tbmPorterAlias003.GetRef().MoveTo(caveExitMarker)
Alias_tbmPorterAlias004.GetRef().MoveTo(caveExitMarker)
Alias_tbmPorterAlias005.GetRef().MoveTo(caveExitMarker)
Alias_tbmPorterAlias006.GetRef().MoveTo(caveExitMarker)
Alias_tbmPorterAlias007.GetRef().MoveTo(caveExitMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; startup stage
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; port to reliquary
Alias_tbmPorterPlayerAlias.GetRef().MoveTo(reliquaryMarker)
Alias_tbmPorterAlias000.GetRef().MoveTo(reliquaryMarker)
Alias_tbmPorterAlias001.GetRef().MoveTo(reliquaryMarker)
Alias_tbmPorterAlias002.GetRef().MoveTo(reliquaryMarker)
Alias_tbmPorterAlias003.GetRef().MoveTo(reliquaryMarker)
Alias_tbmPorterAlias004.GetRef().MoveTo(reliquaryMarker)
Alias_tbmPorterAlias005.GetRef().MoveTo(reliquaryMarker)
Alias_tbmPorterAlias006.GetRef().MoveTo(reliquaryMarker)
Alias_tbmPorterAlias007.GetRef().MoveTo(reliquaryMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property reliquaryMarker  Auto  

ObjectReference Property caveEntranceMarker  Auto  

ObjectReference Property caveExitMarker  Auto  
