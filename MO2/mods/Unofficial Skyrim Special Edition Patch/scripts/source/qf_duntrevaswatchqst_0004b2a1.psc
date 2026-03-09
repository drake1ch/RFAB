;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname QF_dunTrevasWatchQST_0004B2A1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Backdoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Backdoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DiningWizard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DiningWizard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BodyGuard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BodyGuard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bodyguard2Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bodyguard2Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BodyGuard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BodyGuard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StalleoMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StalleoMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BodyGuard1Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BodyGuard1Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY diningMissile
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_diningMissile Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY stalleo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_stalleo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DiningMelee
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DiningMelee Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Brurid
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Brurid Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
CompleteAllObjectives() ; Added by USKP 1.3.2.
AchievementsQuest.IncSideQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)
;Added by USKP 1.3.3 - If gate is already open, allow quest to progress.
if( USKP_TreviaFrontGate.isOpen == true )
 SetObjectiveCompleted(10)
 SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20) ; Added by USKP 1.3.2.
SetObjectiveDisplayed(60) ; Added by USKP 1.3.2.
alias_Stalleo.TryTomoveTo(alias_StalleoMarker.getReference())
alias_Stalleo.TryToEvaluatePackage()
alias_bodyguard1.TryTomoveTo(alias_BodyGuard1Marker.getReference())
alias_bodyguard1.TryToEvaluatePackage()
alias_bodyguard2.TryTomoveTo(alias_BodyGuard2Marker.getReference())
alias_bodyguard2.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10) ; Added by USKP 1.3.2.
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

achievementsscript Property achievementsquest  Auto  

default2StateActivator Property USKP_TreviaFrontGate Auto
