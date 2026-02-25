;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Misc_Gudbrand_Quest_SilverHand02_02 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ObjectReference DogNote = (GetOwningQuest().GetAliasByName("DogNote") as ReferenceAlias).GetReference()
Game.GetPlayer().AddItem(DogNote, 1)

;DogNote.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueScene  Auto  
