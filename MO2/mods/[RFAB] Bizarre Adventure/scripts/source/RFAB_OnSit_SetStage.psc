Scriptname RFAB_OnSit_SetStage extends ReferenceAlias  

Furniture Property MyFurniture Auto
Quest Property MyQuest Auto
Int Property Stage Auto

Event OnSit(ObjectReference akFurniture)
    if akFurniture.GetBaseObject() == MyFurniture
    	MyQuest.SetStage(Stage)
    endif
EndEvent