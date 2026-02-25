;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname Quest_dunBardsLeapSummitQST Extends Quest Hidden

;BEGIN ALIAS PROPERTY GhostBard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GhostBard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StarterObject
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StarterObject Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Setup stage so the quest doesn't start unless jumping off the cliff
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Done talking to ghost, recieve piece of poetic edda, take to bards college

if ghostSceneDone
	alias_GhostBard.getReference().disable(abFadeOut=true)
	(alias_StarterObject.getReference() as dunBardsLeapSetStageOnCellDetach).goToState("Done")
	utility.wait(3.0)
	alias_GhostBard.getReference().delete()
	alias_StarterObject.getReference().delete()
	stop()
else
	alias_GhostBard.getReference().disable(abFadeOut=false)
	stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
alias_GhostBard.getReference().enable(abFadeIn=true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player has passed through falling triggerbox
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;has exited pool, Ghost should approach player
; debug.trace("Bards Leap: Should start GhostScene")
BardScene.start()

XP.OnQuestComplete(self)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


scene Property BardScene  Auto  

LeveledItem Property RewardList  Auto  

AchievementsScript Property AchievementsQuest Auto

bool Property ghostSceneDone = false Auto  

RFAB_XP_Handler Property Xp  Auto  
