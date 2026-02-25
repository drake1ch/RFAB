;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_WB_FabricateEquipment_Que_030DD9C7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WB_Item1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Item1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Item4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Item4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Item2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Item2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Item3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Item3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WB_Item5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WB_Item5 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor ThePlayer = Game.GetPlayer()
ThePlayer.RemoveItem(Alias_WB_Item1.GetReference(), abSilent = true)
ThePlayer.RemoveItem(Alias_WB_Item2.GetReference(), abSilent = true)
ThePlayer.RemoveItem(Alias_WB_Item3.GetReference(), abSilent = true)
ThePlayer.RemoveItem(Alias_WB_Item4.GetReference(), abSilent = true)
ThePlayer.RemoveItem(Alias_WB_Item5.GetReference(), abSilent = true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment