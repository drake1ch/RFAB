;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_dunFaldarsToothBettingCage_00091444 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;USKP 2.1.2 Bug #19063 - Scene can be running when quest isn't. Doesn't make sense, but it's true.
if( GetOwningQuest().IsRunning() )
	getOwningQuest().setStage(20)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
