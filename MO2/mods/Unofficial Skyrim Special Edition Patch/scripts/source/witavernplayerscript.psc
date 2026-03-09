Scriptname WITavernPlayerScript Extends ReferenceAlias
{Script on Player Alias in WITavern quest}

Keyword Property FurnitureSpecial Auto

 Event OnSit(ObjectReference akFurniture)
;	debug.MessageBox("WITavernPlayerScript Player sat down.")

	;USKP 2.0.6 Bug #16725 - Keeps cooking pots from triggering tavern server behavior. 
	;USLEEP 3.0.1 Bug #19502 - Expanded fix to cover all special furniture so that it only triggers when sitting on normal stuff.
	If akFurniture.HasKeyword(FurnitureSpecial)
		;Nothing
	Else
		(GetOwningQuest() as WITavernScript).PlayerSatDown()
	EndIf

EndEvent

 Event OnGetUp(ObjectReference akFurniture)
;	debug.MessageBox("WITavernPlayerScript Player got up.")
 

EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		(GetOwningQuest() as WITavernScript).PlayerCHangedLocation()
	
EndEvent

