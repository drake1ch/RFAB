Scriptname dunLabyrinthianUltraMaskBustSCRIPT extends ObjectReference  
{Acts as control script for mask altar}

bool property Mask01placed auto
bool property Mask02placed auto
bool property Mask03placed auto
bool property Mask04placed auto
bool property Mask05placed auto
bool property Mask06placed auto
bool property Mask07placed auto
bool property Mask08placed auto

bool property placed auto
bool property hasBeenUnlocked auto
bool UpdatedPlacement = False ; USKP 2.0.4 - This gets updated when placing a mask. This way any old ones will be returned to the player.
ObjectReference Property USKPMaskStorageChest Auto

objectReference property myBustActivator auto

message property defaultLackTheItemMSG auto
armor property ArmorDragonPriestMaskUltraHelmet auto

EVENT onActivate(objectReference actronaut)
	if( USKPMaskStorageChest == None )
		USKPMaskStorageChest = Game.GetFormFromFile(0x0003B9F3, "Unofficial Skyrim Special Edition Patch.esp") As ObjectReference
		
		if( USKPMaskStorageChest.GetItemCount(ArmorDragonPriestMaskUltraHelmet) > 0 )
			placed = True
			UpdatedPlacement = True
		EndIf
	EndIf

	if placed == FALSE
		if actronaut.getItemCount(ArmorDragonPriestMaskUltraHelmet) >= 1
			blockActivation()
			actronaut.removeItem(ArmorDragonPriestMaskUltraHelmet, 1, akOtherContainer = USKPMaskStorageChest)
			placed = TRUE
			UpdatedPlacement = True
			myBustActivator.playAnimationandWait("on","TransOn")
			blockActivation(FALSE)
		else
			defaultLackTheItemMSG.show()
		endif
	elseif placed == TRUE
		blockActivation()
		if( UpdatedPlacement )
			USKPMaskStorageChest.RemoveAllItems(actronaut)
		Else
			actronaut.addItem(ArmorDragonPriestMaskUltraHelmet, 1)
		EndIf
		placed = FALSE
		myBustActivator.playAnimationAndWait("off","TransOff")
		blockActivation(FALSE)
	endif
	
endEVENT