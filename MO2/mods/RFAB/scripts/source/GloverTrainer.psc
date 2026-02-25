;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname GloverTrainer Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int TGold = akSpeaker.Getitemcount(gold001)
Game.ShowTrainingMenu(akSpeaker)
utility.waitmenumode(1)
utility.wait(0.1)
if( akSpeaker.GetRelationshipRank( Game.GetPlayer() ) < 4 )
  akSpeaker.removeitem(gold001, (akSpeaker.getitemcount(gold001)))
  akSpeaker.additem(gold001, TGold)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  
