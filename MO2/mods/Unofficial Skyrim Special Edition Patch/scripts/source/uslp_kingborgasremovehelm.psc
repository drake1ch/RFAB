Scriptname USLP_KingBorgasRemoveHelm extends ObjectReference  
{Removes draugr helms from King Borgas since they cause clipping with the Jagged Crown. Bug #19458}

Armor Property DraugrHelmet01 Auto
Armor Property DraugrHelmet02 Auto
Armor Property DraugrHelmet03 Auto

Event OnLoad()
	Utility.Wait(1)

	Self.RemoveItem(DraugrHelmet01, 999)
	Self.RemoveItem(DraugrHelmet02, 999)
	Self.RemoveItem(DraugrHelmet03, 999)
EndEvent
