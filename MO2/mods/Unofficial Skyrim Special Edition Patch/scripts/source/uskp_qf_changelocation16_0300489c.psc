;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname USKP_QF_ChangeLocation16_0300489C Extends Quest Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;USKP 2.1.0 - Enable Bandits at Driftshade Sanctuary
C05EnableMarker.Disable()
C05EnableMarker02.Disable()
C05EnableMarker.GetParentCell().Reset()
C05EnableMarker02.GetParentCell().Reset()
DriftshadeSanctuaryAlias.Clear()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property C05EnableMarker auto
ObjectReference Property C05EnableMarker02 auto
LocationAlias Property DriftshadeSanctuaryAlias Auto 
