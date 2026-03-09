;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__000D6CC0 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().setstage(30)
Game.GetPlayer().AddItem(MS09Missive.GetReference(), 1)
Game.GetPlayer().RemoveItem(MS09Letter01, 1)
akSpeaker.AddItem(MS09Letter01, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MS09Missive  Auto  
Book Property MS09Letter01 Auto
