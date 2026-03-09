;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname USKP_QF_ChangeLocation10_0202D412 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BrunwulfGreyQuarterTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrunwulfGreyQuarterTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LonelyGale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LonelyGale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jorleif
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jorleif Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Jorleif.TryToAddToFaction(GovExiled)
Alias_Jorleif.TryToRemoveFromFaction(GovRuling)
if( MS11.IsRunning() )
  MS11AuthorityFigure.ForceRefTo(Alias_LonelyGale.GetReference())
endif
Alias_BrunwulfGreyQuarterTrigger.GetReference().Disable()
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

Faction Property GovExiled  Auto  

Faction Property GovRuling  Auto  

ReferenceAlias Property MS11AuthorityFigure Auto
Quest Property MS11 Auto
