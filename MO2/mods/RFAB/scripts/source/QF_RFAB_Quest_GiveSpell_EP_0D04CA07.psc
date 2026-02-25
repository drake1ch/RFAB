;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_RFAB_Quest_GiveSpell_EP_0D04CA07 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Game.GetPlayer().addspell(MySpell, abVerbose = false)
Game.GetPlayer().addspell(MySpell1, abVerbose = false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property mySpell  Auto  

SPELL Property MySpell1  Auto  
