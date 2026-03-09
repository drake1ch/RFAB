;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__00075CA2 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getowningquest().setstage(40) ;USLEEP 3.0.6 Bug #21024
RelationshipMarriageFIN.SendStoryEvent(akref1 = Alias_LoveInterest.GetActorReference()) ;USLEEP 3.0.6 Bug #21023
Alias_LoveInterest.TryToEvaluatePackage() ;USLEEP 3.0.6 Bug #21023
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property RelationshipMarriageFIN  Auto  

ReferenceAlias Property Alias_LoveInterest  Auto  
