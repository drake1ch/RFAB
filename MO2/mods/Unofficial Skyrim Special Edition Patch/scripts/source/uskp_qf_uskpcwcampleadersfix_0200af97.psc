;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname USKP_QF_USKPCWCampLeadersFix_0200AF97 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Tullius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tullius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ulfric
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ulfric Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE USKPCWCampLeadersFixScript
Quest __temp = self as Quest
USKPCWCampLeadersFixScript kmyQuest = __temp as USKPCWCampLeadersFixScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FixThisShitOrElse()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
