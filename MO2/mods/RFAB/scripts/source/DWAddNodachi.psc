;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DWAddNodachi Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(RFAB_Weapon_Silver_Nodachi_Elite, 1)
Game.GetPlayer().RemoveItem(RFAB_Weapon_Greatsword_Vigilant, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WEAPON Property RFAB_Weapon_Silver_Nodachi_Elite  Auto  

WEAPON Property RFAB_Weapon_Greatsword_Vigilant  Auto  
