;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_dunNilheimQST_0001BAEC Extends Quest Hidden

;BEGIN ALIAS PROPERTY banditB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_banditB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY banditA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_banditA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY banditC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_banditC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Telrav
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Telrav Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nilheim_Camp
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nilheim_Camp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY banditD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_banditD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY banditE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_banditE Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Telrav.getActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;AchievementsQuest.IncSideQuests() - USKP 2.0.6: This isn't a "side quest" so should not increment the achievement for it.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

achievementsScript Property achievementsQuest  Auto  
