;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname RFAB_Quest_GoodDeath Extends Quest Hidden

;BEGIN ALIAS PROPERTY OldOrc
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OldOrc Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_OldOrc.GetActorRef().RemoveFromFaction(CrimeFactionWhiterun)
Alias_OldOrc.GetActorRef().StartCombat(Game.GetPlayer())
Alias_OldOrc.GetActorRef().SetActorValue("Aggression", 1)
If (Alias_OldOrc.GetActorRef().GetRelationshipRank(Game.GetPlayer()) > -3)
    Alias_OldOrc.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -3)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CrimeFactionWhiterun  Auto  
