Scriptname MannequinActivatorSCRIPT extends Actor  

;This script has been extensively rewritten for the Unofficial Hearthfire Patch.
;
;No more armor duplication when adding things.
;No more armor that fails to display after being added and returning to the cell later.
;No more wandering about the cell.
;Player cannot accidentally place more on the mannequin than it has slots to hold things for, which would have caused the item to be unrecoverable.
;Cleared out all the junk comments that were making this a nightmare to read and debug.
;Automatically updates all mannequins as they are loaded.

import debug
import utility

idle Property Pose01 Auto
idle Property Pose02 Auto
idle Property Pose03 Auto

Form Property ArmorSlot01 auto hidden
Form Property ArmorSlot02 auto hidden
Form Property ArmorSlot03 auto hidden
Form Property ArmorSlot04 auto hidden
Form Property ArmorSlot05 auto hidden
Form Property ArmorSlot06 auto hidden
Form Property ArmorSlot07 auto hidden
Form Property ArmorSlot08 auto hidden
Form Property ArmorSlot09 auto hidden
Form Property ArmorSlot10 auto hidden

Form Property EmptySlot auto hidden

Form[] ArmorSlot
bool Converted

Message Property MannequinActivateMESSAGE Auto
{Message that appears upon activating the mannequin}

Message Property MannequinArmorWeaponsMESSAGE Auto
{Message that appears when you attempt to place a non-armor item}

int Property CurrentPose = 1 Auto
{The pose the Mannequin starts in, and is currently in. DEFAULT = 1}

bool Property bResetOnLoad = FALSE	Auto
{ this should be set to TRUE for mannequins that start disabled and are enabled while the cell is loaded DEFAULT = FALSE }

Function ConvertArmorSlots()
	Converted = True

	ArmorSlot = new Form[10]
	
	ArmorSlot[0] = ArmorSlot01
	ArmorSlot01 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot02) )
		ArmorSlot[1] = ArmorSlot02
	EndIf
	ArmorSlot02 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot03) )
		ArmorSlot[2] = ArmorSlot03
	EndIf
	ArmorSlot03 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot04) )
		ArmorSlot[3] = ArmorSlot04
	EndIf
	ArmorSlot04 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot05) )
		ArmorSlot[4] = ArmorSlot05
	EndIf
	ArmorSlot05 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot06) )
		ArmorSlot[5] = ArmorSlot06
	EndIf
	ArmorSlot06 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot07) )
		ArmorSlot[6] = ArmorSlot07
	EndIf
	ArmorSlot07 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot08) )
		ArmorSlot[7] = ArmorSlot08
	EndIf
	ArmorSlot08 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot09) )
		ArmorSlot[8] = ArmorSlot09
	EndIf
	ArmorSlot09 = EmptySlot
	
	if( !IsDuplicated(ArmorSlot10) )
		ArmorSlot[9] = ArmorSlot10
	EndIf
	ArmorSlot10 = EmptySlot

EndFunction

EVENT OnCellLoad()
	if( Converted == false )
		ConvertArmorSlots()
	EndIf
	
	if IsEnabled() && !bResetOnLoad 
		ResetPosition()
	endif
EndEVENT

EVENT OnLoad()
	if( Converted == false )
		ConvertArmorSlots()
	EndIf

	if bResetOnLoad
		; only do this once - for cases where mannequin is enabled in a loaded cell
		bResetOnLoad = false
		ResetPosition()
	endif
endEVENT

EVENT OnActivate(ObjectReference TriggerRef)
	if( Converted == false )
		ConvertArmorSlots()
	EndIf
	
	PlayCurrentPose()
	self.OpenInventory(TRUE)
	
	;Trace("DARYL - " + self + " Moving to my linked ref")
	MoveTo(GetLinkedRef())
	
	;Trace("DARYL - " + self + " Waiting a second to give me some time to animate to my pose")
	wait(0.1)
	
	;Trace("DARYL - " + self + " Disabling my AI so i'll freeze in place")
	self.EnableAI(FALSE)

EndEVENT	

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	;Trace("DARYL - " + self + " Adding " + akBaseItem + " to the Mannequin")
	
	if (akBaseItem as Armor) 
		;Trace("DARYL - " + self + " Form " + akBaseItem + " is armor!")
		if( !AddToArmorSlot(akBaseItem) )
			;Turn it back if the mannequin has one of these already, or if all the slots are full.
			self.RemoveItem(akBaseItem, aiItemCount, true, Game.GetPlayer())
		Else
			self.EquipItem(akBaseItem)
		EndIf
	else
		;Trace("DARYL - " + self + " Form " + akBaseItem + " is NOT armor!")
		MannequinArmorWeaponsMESSAGE.Show()
		self.RemoveItem(akBaseItem, aiItemCount, true, Game.GetPlayer())
	endif
	
endEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	;Trace("DARYL - " + self + akBaseObject + " was unequipped by the Mannequin")
	
	if (akBaseObject as Armor)
		;Trace("DARYL - " + self + " Form " + akBaseObject + " is armor!")
		RemoveFromArmorSlot(akBaseObject)
	else
		;Trace("DARYL - " + self + " Form " + akBaseObject + " is NOT armor!")
	endif
endEvent

Function ResetPosition()
	;Trace("DARYL - " + self + " Blocking actors activation")
	self.BlockActivation()
	
	;Trace("DARYL - " + self + " Moving to my linked ref")
	self.EnableAI(TRUE)

	MoveTo(GetLinkedRef())

	;Trace("DARYL - " + self + " Calling EquipCurrentArmor() Function")
	;Also needs to be enabled and fully loaded before armor equipping can happen
	while !self.is3DLoaded()
	endWhile
	EquipCurrentArmor()
	
	;Trace("DARYL - " + self + " Disabling my AI so I'll freeze in place")
	self.EnableAI(FALSE)
endFunction

Function PlayCurrentPose()
	if CurrentPose == 1
		PlayIdle(Pose01)
	elseif CurrentPose == 2
		PlayIdle(Pose02)
	elseif CurrentPose == 3
		PlayIdle(Pose03)
	endif
endFunction

Function EquipCurrentArmor()
	UnequipAll()
	
	int sn = 0
	While( sn < 10 )
		if( ArmorSlot[sn] != EmptySlot )
			EquipItem(ArmorSlot[sn])
		EndIf
		sn += 1
	EndWhile
endFunction

bool Function IsDuplicated(Form ArmorItem)
	int sn = 0
	while( sn < 10 )
		if( ArmorSlot[sn] == ArmorItem )
			return true
		EndIf
		sn += 1
	EndWhile
	
	return False
EndFunction

bool Function AddToArmorSlot(Form akBaseItem)
	;First check to see if this is already in a slot
	if( IsDuplicated(akBaseItem) )
		return False
	EndIf
		
	;Now find an emtpy slot to put it in, if there is one.
	int sn = 0
	while( sn < 10 )
		if( ArmorSlot[sn] == EmptySlot )
			ArmorSlot[sn] = akBaseItem
			EquipItem(akBaseItem)
			return True
		EndIf
		sn += 1
	EndWhile
	
	;Nope. No room left.
	return False
endFunction

Function RemoveFromArmorSlot(Form akBaseItem)
	;This loop will also clear duplicates that might have been generated.
	int sn = 0
	while( sn < 10 )
		if( ArmorSlot[sn] == akBaseItem )
			ArmorSlot[sn] = EmptySlot
		EndIf
		sn += 1
	EndWhile
endFunction
