;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_DialogueWinterholdInitScen_000B2175 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(SceneQuest as DialogueWinterholdInitialSceneQScript).SceneRun = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().RegisterForUpdateGameTime(4) ; USKP 2.0.4 - This was incorrectly registering the scene for endless updates instead of the quest.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property SceneQuest  Auto  


