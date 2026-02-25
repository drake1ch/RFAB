;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_RFAB_Scene_MQ305_AlduinFo_0E00FB9A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; clear mist count variable
MQ305Script pScript = GetOwningQuest() as MQ305Script
Utility.Wait(1.5)
pScript.ClearShoutCount()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
