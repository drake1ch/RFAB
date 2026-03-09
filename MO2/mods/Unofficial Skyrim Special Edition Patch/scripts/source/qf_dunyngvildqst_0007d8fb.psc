;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_dunYngvildQST_0007D8FB Extends Quest Hidden

;BEGIN ALIAS PROPERTY WizKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WizKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Warlock
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Warlock Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Stop() ; Added by USKP 2.0.4 so the body will eventually clean up.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE dunYngvildQSTscript
Quest __temp = self as Quest
dunYngvildQSTscript kmyQuest = __temp as dunYngvildQSTscript
;END AUTOCAST
;BEGIN CODE
alias_Warlock.GetActorReference().removeFromFaction(kmyquest.dunYngvildFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
