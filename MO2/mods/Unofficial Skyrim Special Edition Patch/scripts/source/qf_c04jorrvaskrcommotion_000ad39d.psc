;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_C04JorrvaskrCommotion_000AD39D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gawker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gawker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gawker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gawker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MeleeTreeCompanion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MeleeTreeCompanion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gawker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gawker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RangedGateCompanion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RangedGateCompanion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Njada
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Njada Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gawker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gawker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Athis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Athis Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE C04JorrvaskrCommotionScript
Quest __temp = self as Quest
C04JorrvaskrCommotionScript kmyQuest = __temp as C04JorrvaskrCommotionScript
;END AUTOCAST
;BEGIN CODE
OutsideToggler.Enable()
InsideToggler.Enable()
CommotionTrigger.Enable() ; USKP 2.0.1 - Added after taking the trigger off its enable parent.

kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE C04JorrvaskrCommotionScript
Quest __temp = self as Quest
C04JorrvaskrCommotionScript kmyQuest = __temp as C04JorrvaskrCommotionScript
;END AUTOCAST
;BEGIN CODE
OutsideToggler.Disable()
InsideToggler.Disable()

kmyQuest.Teardown()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property OutsideToggler  Auto  

ObjectReference Property InsideToggler  Auto  

ObjectReference Property CommotionTrigger Auto
