;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__000649F7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Check added by USKP 1.3.2
if( TG00.GetStageDone(5) == 0 && TG00.GetStageDone(8) == 0 )
 pTG00MH.Start()
endif
pDRMQS.pDirge = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00MH  Auto  

DRMSQuestScript Property pDRMQS  Auto  
Quest Property TG00 Auto
