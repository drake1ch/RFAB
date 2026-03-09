;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname USKP_QF_ChangeLocation14_0302C1C6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Champion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Champion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonToggle
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DungeonToggle Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;USKP 2.0.4 - Return the dungeon to its normal state so radiant quests will not break.
Alias_Champion.GetReference().Disable()
Alias_DungeonToggle.GetReference().Enable()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
