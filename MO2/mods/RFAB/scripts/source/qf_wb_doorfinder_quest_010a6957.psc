;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WB_DoorFinder_Quest_010A6957 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WB_Activator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Activator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Door Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Int WhichDoorToCreate = WB_AlterationAlt_Message_DoorToAnywhere.Show()
WB_Door[WhichDoorToCreate].ForceRefTo(Alias_WB_Door.GetReference())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property WB_AlterationAlt_Message_DoorToAnywhere  Auto  

ReferenceAlias[] Property WB_Door  Auto  
