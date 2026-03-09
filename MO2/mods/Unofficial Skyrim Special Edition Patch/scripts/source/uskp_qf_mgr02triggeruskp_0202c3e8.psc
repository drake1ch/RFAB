;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname USKP_QF_MGR02TriggerUSKP_0202C3E8 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
MGRShellScript MGRScript = MGRShell as MGRShellScript
; debug.Trace("MGR01TriggerRunning")
if (MGRScript.MGRDrevisDay +3) < Gameday.GetValue()
; Debug.Trace("MGR02TriggerUSKP function sent")
MGRScript.StartDrevisQuest()
endif
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MGRShell  Auto  

GlobalVariable Property GameDay  Auto  
