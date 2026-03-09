;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname PF_MS05ViarmoFestivalLightSc_0010C069 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
akactor.equipitem(Torch01,true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(Actor akActor)
;BEGIN CODE
akactor.unequipitem(Torch01)
GetOwningQuest().SetStage(15)
akactor.PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Light Property Torch01  Auto  

Idle Property IdleStop  Auto  
