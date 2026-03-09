;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname TIF__0002C255 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;USKP 2.0.1 - Fixed this so it doesn't use the alias which is severely screwed up anyway.
Game.GetPlayer().RemoveItem(BriarHeart, 1)
Game.GetPlayer().RemoveItem(Ingredient2, 1)
Game.GetPlayer().RemoveItem(Ingredient3, 1)

DeathScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property BriarHeart Auto
MiscObject Property Ingredient2 Auto
MiscObject Property Ingredient3 Auto

Scene Property DeathScene Auto
