scriptName DLC2dunKolbjornPillarPuzzleLever extends ObjectReference

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto

int property pillarCount auto
{Number of Puzzle Pillars}

objectReference property refActRegardless auto
{This ref is activated when puzzle is solved and lever is pulled}

objectReference property refActOnSuccess01 auto
{This ref is activated when puzzle is solved and lever is pulled}

objectReference property refActOnSuccess01b auto
{This ref is activated when puzzle is solved and lever is pulled}

objectReference property refDisableOnSuccess01b auto
{Disable this ref when the puzzle is solved and the lever is pulled}

objectReference property refActOnSuccess02 auto
{This ref is activated when puzzle is solved and lever is pulled}

objectReference property refDisableOnSuccess02 auto
{Disable this ref when the puzzle is solved and the lever is pulled}

objectReference property refActOnFailure01 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure02 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure03 auto
{This ref is activated when puzzle is not solved and lever is pulled}

objectReference property refActOnFailure04 auto
{This ref is activated when puzzle is not solved and lever is pulled}

bool hasDisabledEntryCollision = False

;*****************************************

Function doorOrDarts()
	if( refActRegardless != None )
		refActRegardless.Activate(Self)
	EndIf
	if (((Self.GetLinkedRef(LinkCustom01) as DLC2dunKolbjornPuzzlePillarScript).pillarState == 1) && \
		((Self.GetLinkedRef(LinkCustom02) as DLC2dunKolbjornPuzzlePillarScript).pillarState == 1))
		refActOnSuccess01.Activate(Self)
		if (!hasDisabledEntryCollision)
			hasDisabledEntryCollision = True
			refActOnSuccess01b.Activate(Self)
			refDisableOnSuccess01b.Disable()
		EndIf
	ElseIf (((Self.GetLinkedRef(LinkCustom01) as DLC2dunKolbjornPuzzlePillarScript).pillarState == 2) && \
			((Self.GetLinkedRef(LinkCustom02) as DLC2dunKolbjornPuzzlePillarScript).pillarState == 2))
		refActOnSuccess02.Activate(Self)
		refDisableOnSuccess02.Disable(False)
	Else
		;UDBP 2.0.1 - Sanity checks!!!!
		if( refActOnFailure01 )
			refActOnFailure01.activate(self as objectReference)
		EndIf
		if( refActOnFailure02 )
			refActOnFailure02.activate(self as objectReference)
		EndIf
		if( refActOnFailure03 )
			refActOnFailure03.activate(self as objectReference)
		EndIf
		if( refActOnFailure04 )
			refActOnFailure04.activate(self as objectReference)
		EndIf
	endif
endFunction

;*****************************************

Auto STATE Waiting
	EVENT onActivate (objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		gotoState("busy")
		if(actorRef==game.GetPlayer())
			;notification("just activated lever")
			doorOrDarts()
		else
			;wait(3)
			doorOrDarts()
		endif
		gotoState("Waiting")
	endEVENT
endState


;*****************************************

STATE busy
	; This is the state when I'm busy animating
		EVENT onActivate (objectReference triggerRef)
			;do nothing
		endEVENT
endState

;*****************************************