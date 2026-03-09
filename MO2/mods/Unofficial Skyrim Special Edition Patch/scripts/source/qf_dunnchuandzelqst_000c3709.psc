;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_dunNchuandZelQst_000C3709 Extends Quest Hidden

;BEGIN ALIAS PROPERTY kragBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_kragBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY erjBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_erjBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CalcelmoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CalcelmoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY staubsBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_staubsBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY strommBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_strommBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FinalLever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FinalLever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AlethiusNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AlethiusNote Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
setObjectiveCompleted(50)
setObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
setObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
setObjectiveDisplayed(20,1)
setObjectiveDisplayed(30,1)
setObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(100)
AchievementsQuest.IncSideQuests()
CompleteAllObjectives() ;Added by USKP 2.0.4 [Bug #13432]
Stop() ; Added by USKP 1.3.2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
FailAllObjectives() ;Added by USKP 2.0.4 [Bug #13432]
Stop() ; Added by USKP 1.3.2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

achievementsScript Property AchievementsQuest  Auto  
