;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname USLP_QF_ChangeLocation04_06065C82 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE

;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
RegisterForSingleUpdateGameTime(48)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC1VQ06DawnguardAttackers Auto
ObjectReference Property DLC1VQ06VampireAttackers Auto

Event OnUpdateGameTime()
	DLC1VQ06DawnguardAttackers.Disable()
	DLC1VQ06VampireAttackers.Disable()
	
	Stop()
EndEvent
