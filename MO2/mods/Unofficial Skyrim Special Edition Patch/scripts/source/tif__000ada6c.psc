;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000ADA6C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Script rewritten by USKP 1.2.6 to fix trainer gold exploit.
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

MiscObject Property gold001 Auto
