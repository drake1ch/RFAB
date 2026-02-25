Scriptname RFAB_BA_Script_BearTamer extends ObjectReference  

Bool Property DoOnce = False Auto
String Property Text Auto
LeveledItem Property Item  Auto  


bool activated

Event OnActivate(ObjectReference akActionRef)

	if DoOnce && activated == true
		return
	endif

	if akActionRef == Game.GetPlayer()
		self.AddItem(Item)
		Debug.MessageBox(Text)
		activated = true
	endif

EndEvent
