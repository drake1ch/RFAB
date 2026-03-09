;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname USKP_QF_ChangeLocation09_02008584 Extends Quest Hidden

;BEGIN ALIAS PROPERTY USKPDB01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_USKPDB01Marker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_USKPDB01Marker.GetReference().Disable()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
