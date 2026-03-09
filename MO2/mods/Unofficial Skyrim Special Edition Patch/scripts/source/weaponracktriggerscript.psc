Scriptname WeaponRackTriggerSCRIPT extends ObjectReference Hidden

;Modifications by Sclerocephalus - debug version 3.4 (10/21/2013)
;modified by taleden - rev 4 (2013-11-01)
;Modifications by DayDreamer - version 5.0 (2014 Mar 15)

import game
import debug
import utility

;-------------------------------------------

Keyword Property WRackActivator Auto

;The activator we must disable if there is already something in this trigger
ObjectReference Property ActivatorRef Auto Hidden
;///
;Reference that is currently in the trigger
ObjectReference Property RefCurrentlyInTrig Auto Hidden

;1 = if something is in this trigger, 0 = empty
Bool Property HasBeenTriggered Auto Hidden

Int Property numInTrig Auto Hidden
///;
Bool Property AlreadyInit Auto Hidden

Bool Property IgnoreArmor = FALSE Auto

;-------------------------------------------
;*** USKP Properties ***

Keyword Property ArmorShield Auto

;-------------------------------------------
;*** USKP Variables ***

WeaponRackActivateScript ActivatorScript = None

;/------------------------------------------
	Handle mis-configured triggers.

	Returns False for success.
/;
Bool Function CheckConfiguration(String CallingEvent)

	GoToState("ActivatorBusy")

	If WRackActivator == None
		; script was deleted, properties missing
	;~	Trace(Self + CallingEvent + "() CHECK: WRackActivator == None; 'ActivatorBusy' state.")
		Return True
	EndIf

	ActivatorRef = GetLinkedRef(WRackActivator)
	If ActivatorRef == Self
		; hand fixed, don't disable
	;~	Trace(Self + CallingEvent + "() CHECK: WRackActivator == Self; 'ActivatorBusy' state.")
		ActivatorRef = None
		Return True
	EndIf

	If ActivatorRef == None
		Trace(Self + CallingEvent + "() ERROR: missing WRackActivator; 'ActivatorBusy' state.")
		Return True
	EndIf

	ActivatorScript = ActivatorRef As WeaponRackActivateScript
	If ActivatorScript == None
		Trace(Self + CallingEvent + "() ERROR: missing WeaponRackActivateScript; 'ActivatorBusy' state.")
		ActivatorRef = None
		Return True
	EndIf

	If isDisabled()
		GoToState("TriggerDisabled")
		ActivatorRef.DisableNoWait()
	;~	Trace(Self + CallingEvent + "() CHECK: is disabled; set 'TriggerDisabled' state; " + ActivatorRef + " disabled too.")
		ActivatorRef = NONE
		ActivatorScript = NONE
		Return True
	EndIf

	Return False

EndFunction

;-------------------------------------------

EVENT OnCellDetach(); replace OnReset()

	AlreadyInit = FALSE

endEVENT

;/------------------------------------------
	This event must be present to catch extant USKP 2.0.0 racks,
	or otherwise without known state.

	This is present solely for backward compatibility.
/;
EVENT OnCellAttach(); replace OnCellLoad()

	TriggerSetup("Trigger:OnCellAttach")

endEVENT

;/------------------------------------------
	This state must be present to catch extant USKP 1.3.3 racks.

	(1) The activator is known to be missing, but can be resuscitated.

	(2) The activator status is currently being tested. Suppress redundant
	OnLoad() and trigger events.

	(3) The activator is either enabled (and the rack empty, so the trigger
	won't be needed anyway) or running a placement procedure. OnTriggerLeave()
	events during placement are from adjacent racks ("cross-activation") or
	from a temporary loss of the item's 3D during a MoveToNode command.
	Skip them to prevent the items from being mis-interpreted as having been
	grabbed from the rack.
/;
STATE ActivatorBusy

	EVENT OnCellAttach()
	endEVENT

	EVENT OnLoad()
	endEVENT

	EVENT OnTriggerLeave(ObjectReference ItemRef)
	;~	Trace(Self + "ActivatorBusy:OnTriggerLeave() " + ItemRef + "; Base = " + ItemRef.GetBaseObject())
	endEVENT

endSTATE

;/------------------------------------------
	This state must be present to catch extant USKP 2.0.1 racks.

	The activator has been detected by OnCellAttach(), this trigger is
	currently disabled. Allows OnLoad() to setup.
/;
STATE TriggerDisabled

	EVENT OnCellAttach()
	endEVENT

;/	Catch newly enabled racks with player present.

	Starting items must be done upon constructing the rack at a
	workbench in a player home. OnCellAttach() does not fire.
/;
	EVENT OnLoad()

		If Self == None
			Trace(Self + "OnLoad() ERROR!")
			return
		EndIf

		Cell parentCell = GetParentCell()
		If parentCell == None
			Trace(Self + "OnLoad() ERROR: GetParentCell == None")
			return
		EndIf

		If !parentCell.IsAttached()
			Trace(Self + "OnLoad() ERROR: parentCell=" + parentCell + " !IsAttached()")
			return
		EndIf

		TriggerSetup("TriggerDisabled:OnLoad")

	endEVENT

	EVENT OnTriggerLeave(ObjectReference ItemRef)
	;~	Trace(Self + "TriggerDisabled:OnTriggerLeave() " + ItemRef + "; Base = " + ItemRef.GetBaseObject())
	endEVENT

endSTATE

;/------------------------------------------
	This is a vanilla state and must be present to catch extant vanilla racks.
	However, the contents have been significantly revised.
/;
auto STATE WaitingForReference

;/	Catch newly enabled racks without player present.

	Previously placed items must be renewed on every cell attach,
	re-adjusting to current game mesh defined nodes.
/;
	EVENT OnCellAttach()

		TriggerSetup("WFR:OnCellAttach")

	endEVENT

	EVENT OnLoad()
	endEVENT

;/	It would be nice if we could filter out spurious events fired by bouncing
	clutter etc, but we can't call any native methods on triggerRef such as
	GetBaseObject() -- if the retrieved item was scripted, then by the time
	this runs it may already be in the player's inventory and our pointer
	will be broken. So we'll have to make do with just comparing the pointer
	itself to our other stored pointers. --taleden
/;
	EVENT OnTriggerLeave(objectReference triggerRef)

		If CheckConfiguration("WFR:OnTriggerLeave")
			return
		EndIf
		; state ActivatorBusy

		If !ActivatorRef.IsDisabled()
		;~	Trace(Self + "OnTriggerLeave() CHECK: activator was enabled; 'ActivatorBusy' state.")
			ActivatorRef = NONE
			ActivatorScript = NONE
			return
		EndIf

		If ActivatorScript.RackWasTriggered(triggerRef, GetTriggerObjectCount())
			GoToState("WaitingForReference")
		;~	Trace(Self + "OnTriggerLeave() retain 'WaitingForReference' state.")
		EndIf

		ActivatorRef = NONE
		ActivatorScript = NONE

	endEVENT
endSTATE

;/------------------------------------------
	TriggerSetup() CheckConfiguration() immediately changes state,
	suppressing OnLoad() and trigger events.

	Called from OnLoad() and OnCellAttach() both here and there.
/;
Function TriggerSetup(String CallingEvent)

	Bool wasHandled = AlreadyInit
	AlreadyInit = True
	If wasHandled
	;~	Trace(Self + CallingEvent + "() TriggerSetup() was handled.")
		Return
	EndIf

	If CheckConfiguration(CallingEvent)
		Return
	EndIf
	; state ActivatorBusy

;~	Trace(Self + CallingEvent + "() " + ActivatorRef + " update setup.")
	ActivatorScript.ActivatorSetup(CallingEvent)

	ActivatorRef = NONE
	ActivatorScript = NONE

EndFunction
