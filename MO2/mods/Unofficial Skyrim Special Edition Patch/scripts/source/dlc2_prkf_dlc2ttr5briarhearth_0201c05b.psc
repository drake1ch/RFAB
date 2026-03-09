;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname DLC2_PRKF_DLC2TTR5BriarheartH_0201C05B Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
; collect briarheart
akTargetRef.RemoveItem(Briarheart, 1)
akTargetRef.RemoveItem(ArmorBriarHeart, 1); UDBP 2.1.2 Bug #19159 - Removal of the ARMO briar heart seed and replacement with the broken wicker cage "empty" ARMO, since the OnContainerChange event on the original seed's script has no chance to do it.
akTargetRef.AddItem(ArmorBriarHeartEmpty, 1); UDBP 2.1.2 - see above
(akTargetRef as Actor).EquipItem(ArmorBriarHeartEmpty); UDBP 2.1.2 - see above
akActor.AddItem(Briarheart, 1)
DLC2TTR5.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2TTR5  Auto  

Ingredient Property BriarHeart  Auto  

Armor Property ArmorBriarHeart  Auto  

Armor Property ArmorBriarHeartEmpty  Auto  
