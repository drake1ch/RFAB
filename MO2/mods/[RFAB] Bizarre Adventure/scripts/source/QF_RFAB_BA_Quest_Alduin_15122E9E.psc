;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_RFAB_BA_Quest_Alduin_15122E9E Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
GameHour.SetValue(16)
Utility.Wait(3.5)
ScriptRadiant.MoveToHub()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Game.TeachWord(WordJooR)
Game.TeachWord(WordZah)
Game.TeachWord(WordFRUL)
Game.UnlockWord(WordJooR)
Game.UnlockWord(WordZah)
Game.UnlockWord(WordFRUL)

Game.TeachWord(WordLok)
Game.TeachWord(WordVah)
Game.TeachWord(WordKoor)
Game.UnlockWord(WordLok)
Game.UnlockWord(WordVah)
Game.UnlockWord(WordKoor)

MQ305.SetStage(100)

BizarreCampMarker.Disable()
BizarreSheoMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WordOfPower Property WordJooR Auto
WordOfPower Property WordZah Auto
WordOfPower Property WordFRUL Auto

Quest Property MQ305 Auto

GlobalVariable Property GameHour Auto

RFAB_BA_Radiant Property ScriptRadiant Auto

ObjectReference Property BizarreCampMarker Auto

ObjectReference Property BizarreSheoMarker Auto

WordOfPower Property WordLok  Auto  

WordOfPower Property WordVah  Auto  

WordOfPower Property WordKoor  Auto  
