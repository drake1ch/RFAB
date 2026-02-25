;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 0
Scriptname QF_RFAB_Quest_SolitudeSewers_0D15A76F Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(0, true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
self.setobjectivecompleted(1, true)
	self.SetObjectiveDisplayed(2, true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
setobjectivecompleted(0, true)
SetObjectiveDisplayed(1, true, false)
game.getplayer().addspell(musictrackerspell, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
self.CompleteAllObjectives()
	self.CompleteQuest()
	game.getplayer().removespell(musictrackerspell)
	XP.OnQuestComplete(self)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
self.setobjectivecompleted(2, true)
	self.SetObjectiveDisplayed(3, true, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RFAB_XP_Handler Property XP Auto
Spell Property musictrackerspell Auto
