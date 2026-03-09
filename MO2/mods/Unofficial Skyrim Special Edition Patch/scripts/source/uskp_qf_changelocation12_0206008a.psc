;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname USKP_QF_ChangeLocation12_0206008A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Romlyn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Romlyn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Indaryn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Indaryn Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_Romlyn.GetActorReference().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Romlyn.TryToMoveTo(USKPRomlynJailMarker)
Alias_Romlyn.GetActorReference().SetOutfit(PrisonerOutfit)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property USKPRomlynJailMarker  Auto
Outfit Property PrisonerOutfit Auto 