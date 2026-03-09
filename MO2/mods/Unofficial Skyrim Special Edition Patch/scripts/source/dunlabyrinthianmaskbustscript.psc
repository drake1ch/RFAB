Scriptname dunLabyrinthianMaskBustSCRIPT extends ObjectReference  
{Handling Script for Mask Busts}

armor property myMask auto
{Which mask am I made for?}
int property myIndex auto
{Need indices to track the various masks}
MusicType property FinalMaskRevealMusic auto


message property defaultLackTheItemMSG auto

dunLabyrinthianUltraMaskBustSCRIPT property master auto

bool placed = FALSE
bool UpdatedPlacement = False ; USKP 2.0.4 - This gets updated when placing a mask. This way any old ones will be returned to the player.
ObjectReference Property USKPMaskStorageChest Auto

;USKP 2.0.4 - Changed slightly to store masks in chests. These placement activators have the same issue as Wuuthrad.
EVENT onActivate(objectReference actronaut)
	if placed == FALSE
		if actronaut.getItemCount(myMask) >= 1
			blockActivation()
			actronaut.removeItem(myMask, 1, akOtherContainer = USKPMaskStorageChest)
			placed = TRUE
			UpdatedPlacement = True
			getLinkedRef().playAnimationandWait("on","TransOn")
			updateMaster()
			blockActivation(FALSE)
		else
			defaultLackTheItemMSG.show()
		endif
	elseif placed == TRUE
		blockActivation()
		if( UpdatedPlacement )
			USKPMaskStorageChest.RemoveAllItems(actronaut)
		Else
			actronaut.addItem(myMask, 1)
		EndIf
		placed = FALSE
		getLinkedRef().playAnimationAndWait("off","TransOff")
		updateMaster()
		blockActivation(FALSE)
	endif
	
endEVENT

FUNCTION updateMaster()
		; empty is false so I must have just placed a mask
		if myIndex == 01
			master.Mask01placed = placed
		elseif myIndex == 02
			master.Mask02placed = placed
		elseif myIndex == 03
			master.Mask03placed = placed
		elseif myIndex == 04
			master.Mask04placed = placed
		elseif myIndex == 05
			master.Mask05placed = placed
		elseif myIndex == 06
			master.Mask06placed = placed
		elseif myIndex == 07
			master.Mask07placed = placed
		elseif myIndex == 08
			master.Mask08placed = placed
		endif
		
		; check to see if that completes the collection
		if master.mask01placed == TRUE && master.mask02placed == TRUE && master.mask03placed == TRUE && master.mask04placed == TRUE && master.mask05placed == TRUE && master.mask06placed == TRUE && master.mask07placed == TRUE && master.mask08placed == TRUE
			if master.hasBeenUnlocked == FALSE
				master.hasBeenUnlocked = TRUE
				objectReference masterBust = master.myBustActivator
				masterBust.playAnimation("on")
				master.placed = TRUE
				master.getLinkedRef().playAnimation("open")
				FinalMaskRevealMusic.add()
			endif
		endif
			
endFUNCTION
