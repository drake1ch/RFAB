;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_dunTolvaldsCaveCrownScene_000F6788 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
TGCrownGhostFaction.setEnemy(PlayerFaction)
GhostCrown01.getActorRef().setAV("Aggression", 2)
GhostCrown02.getActorRef().setAV("Aggression", 2)
GhostCrown03.getActorRef().setAV("Aggression", 2)

;USKP 2.0.1 - Moved scene completion flag here, along with the call to terminate at stage 100.
CaveQuest.crownSceneComplete = True

if CaveQuest.ghostScene1Complete && CaveQuest.ghostScene2Complete && CaveQuest.ghostScene3Complete && CaveQuest.crownSceneComplete
	GetOwningQuest().setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GhostCrown01.getReference().enable(true)
GhostCrown02.getReference().enable(true)
GhostCrown03.getReference().enable(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property GhostCrown01  Auto  

ReferenceAlias Property GhostCrown02  Auto  

ReferenceAlias Property GhostCrown03  Auto  

Faction Property TGCrownGhostFaction  Auto  

Faction Property PlayerFaction  Auto  

QF_dunTolvaldsCaveQST_0003CD36 Property CaveQuest Auto
