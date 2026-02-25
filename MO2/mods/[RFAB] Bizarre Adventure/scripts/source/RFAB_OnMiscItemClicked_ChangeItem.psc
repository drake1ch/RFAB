Scriptname RFAB_OnMiscItemClicked_ChangeItem extends ReferenceAlias  

String Property Text Auto
String[] Property Buttons Auto
String[] Property NewNames Auto
Bool Property DoOnce Auto

Event OnEquipped(Actor akActor)
	int ChooseID = Skymessage.ShowArray(Text, Buttons, getIndex = true) as int
	self.GetReference().SetDisplayName(NewNames[ChooseID])

	UpdateUI()
	if DoOnce
		GoToState("Completed")
	endif
EndEvent

State Completed
	Event OnEquipped(Actor akActor)
	EndEvent
EndState

Function UpdateUI()

	;UI.Invoke("InventoryMenu", "_root.Menu_mc.InventoryDataSetter")

	Actor Player = Game.GetPlayer()
	Form Gold = Game.GetForm(0x0000000F)

	Player.AddItem(Gold, 1, true)
	Player.RemoveItem(Gold, 1, true)
EndFunction