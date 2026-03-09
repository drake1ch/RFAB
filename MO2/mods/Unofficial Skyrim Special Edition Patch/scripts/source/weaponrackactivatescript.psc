Scriptname WeaponRackActivateSCRIPT extends ObjectReference Hidden 
{Activating this causes the players currently equipped weapon to be placed on the rack}

;Modifications by Sclerocephalus - debug version 3.4 (10/21/2013)
;modified by taleden - rev 4 (2013-11-01)
;Modifications by DayDreamer - version 5.0 (2014 Mar 15)

import game
import debug
import utility
import quest


;-------------------------------------------

int Property RackType = 1 Auto
{The type of rack this script is on:  Default = 1
1 = Standard Weapon Rack (Includes Regular, Mount, and CoA [single] Weapon Racks)
2 = COA Shield Rack
3 = COA Weapon Rack (Both left and right)
4 = Table-top Dagger Rack
5 = large display case [USKP]
}

Bool Property Patch14COARacks = FALSE Auto

Message Property Patch14WeaponRackNoBowMESSAGE Auto
{replaces WeaponRackNoBowMESSAGE}

Message Property WeaponRackActivateMESSAGE Auto
{Message you get when you activate the weapon rack for the very first time}

Message Property WeaponRackNoShieldMESSAGE Auto
{Message you get when you activate the shield rack without a shield equipped}

Message Property WeaponRackNoWeaponMESSAGE Auto
{Message you get when you activate the weapon rack without a weapon equipped}

Message Property WeaponRackNoDaggerMESSAGE Auto
{Message you get when you activate the weapon rack and a dagger isn't allowed to be placed}

Message Property WeaponRackNoBowMESSAGE Auto
{Message you get when you activate the weapon rack and a bow isn't allowed to be placed}

Message Property WeaponRackOnlyDaggerMESSAGE Auto
{Message you get when you can only place daggers in the rack and try to place something else}
;///
Int Property ButtonPressed Auto Hidden
{Button that was pressed when WeaponRackActivateMESSAGE is displayed}
///;
Bool Property AlreadyInit Auto Hidden
{If true this reference won't run it's intialization a second time}

Bool Property MessageAlreadyShown Auto Hidden
GlobalVariable Property WRackGlobal Auto
{Global that determines if you have seen the help message yet or not}
;this global is set to one when the WeaponRackActivateMESSAGE has been displayed

;///Keywords for the type of xMarkers
Keyword Property WRackGreatSword Auto
Keyword Property WRackWarhammer Auto
Keyword Property WRackBattleaxe Auto
Keyword Property WRackBow Auto
Keyword Property WRackSword Auto
Keyword Property WRackMace Auto
Keyword Property WRackWarAxe Auto
Keyword Property WRackStaff Auto
Keyword Property WRackShield Auto	///;
Keyword Property WRackTrigger Auto

;Keyword for types of weapons
Keyword Property WeaponTypeBattleAxe Auto
Keyword Property WeaponTypeBow Auto
Keyword Property WeaponTypeDagger Auto
Keyword Property WeaponTypeGreatSword Auto
Keyword Property WeaponTypeMace Auto
Keyword Property WeaponTypeStaff Auto
Keyword Property WeaponTypeSword Auto
Keyword Property WeaponTypeWarAxe Auto
Keyword Property WeaponTypeWarhammer Auto
Keyword Property ArmorShield Auto

;///Where to place the specific weapon types on the rack, so they look correct
ObjectReference Property GreatSwordMarker Auto Hidden
ObjectReference Property WarhammerMarker Auto Hidden
ObjectReference Property BattleaxeMarker Auto Hidden
ObjectReference Property BowMarker Auto Hidden
ObjectReference Property SwordMarker Auto Hidden
ObjectReference Property MaceMarker Auto Hidden
ObjectReference Property WaraxeMarker Auto Hidden
ObjectReference Property StaffMarker Auto Hidden
ObjectReference Property ShieldMarker Auto Hidden	///;
ObjectReference Property TriggerMarker Auto Hidden
;///
;Handles the starting weapon stuff
Keyword Property WRackStartingWeapon Auto Hidden
ObjectReference Property StartingWeapon Auto Hidden

Int Property ItemType Auto Hidden
{The type of weapon the player is trying to place (1H Sword, 2H Sword, 1H Axe, etc...)}

Weapon Property PlayersEquippedWeapon Auto Hidden
{The players currently equipped weapon}

Armor Property PlayersEquippedShield Auto Hidden
{The players currently equipped shield}
///;
ObjectReference Property PlayersDroppedWeapon = None Auto Hidden
{holds the reference of any item placed on this rack, including starting item}

Int Property PlayersEquippedWeaponType Auto Hidden
{This is the type of weapon the player currently has equipped}

;-------------------------------------------
;*** USKP Properties ***

Actor Property PlayerRef Auto

Armor Property ArmorShieldOfYsgramor Auto
Armor Property DA13Spellbreaker Auto

Bool Property OnUpdateHandled = False Auto Hidden
{Prevent the ActivatorSetup function from running twice on cell loads.
Replaces AlreadyInit.
}

Bool Property PlacedItemInit = False Auto Hidden
{PlayersDroppedWeapon has been initialized and is reliable.
Replaces AlreadyInit.
}

FormList Property USKPForswornStavesList Auto

Keyword Property ArmorMaterialDaedric Auto
Keyword Property ArmorMaterialDragonPlate Auto
Keyword Property ArmorMaterialDwarven Auto

Message Property USKWrongStaffMessage Auto
{displays when player tries to put oversized staff in a display case}

ReferenceAlias Property USKPWRPlayerRefAlias Auto
{monitors item events on the player}

Weapon Property DA14SanguineRose Auto
Weapon Property DA15Wabbajack Auto
Weapon Property DA16SkullOfCorruption Auto
Weapon Property MG07StaffOfMagnus Auto

;-------------------------------------------
;*** USKP Variables ***

;constants used to distinguish the rack types
Int UnknownRack = 0
Int StandardRack = 1
Int CoAShieldRack = 2
Int CoAWeaponRackRL = 3
Int DaggerCase = 4
Int LargeDisplayCase = 5

;/------------------------------------------
	Handle mis-configured activators (activators without a linked
	trigger or even without a rack) and out-of-place activator scripts
	(such as the ones that were found on some vanilla triggers) and
	set them in a state of complete inactivity.

	Side effects are constant, allowing parallel concurrent calls.

	Returns False for success.
/;
Bool Function CheckConfiguration(String CallingEvent)

	If WRackTrigger == None
		; script was deleted, properties missing
	;~	Trace(Self + CallingEvent + "() CHECK: WRackTrigger == None; set 'Inactive' state.")
		Return True
	EndIf

	TriggerMarker = GetLinkedRef(WRackTrigger)
	If TriggerMarker == PlayerRef
		; hand fixed, don't disable
	;~	Trace(Self + CallingEvent + "() CHECK: WRackTrigger == PlayerRef; set 'Inactive' state.")
		; no need to prevent persistence of player, allows concurrency
	;.	TriggerMarker = None
		Return True
	EndIf

	If TriggerMarker == None
		DisableNoWait()
		Trace(Self + CallingEvent + "() ERROR: missing WRackTrigger; set 'Inactive' state.")
		Return True
	EndIf

	Return False

EndFunction

;/------------------------------------------
	Cleanup starting state, without interfering with ActivatorSetup().
	This is present solely for backward compatibility.

	Originally the only vanilla method of setup, now it is the slower
	path for resuscitating racks after configuration is repaired.

	StartingWeapon logic moved to ActivatorSetup, which is called
	from the trigger on both OnCellAttach() and OnLoad()
/;
EVENT OnCellAttach()

	If CheckConfiguration("Activator:OnCellAttach")
		GotoState("Inactive")
	ElseIf TriggerMarker.IsDisabled()
		DisableNoWait()
		GotoState("EmptyRack")
	ElseIf !(TriggerMarker as WeaponRackTriggerSCRIPT).AlreadyInit
		; IsDisabled and get/set are interruptible,
		; but probably faster than calling TriggerSetup()
		; where the same test is done.
		(TriggerMarker as WeaponRackTriggerSCRIPT).TriggerSetup("Activator:OnCellAttach")
	EndIf

endEVENT

;/------------------------------------------
	Initialize the activator's properties, check for pre-placed
	items and renew their placement.

	It runs once on every cell attach or when the rack is enabled
	(usually after construction in a Hearthfires home).

	If there's a starting item linked to this rack and enabled, but
	a different item placed on the rack or the starting item is in a
	different cell, it must have been grabbed in the meantime.

	Also, note that the check has to be skipped when the starting
	item is disabled. Setting the variable prematurely will prevent
	it from being properly handled when it is enabled later in the
	game (usually by enabling a parent marker).

	Check whether the starting item is still in the same cell
	(though not in a container in this cell). GetParentCell() on the
	starting item often return the cell of the rack after the
	starting item has been physically removed from the game world
	(for example, sold to a merchant or left in another cell beyond
	cell reset).
/;
Function ActivatorSetup(String CallingEvent)

	Bool wasHandled = OnUpdateHandled
	OnUpdateHandled = True
	If wasHandled
	;~	Trace(Self + CallingEvent + "ActivatorSetup() was handled.")
		Return
	EndIf

	If CheckConfiguration("CallingEvent")
		GotoState("Inactive")
		Return
	EndIf
	;~	Trace(Self + CallingEvent + "ActivatorSetup() handling")

	USKPWRPlayerRefAlias = ((Game.GetFormFromFile(0x00010800, "Unofficial Skyrim Special Edition Patch.esp") As Quest).GetAlias(0) As ReferenceAlias)

	ObjectReference StartingItem = GetLinkedRef()
	If StartingItem && !StartingItem.IsDisabled()

		If PlayersDroppedWeapon && PlayersDroppedWeapon != StartingItem
		;~	Trace(Self + CallingEvent + "ActivatorSetup() " + PlayersDroppedWeapon + " not starting item.")
			ActivatorSetup3D(CallingEvent)
		ElseIf StartingItem.IsDeleted()
		;~	Trace(Self + CallingEvent + "ActivatorSetup() starting item was deleted.")
			; maybe previously placed, so prevent mismatch
			PlayersDroppedWeapon = None
		Else
			Cell parentCell = StartingItem.GetParentCell()
			If parentCell && parentCell == GetParentCell() && CheckFor3D(StartingItem)
				DisableNoWait()
				PlayersDroppedWeapon = StartingItem
				Message ErrorMessage = CheckRackType(StartingItem.GetBaseObject(), True)
				if ErrorMessage
					Trace(Self + CallingEvent + "ActivatorSetup() ERROR:" + ErrorMessage)
				endif
			EndIf
		EndIf

	ElseIf PlayersDroppedWeapon
		; May be starting item that was here before disable,
		; by player taking items and putting them back later.
		ActivatorSetup3D(CallingEvent)
	EndIf

	;/
	; Give everything a chance to settle before measuring
	/;
	Utility.Wait(1.0)
	int iTOC = TriggerMarker.GetTriggerObjectCount()

	If PlacedItemInit
		If PlayersDroppedWeapon
			DisableNoWait()
			TriggerMarker.GoToState("WaitingForReference")
		;~	Trace(Self + CallingEvent + "ActivatorSetup() disabled; PlacedItemInit = True; TOC = " + iTOC)
		Else
			EnableNoWait()
		;~	Trace(Self + CallingEvent + "ActivatorSetup() enabled; PlacedItemInit = True; TOC = " + iTOC)
		EndIf
	ElseIf iTOC > 0
		; legacy/unused blocked racks. any obstruction(s) must be removed to use rack.
		DisableNoWait()
		TriggerMarker.GoToState("WaitingForReference")
	;~	Trace(Self + CallingEvent + "ActivatorSetup() disabled; PlacedItemInit = False; TOC = " + iTOC)
	Else
		PlayersDroppedWeapon = None
		PlacedItemInit = True
		EnableNoWait()
	;~	Trace(Self + CallingEvent + "ActivatorSetup() enabled; PlacedItemInit = True; TOC = Zero")
	EndIf

	; for symmetry; likely redundant
	GotoState("EmptyRack")

	TriggerMarker = NONE

EndFunction

;/------------------------------------------
	Handle presence of player placed item.
/;
Function ActivatorSetup3D(String CallingEvent)

	If PlayersDroppedWeapon.IsDisabled()
		PlayersDroppedWeapon.EnableNoWait()
		Trace(Self + CallingEvent + "ActivatorSetup3D() ERROR: " + PlayersDroppedWeapon + ".IsDisabled()")
	EndIf

	Cell parentCell = PlayersDroppedWeapon.GetParentCell()
	If parentCell == None
		Trace(Self + CallingEvent + "ActivatorSetup3D() ERROR: " + PlayersDroppedWeapon + ".GetParentCell() == None")
		return
	EndIf

	If !parentCell.IsAttached()
		Trace(Self + CallingEvent + "ActivatorSetup3D() ERROR: " + PlayersDroppedWeapon + " parentCell=" + parentCell + " !IsAttached()")
		return
	EndIf

	If parentCell != GetParentCell()
		Trace(Self + CallingEvent + "ActivatorSetup3D() ERROR: " + PlayersDroppedWeapon + " parentCell=" + parentCell + " != GetParentCell")
		return
	EndIf

	If CheckFor3D(PlayersDroppedWeapon)
		; always re-adjust to match current game mesh defined nodes
		DisableNoWait()
		Message ErrorMessage = CheckRackType(PlayersDroppedWeapon.GetBaseObject(), True)
		if ErrorMessage
			Trace(Self + CallingEvent + "ActivatorSetup3D() ERROR:" + ErrorMessage)
		endif
	Else
		Trace(Self + CallingEvent + "ActivatorSetup3D() ERROR: " + PlayersDroppedWeapon + " 3D failed")
	EndIf

EndFunction

;/------------------------------------------
	Ensure that the activator will run its initialization again
	after the next cell attach.
/;
EVENT OnCellDetach()

	OnUpdateHandled = False

	ObjectReference StartingItem = GetLinkedRef()
	If StartingItem && !StartingItem.IsDisabled() && StartingItem == PlayersDroppedWeapon
		PlayersDroppedWeapon = None
		PlacedItemInit = False
	EndIf

endEVENT

;-------------------------------------------

EVENT OnReset()

	OnUpdateHandled = False
	PlacedItemInit = False

endEVENT

;/------------------------------------------
	This state must be present to catch extant USKP racks.

	Lone activators without linked triggers and activator scripts that are
	not attached to weapon rack activators (some were found to be attached
	by Bethesda to weapon rack triggers) are rendered permanently inactive,
	so they won't do any harm.
/;
STATE Inactive

	EVENT OnActivate(ObjectReference TriggerRef)
	endEVENT

	EVENT OnCellDetach()
	endEVENT

	EVENT OnReset()
	endEVENT

endSTATE

;/------------------------------------------
	This is a vanilla state and must be present to catch extant vanilla racks.
	However, the contents have been significantly revised.

	Despite the poorly chosen name, this merely means the rack can accept items.
	If enabled, it is empty. If disabled, it is filled.

	Great lengths have been undertaken to ensure that the correct state of
	the filling is reflected by the variables PlacedItemInit, and
	PlayersDroppedWeapon. These names are also poorly chosen, so take care
	to read the explanatory comments.
/;
Auto STATE EmptyRack

	EVENT OnActivate(ObjectReference TriggerRef)
		; consolidate duplicated vanilla tests here [USKP]

		If TriggerRef != PlayerRef
			; Only the player can activate this
			Return
		EndIf

		MessageAlreadyShown = WRackGlobal.GetValue()

		If !MessageAlreadyShown
			WeaponRackActivateMESSAGE.Show()
			WRackGlobal.SetValue(1)
			Return
		EndIf

		TriggerMarker = GetLinkedRef(WRackTrigger)

		; try the right hand
		;PlayersEquippedWeaponType = PlayerRef.GetEquippedItemType(1); right hand
		Message ErrorMessage = CheckRackType(PlayerRef.GetEquippedWeapon(False))

		If ErrorMessage
			; try the left hand instead. [Talenden]
			;PlayersEquippedWeaponType = PlayerRef.GetEquippedItemType(0); left hand
			If CheckRackType(PlayerRef.GetEquippedWeapon(True)) && CheckRackType(PlayerRef.GetEquippedShield())
				; also error, but show right hand message
				ErrorMessage.Show()
			EndIf
		EndIf

		TriggerMarker = NONE
	endEVENT

endSTATE

;/------------------------------------------
	Merged with vanilla HandleStartingWeapon()

	Checks whether the item type is allowed on this rack. Note that
	placing the item uses keywords instead of PlayersEquippedWeaponType.

	Returns None for success.
		If it is not allowed, an appropriate error Message is returned.

	Called by OnActivate() and/or ActivatorSetup()
/;
Message Function CheckRackType(Form akItem, bool bStarting = FALSE)
;~	Trace(Self + "CheckRackType() CALL " + akItem + " bStarting = " + bStarting)

		; [Block comment tab offsets match vanilla script]
		;---------------------------------------------------
		;START------------------COA Weapon Rack
		;-----------------------------------------
	If ((RackType == CoAWeaponRackRL) || (Patch14CoARacks == TRUE))
		; check first to finesse later redundant checks.

		If (akItem As Weapon) == None
			Return WeaponRackNoWeaponMESSAGE
		ElseIf akItem.HasKeyword(WeaponTypeDagger)
			Return WeaponRackNoDaggerMESSAGE
		ElseIf akItem.HasKeyword(WeaponTypeBow)
			Return Patch14WeaponRackNoBowMESSAGE
		ElseIf USKPForswornStavesList.HasForm(akItem) && TriggerMarker.HasNode("BogusPivot")
			Return USKWrongStaffMessage
		ElseIf bStarting
			PlaceItem(CoAWeaponRackRL)
		Else
			HandlePlayerItem(akItem, CoAWeaponRackRL)
		EndIf
		;-----------------------------------------
		;END------------------COA Weapon Rack
		;---------------------------------------------------



		;---------------------------------------------------
		;START------------------Standard Rack
		;-----------------------------------------
		; and ------------------LARGE DISPLAY CASE
		;-----------------------------------------
	elseIf (((RackType == StandardRack) || (RackType == LargeDisplayCase));/ && (Patch14CoARacks == FALSE)/;)

		If (akItem As Weapon) == None
			Return WeaponRackNoWeaponMESSAGE
		ElseIf USKPForswornStavesList.HasForm(akItem) && TriggerMarker.HasNode("BogusPivot")
			Return USKWrongStaffMessage
		ElseIf bStarting
			PlaceItem(StandardRack)
		Else
			HandlePlayerItem(akItem, StandardRack)
		EndIf
		;-----------------------------------------
		;END------------------Standard Rack
		;---------------------------------------------------



		;---------------------------------------------------
		;START------------------Wall Mount Shield Rack
		;-----------------------------------------
	elseIf ((RackType == CoAShieldRack);/ && (Patch14CoARacks == FALSE)/;)

		If (akItem As Armor) == None || !akItem.HasKeyword(ArmorShield)
			Return WeaponRackNoShieldMESSAGE
		ElseIf bStarting
			PlaceItem()
		Else
			HandlePlayerItem(akItem)
		EndIf
		;-----------------------------------------
		;END------------------Wall Mount Shield Rack
		;---------------------------------------------------



		;---------------------------------------------------
		;START------------------Table-Top Dagger Rack
		;-----------------------------------------
	elseIf ((RackType == DaggerCase);/ && (Patch14CoARacks == FALSE)/;)

		If (akItem As Weapon) == None || !akItem.HasKeyword(WeaponTypeDagger)
			Return WeaponRackOnlyDaggerMESSAGE
		ElseIf bStarting
			PlaceItem()
		Else
			HandlePlayerItem(akItem)
		EndIf
		;-----------------------------------------
		;END------------------Table-Top Dagger Rack
		;---------------------------------------------------

	else
		Trace(Self + "CheckRackType() ERROR: unknown rack type " + RackType)
	endif

	Return None

EndFunction

;/------------------------------------------
	HandlePlayerItem() was 1st part of vanilla HandleWeaponPlacement()

	Grabs the specified item from the player and places it in the correct
	place. It will reject oversized staves from display cases.

	Called by CheckRackType()

	Calls PlaceItem() to run the actual placement procedure.
/;
Function HandlePlayerItem(Form PlayerItem, Int layout = 0)
;~	Trace(Self + "HandlePlayerItem() CALL " + PlayerItem + " layout = " + layout)

	USKPWRPlayerAliasScript PlayerAliasScript = USKPWRPlayerRefAlias As USKPWRPlayerAliasScript
	If PlayerAliasScript == None
		Trace(Self + "HandlePlayerItem() ERROR: missing USKPWRPlayerAliasScript")
		Return
	EndIf

	ObjectReference PlayerItemRef = PlayerAliasScript.DropPlayerItem(PlayerItem)
	If PlayerItemRef == None
		Trace(Self + "HandlePlayerItem() ERROR: DropPlayerItem() failed!")
		Return
	EndIf
;~	Trace(Self + "HandlePlayerItem() dropped " + PlayerItemRef)

	If PlayerItemRef.HasKeyword(WeaponTypeStaff) && TriggerMarker.HasNode("WRDisplayCase01") && (PlayerItemRef.HasNode("Staff3rdPerson:0") || PlayerItemRef.HasNode("3rdPersonStaff04:1"))
		USKWrongStaffMessage.Show()
		Trace(Self + "HandlePlayerItem() ERROR:" + PlayerItemRef + " doesn't fit on rack " + TriggerMarker)

		PlayerRef.AddItem(PlayerItemRef, 1, True)
		; do not equip item, in case carrying multiple items of same form!
		Return
	EndIf

	; Ensure the item is loaded before setting its motion type, to
	; prevent an "Object has no 3D" error.
	If !CheckFor3D(PlayerItemRef)
		Trace(Self + "HandlePlayerItem() ERROR:" + PlayerItemRef + " 3D failed for " + TriggerMarker)

		PlayerRef.AddItem(PlayerItemRef, 1, True)
		; do not equip item
		Return
	EndIf

	; At this point, the WeaponRackTriggerSCRIPT isDisabled tests will
	; prevent further access to PlayersDroppedWeapon, so it's OK to
	; use here to match vanilla script:
	DisableNoWait()
	PlayersDroppedWeapon = PlayerItemRef

	if PlaceItem(layout)
		PlayerRef.AddItem(PlayerItemRef, 1, True)
		; do not equip item
		EnableNoWait()
	endif

EndFunction

;/------------------------------------------
	PlaceItem() was 2nd part of vanilla HandleWeaponPlacement()
	Moves the specified item into the correct place relative to the rack.

	Returns False for success.

	Called by HandlePlayerItem() and/or CheckRackType()
/;
Bool Function PlaceItem(Int layout = 0)
;~	Trace(Self + "PlaceItem() CALL " + PlayersDroppedWeapon + " layout = " + layout)

	PlayersDroppedWeapon.SetMotionType(Motion_Keyframed, false)
	; Tell the weapon to ignore all forms of physic interaction
	; (this won't stop OnTriggerLeave events from firing though)

	; Handle the placement of the weapon
	if !CheckFor3D(TriggerMarker)
		Trace(Self + "PlaceItem() ERROR:" + PlayersDroppedWeapon + "; Base = " + PlayersDroppedWeapon.GetBaseObject() + "; has no 3D for " + TriggerMarker)
		PlayersDroppedWeapon = None
		PlacedItemInit = False
		Return True

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeSword)
		; 1H Sword
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "SwordPivot01")

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeWarAxe)
		; 1H Axe
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "WarAxePivot01")

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeMace)
		; Mace
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "MacePivot01")

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeGreatSword)
		; 2H Sword
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "GreatSwordPivot01")

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeBattleAxe)
		; 2H Axe
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "BattleAxePivot01")

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeWarhammer)
		; Warhammer
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "WarhammerPivot01")

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeBow)
		; Bow
		PlaceBow()

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeStaff)
		; Staff
		If layout == StandardRack
			PlaceStaff()
		ElseIf layout == CoAWeaponRackRL
			PlaceStaffCoA()
		Else
			PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivot01")
		EndIf

	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeDagger)
		; Dagger
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "DaggerPivot01")

	elseif PlayersDroppedWeapon.HasKeyword(ArmorShield)
		; Shield
		PlaceShield()

	else
		Trace(Self + "PlaceItem() ERROR:" + PlayersDroppedWeapon + "; Base = " + PlayersDroppedWeapon.GetBaseObject() + "; rejected for " + TriggerMarker)
		PlayersDroppedWeapon = None
		PlacedItemInit = False
		Return True
	endif

	;/
	Ensure that the trigger has received all OnTrigger* events
	related to the item placement procedure. Out of experience, they
	may fire with some delay, and the last event firing immediately
	before an item is placed is always an OnTriggerLeave event for
	that item, which, when handled, would be interpreted as the item
	having been grabbed again and the activator would be re-enabled
	although the rack is not empty.
	/;
	Utility.Wait(0.05)
	PlacedItemInit = True
	TriggerMarker.GoToState("WaitingForReference")

;~	Trace(Self + "PlaceItem() " + PlayersDroppedWeapon + "; Base = " + PlayersDroppedWeapon.GetBaseObject() + "; placed on " + TriggerMarker)
	Return False

EndFunction

;/------------------------------------------
	Select the matching node for a bow (or crossbow) to be placed,
	then move the bow to that node.

	Called by PlaceItem()
/;
Function PlaceBow()

	If PlayersDroppedWeapon.HasNode("CrossbowRoot") && TriggerMarker.HasNode("CrossbowPivot01")
		If PlayersDroppedWeapon.HasNode("DwarvenCrossbow.nif")
			PlayersDroppedWeapon.MoveToNode(TriggerMarker, "CrossbowPivot02")
		Else
			PlayersDroppedWeapon.MoveToNode(TriggerMarker, "CrossbowPivot01")
		EndIf
	Else
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "BowPivot01")
	EndIf

EndFunction

;/------------------------------------------
	Select the matching node for a shield to be placed, then move
	the shield to that node.

	Called by PlaceItem()
/;
Function PlaceShield()

	Armor ShieldBase = PlayersDroppedWeapon.GetBaseObject() As Armor

	If ShieldBase == ArmorShieldOfYsgramor
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "ShieldPivotYsgramor")
	ElseIf PlayersDroppedWeapon.HasKeyword(ArmorMaterialDwarven) && ShieldBase != DA13Spellbreaker
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "ShieldPivotDwarven")
	ElseIf PlayersDroppedWeapon.HasKeyword(ArmorMaterialDaedric)
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "ShieldPivotDaedric")
	ElseIf PlayersDroppedWeapon.HasKeyword(ArmorMaterialDragonPlate)
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "ShieldPivotDragonBone")
	Else
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "ShieldPivot01")
	EndIf

EndFunction

;/------------------------------------------
	Select the matching node for a staff to be placed, then move
	the staff to that node on a tripartite Coat of Arms plaque.

	Called by PlaceItem()
/;
Function PlaceStaff()

	Weapon StaffBase = PlayersDroppedWeapon.GetBaseObject() As Weapon

	If StaffBase == DA16SkullOfCorruption
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivotCorruption")
	ElseIf StaffBase == DA14SanguineRose
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivotSanguine")
	ElseIf PlayersDroppedWeapon.HasNode("Staff3rdPerson:0") || StaffBase == DA15Wabbajack
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivotFalmer")
	ElseIf USKPForswornStavesList.HasForm(StaffBase)
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivotForsworn")
	ElseIf PlayersDroppedWeapon.HasNode("DragonPriestStaff3rd:0") || PlayersDroppedWeapon.HasNode("MQ_DragonPriestStaff3rd01:0")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivot03")
	ElseIf PlayersDroppedWeapon.HasNode("Staff01:0") || PlayersDroppedWeapon.HasNode("Staff03:1") || StaffBase == MG07StaffOfMagnus
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivot01")
	Else
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivot02")
	EndIf

EndFunction

;/------------------------------------------
	Select the matching node for a staff to be placed, then move
	the staff to that node.

	Called by PlaceItem()
/;
Function PlaceStaffCoA()

	If PlayersDroppedWeapon.HasNode("Staff3rdPerson:0")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivotFalmer")
	Else
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivot01")
	EndIf

EndFunction

;/-----------------------------------------
	Waits for a reference's 3D to load, with exponential backoff.

	Returns false when not loaded or when the reference is "None".
/;
Bool Function CheckFor3D(ObjectReference AnyItemRef)

	Float delay = 0.016667; one frame

	While AnyItemRef && !AnyItemRef.Is3DLoaded()
		if delay < 8.5; 9 times
			Utility.Wait(delay)
			delay += delay
		else
		;~	TraceStack(Self + "CheckFor3D() " + AnyItemRef + " 3D failed, delay = " + ((delay - 0.016667) as float))
			Return False
		endif
	EndWhile

	If AnyItemRef
	;~	Trace(Self + "CheckFor3D() " + AnyItemRef + " 3D loaded, delay = " + ((delay - 0.016667) as float))
		Return True
	EndIf

;~	Trace(Self + "CheckFor3D() " + AnyItemRef + " == None, delay = " + ((delay - 0.016667) as float))
	Return False

EndFunction

;/------------------------------------------
	Valid OnTriggerLeave events are attributed to items that have
	been grabbed from the rack. To ensure that the event is not the
	result of a "cross-activation" due to oversized weapons placed
	on or grabbed from adjacent racks, check whether the item that
	triggered the event is the item that was mounted on this rack.

	In some instances, such as a transition from vanilla scripts,
	the removal of an adjacent item will free up the space on this
	rack as well.

	WARNING: can't call methods on triggerRef. If it was scripted,
	the pointer is probably broken --taleden
/;
Bool Function RackWasTriggered(ObjectReference triggerRef, Int iTOC)
;/~~~
	If PlayersDroppedWeapon
		Trace(Self + "RackWasTriggered() Mounted Item = " + PlayersDroppedWeapon + "; Base = " + PlayersDroppedWeapon.GetBaseObject())
	EndIf

	; debugging comparison only, currently unused
	ObjectReference startingItem = GetLinkedRef()
	If startingItem
		Trace(Self + "RackWasTriggered() Starting Item = " + startingItem + "; Base = " + startingItem.GetBaseObject())
	EndIf
;/~~~/;
	If (triggerRef && triggerRef == PlayersDroppedWeapon) || (iTOC == 0)
		PlayersDroppedWeapon = None
		PlacedItemInit = True
		EnableNoWait()

	;~	Trace(Self + "RackWasTriggered() enabled; TOC = " + iTOC)
		Return False
	EndIf

;~	Trace(Self + "RackWasTriggered() remains disabled; TOC = " + iTOC)
	Return True

EndFunction
