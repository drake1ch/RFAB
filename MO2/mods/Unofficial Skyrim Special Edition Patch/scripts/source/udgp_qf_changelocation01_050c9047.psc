;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname UDGP_QF_ChangeLocation01_050C9047 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
DLC1DialogueHunterVampireBlock.Stop()
DLC1DialogueHunterBase.Stop()
IsranAlias.Clear()
SorineAlias.Clear()
GunmarAlias.Clear()
FlorentiusAlias.Clear()
BelevalAlias.Clear()
CelannAlias.Clear()
AgmaerAlias.Clear()
DurakAlias.Clear()
IngjardAlias.Clear()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC1DialogueHunterVampireBlock Auto
Quest Property DLC1DialogueHunterBase Auto
ReferenceAlias Property IsranAlias Auto
ReferenceAlias Property SorineAlias Auto
ReferenceAlias Property GunmarAlias Auto
ReferenceAlias Property FlorentiusAlias Auto
ReferenceAlias Property BelevalAlias Auto
ReferenceAlias Property CelannAlias Auto
ReferenceAlias Property AgmaerAlias Auto
ReferenceAlias Property DurakAlias Auto
ReferenceAlias Property IngjardAlias Auto
