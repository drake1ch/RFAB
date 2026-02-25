;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname RFAB_BlockSitting Extends Perk Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
string[] Buttons = new string[2]
Buttons[0] = "Да"
Buttons[1] = "Нет"

int ChooseID = SkyMessage.ShowArray("Использовать " + akTargetRef.GetDisplayName() + "?", Buttons, getIndex = true) as int
if ChooseID == 0
	akTargetRef.Activate(akActor)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
