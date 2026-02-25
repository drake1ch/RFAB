;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF__080291A7 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE HH_NW_RB
Quest __temp = self as Quest
HH_NW_RB kmyQuest = __temp as HH_NW_RB
;END AUTOCAST
;BEGIN CODE
kmyQuest.InitializeMod()
kmyQuest.setBlockKeyCode()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
