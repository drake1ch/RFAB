Scriptname RFAB_MiscItem_OnClicked_SetStage extends ObjectReference  

Quest Property MyQuest Auto
Int Property Stage Auto

Event OnEquipped(Actor akActor)
	debug.messagebox("clicked")
    MyQuest.SetStage(Stage)
EndEvent