;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname PRKF_RFAB_Perk_Enchanting_Ar_00058F7E Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
ChoiseID.SetValueInt(Choise.Show())
akTargetRef.Activate(akActor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property Choise  Auto  

GlobalVariable Property ChoiseID  Auto  
