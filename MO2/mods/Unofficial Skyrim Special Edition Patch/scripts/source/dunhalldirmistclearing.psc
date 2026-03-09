scriptName dunHalldirMistClearing extends ObjectReference
{Each mist object, when activated, fades out.}

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto
Keyword property LinkCustom04 Auto
Keyword property LinkCustom05 Auto

;All sanity checking for None values added by USKP 1.3.3

Event OnActivate(ObjectReference obj)
	Self.GetLinkedRef().DisableNoWait(True)
	if( Self.GetLinkedRef(LinkCustom01) != None )
		Self.GetLinkedRef(LinkCustom01).DisableNoWait(True)
	EndIf
	if( Self.GetLinkedRef(LinkCustom02) != None )
		Self.GetLinkedRef(LinkCustom02).DisableNoWait(True)
	EndIf
	if( Self.GetLinkedRef(LinkCustom03) != None )
		Self.GetLinkedRef(LinkCustom03).DisableNoWait(True)
	EndIf
	if( Self.GetLinkedRef(LinkCustom04) != None )
		Self.GetLinkedRef(LinkCustom04).DisableNoWait(True)
	EndIf
	if( Self.GetLinkedRef(LinkCustom05) != None )
		Self.GetLinkedRef(LinkCustom05).DisableNoWait(True)
	EndIf
EndEvent

Event OnReset()
	Self.GetLinkedRef().Enable()
	if( Self.GetLinkedRef(LinkCustom01) != None )
		Self.GetLinkedRef(LinkCustom01).Enable()
	endif
	if( Self.GetLinkedRef(LinkCustom02) != None )
		Self.GetLinkedRef(LinkCustom02).Enable()
	endif
	if( Self.GetLinkedRef(LinkCustom03) != None )
		Self.GetLinkedRef(LinkCustom03).Enable()
	endif
	if( Self.GetLinkedRef(LinkCustom04) != None )
		Self.GetLinkedRef(LinkCustom04).Enable()
	endif
	if( Self.GetLinkedRef(LinkCustom05) != None )
		Self.GetLinkedRef(LinkCustom05).Enable()
	endif
EndEvent
