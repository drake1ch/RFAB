Scriptname RFAB_OnMiscItemClicked_SetStage extends ReferenceAlias  

String Property Text Auto

String[] Property Buttons Auto
Quest[] Property MyQuests Auto
Int[] Property Stages Auto

Bool Property DoOnce Auto

Event OnEquipped(Actor akActor)
	GoToState("Completed")
	int ChooseID = Skymessage.ShowArray(Text, Buttons, getIndex = true) as int
	MyQuests[ChooseID].SetStage(Stages[ChooseID])

	if !DoOnce
		GoToState("")
	endif
EndEvent

State Completed
	Event OnEquipped(Actor akActor)
	EndEvent
EndState
