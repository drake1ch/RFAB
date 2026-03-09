;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname USKP_QF_ChangeLocation15_0303D4E4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Nirnroot5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nirnroot5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nirnroot3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nirnroot3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nirnroot1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nirnroot1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nirnroot4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nirnroot4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nirnroot2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nirnroot2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;USKP 2.0.5 - Enable Sareth Farm Crimson Nirnroots
Alias_Nirnroot1.GetReference().Enable()
Alias_Nirnroot2.GetReference().Enable()
Alias_Nirnroot3.GetReference().Enable()
Alias_Nirnroot4.GetReference().Enable()
Alias_Nirnroot5.GetReference().Enable()
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
