;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname USKP_QF_ChangeLocation17_030196B3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY KeepMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KeepMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ogmund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ogmund Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
FreeformMarkarthMPostQuest.Stop()
Alias_Ogmund.GetActorReference().SetRestrained(false)
Alias_Ogmund.GetActorReference().MoveTo(Alias_KeepMarker.GetReference())
Alias_Ogmund.GetActorReference().EvaluatePackage()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FreeformMarkarthMPostQuest Auto 
