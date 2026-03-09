Scriptname DefaultDisableExitEnableEnter extends ObjectReference  
{
Disables LinkedRef(s) on player exit, and re-enables them on enter.
Works with regular linked ref + LinkCustom01-04 keyworded links.
}

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto

bool Property shouldFade = TRUE Auto
{Whether the links should fade or not when enabled/disabled.  Defaults to TRUE.}

EVENT onTriggerEnter(objectReference triggerRef)
	if triggerRef == Game.GetPlayer() as actor
		ObjectReference MyLink = GetLinkedRef()
		ObjectReference MyLink01 = GetLinkedRef(LinkCustom01)
		ObjectReference MyLink02 = GetLinkedRef(LinkCustom02)
		ObjectReference MyLink03 = GetLinkedRef(LinkCustom03)
		ObjectReference MyLink04 = GetLinkedRef(LinkCustom04)

		if( MyLink != None )
			MyLink.Enable(shouldFade)
		EndIf
		
		if( MyLink01 != None )
			MyLink01.Enable(shouldFade)
		EndIf
		
		if( MyLink02 != None )
			MyLink02.Enable(shouldFade)
		EndIf
		
		if( MyLink03 != None )
			MyLink03.Enable(shouldFade)
		EndIf
		
		if( MyLink04 != None )
			MyLink04.Enable(shouldFade)
		EndIf
	endif
endEVENT

EVENT onTriggerLeave(objectReference triggerRef)
	if triggerRef == Game.GetPlayer() as actor
		ObjectReference MyLink = GetLinkedRef()
		ObjectReference MyLink01 = GetLinkedRef(LinkCustom01)
		ObjectReference MyLink02 = GetLinkedRef(LinkCustom02)
		ObjectReference MyLink03 = GetLinkedRef(LinkCustom03)
		ObjectReference MyLink04 = GetLinkedRef(LinkCustom04)

		if( MyLink != None )
			MyLink.Disable(shouldFade)
		EndIf
		
		if( MyLink01 != None )
			MyLink01.Disable(shouldFade)
		EndIf
		
		if( MyLink02 != None )
			MyLink02.Disable(shouldFade)
		EndIf
		
		if( MyLink03 != None )
			MyLink03.Disable(shouldFade)
		EndIf
		
		if( MyLink04 != None )
			MyLink04.Disable(shouldFade)
		EndIf
	endif
endEVENT
