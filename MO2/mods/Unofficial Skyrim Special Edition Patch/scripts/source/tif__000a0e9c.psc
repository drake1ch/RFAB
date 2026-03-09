;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000A0E9C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;USKP 2.0.5 - Exploit fix for WIAddItem07 infinite speech
if( USKPCalcelmoWIAddItem07Persuaded.Value == 0 )
  DialogueFavorGeneric.Persuade(akSpeaker)
  USKPCalcelmoWIAddItem07Persuaded.Value = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FavorDialogueScript Property DialogueFavorGeneric  Auto  

GlobalVariable Property USKPCalcelmoWIAddItem07Persuaded Auto
