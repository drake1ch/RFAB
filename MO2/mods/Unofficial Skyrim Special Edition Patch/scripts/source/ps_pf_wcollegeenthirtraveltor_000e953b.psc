;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PS_PF_WCollegeEnthirTraveltoR_000E953B Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
(pDialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).EnthirSell = false
akActor.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
(pDialogueWinterholdCollege as DialogueWinterholdCollegeQuestScript).EnthirSell = false
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDialogueWinterholdCollege  Auto  
