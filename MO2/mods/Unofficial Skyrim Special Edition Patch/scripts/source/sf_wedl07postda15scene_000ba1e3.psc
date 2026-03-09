;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_WEDL07PostDA15Scene_000BA1E3 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;USKP 2.0.4 - Trying to set stages on stopped quests.
if( GetOwningQuest().IsRunning() )
	getOwningQuest().setStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
