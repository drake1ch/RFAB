;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00025E65 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
MS11QuestScript ms11script = GetOwningQuest() as MS11QuestScript

ms11script.GotRedHerringFromCalixto = true
if (GetOwningQuest().GetStageDone(90))
     GetOwningQuest().SetObjectiveCompleted(70)
     GetOwningQuest().SetObjectiveDisplayed(90)
endif

if (ms11script.SentViolaToHjerim && !GetOwningQuest().GetStageDone(80))
	GetOwningQuest().SetStage(76)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
