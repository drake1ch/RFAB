;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname UHFP_TIF_WICourier_02003DE5 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if( akSpeaker.GetItemCount(BYOHAdoptionStewardCourierNote) > 0 )
	Game.GetPlayer().Additem(JarlNote.GetReference())
EndIf
if( akSpeaker.GetItemCount(BYOHHouseJarlFriendLetter) > 0 )
	UHFPJarlsLetterMessage.Show()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property BYOHAdoptionStewardCourierNote Auto
Book Property BYOHHouseJarlFriendLetter Auto
ReferenceAlias Property JarlNote Auto
Message Property UHFPJarlsLetterMessage Auto
