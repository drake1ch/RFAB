;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname USKP_QF_ChangeLocation07_0202C3EA Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if( WhiteRiverBoss.GetActorReference().GetActorBase().GetDeadCount() > 0 || dunWhiteRiverWatchQST.GetStage() >= 100 )
  SetStage(10)
else
  SetStage(15)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
dunWhiteRiverWatchQST.SetStage(255)
SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property dunWhiteRiverWatchQST Auto
ReferenceAlias Property WhiteRiverBoss Auto
