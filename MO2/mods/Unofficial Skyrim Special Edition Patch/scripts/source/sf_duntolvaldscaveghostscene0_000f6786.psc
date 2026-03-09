;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_dunTolvaldsCaveGhostScene0_000F6786 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Ghost02.getReference().disable(true)

;USKP 2.0.1 - Moved scene completion flag here, along with the call to terminate at stage 100.
CaveQuest.ghostScene2Complete = True

if CaveQuest.ghostScene1Complete && CaveQuest.ghostScene2Complete && CaveQuest.ghostScene3Complete && CaveQuest.crownSceneComplete
	GetOwningQuest().setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Ghost02.getReference().enable(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Ghost02  Auto  
QF_dunTolvaldsCaveQST_0003CD36 Property CaveQuest Auto
