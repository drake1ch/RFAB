;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname Quest_SilverMold Extends Quest Hidden

;BEGIN ALIAS PROPERTY Endon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Endon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SilverMold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SilverMold Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_Endon.GetActorRef().AddItem(Alias_SilverMold.GetRef())
Game.GetPlayer().AddItem(Gold, 1000)
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
if Game.GetPlayer().GetItemCount(Alias_SilverMold.GetRef()) > 0
	SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

