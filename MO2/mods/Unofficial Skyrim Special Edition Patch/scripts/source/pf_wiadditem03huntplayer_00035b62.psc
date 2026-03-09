;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_WIAddItem03HuntPlayer_00035B62 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
;USKP 2.0.4 - Scene would attempt to start even if the quest was not running.
if( GetOwningQuest().IsRunning() )
	pScene.start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pScene  Auto  
{Scene to start}
