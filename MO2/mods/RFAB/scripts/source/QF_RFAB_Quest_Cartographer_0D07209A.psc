;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_RFAB_Quest_Cartographer_0D07209A Extends Quest Hidden

;BEGIN ALIAS PROPERTY CartographerReference
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CartographerReference Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Door Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Map
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Map Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_0 in script QF_RFAB_Quest_Cartographer_0D07209A
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_CartographerReference.GetActorRef().RemoveFromFaction(WhiterunCrimefaction) ;Удаляем деду краймфекшн Вайтрана в момент нападения на игрока
Alias_CartographerReference.GetActorRef().SetRelationshipRank(Player, -1) ; Делаем деда нашим врагом
Attacker.StartCombat(Player)
Attacker.SetActorValue("Aggression", 1)
XP.OnQuestComplete(self)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(30)

Player.RemoveItem(Alias_Map.GetReference())
;Alias_CartographerReference.GetReference().additem(Alias_Map.GetReference()) ;Это нам не надо
if Alias_CartographerReference.GetReference().GetItemCount(Ring11) >= 1
    Alias_CartographerReference.GetReference().RemoveItem(Ring11, 1)
    Player.AddItem(Ring11, 1)
else
    Player.AddItem(DummyRing, 1)
endif
Alias_CartographerReference.GetActorRef().SetRelationshipRank(Player, 1) ;Делаем деда нашим другом
XP.OnQuestComplete(self)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Item  Auto  

Actor Property Player  Auto  

Actor Property Attacker  Auto  

ObjectReference Property RFAB_Ring_AbjurationRing  Auto  

Armor Property Ring11  Auto  

Faction Property WhiterunCrimefaction  Auto  ; Проп краймфекшна

Armor Property DummyRing  Auto  ; Проп мусорного кольца

RFAB_XP_Handler Property Xp  Auto  
