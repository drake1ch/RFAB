;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DWAddSpear Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(RFAB_Weapon_Silver_Spear_Elite, 1)
Game.GetPlayer().RemoveItem(RFAB_Weapon_Greatsword_Vigilant, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WEAPON Property RFAB_Weapon_Silver_Spear_Elite  Auto  

WEAPON Property RFAB_Weapon_Greatsword_Vigilant  Auto  
