Scriptname DLC2dunBookLevel4BendControl extends ObjectReference
{toggle middle, left, right}

import Utility
import Debug

bool Bending = false

;******************************************************

Function bend(int myBend)
	;0 = continue bending
	;1 = bend right
	;2 = bend left
	;3 = reset to middle
	if(myBend == 0)
		playAnimationAndWait("Left", "done")
		Bending = true
		goToState("ContinueBending")
	elseif(myBend == 1)
		playAnimationAndWait("Right", "done")
	elseif(myBend == 2)
		playAnimationAndWait("Left", "done")
	elseif(myBend == 3)
		playAnimationAndWait("Reset", "done")
	endif

endFunction

;UDBP 1.0.4 - Rewritten to avoid endless loops building up Papyrus stacks when the object is not loaded.
;BendingLoop() function added to fascilitate the new sanity check.
Function BendingLoop()
	while(Bending)
		if( !Is3DLoaded() )
			Bending = False
		EndIf
		playAnimationAndWait("Left", "doneLeft")
		;playAnimationAndWait("Return", "done")
		playAnimationAndWait("Right", "doneRight")
	endWhile
EndFunction

;******************************************************

State ContinueBending
	Event OnLoad()
		Bending = True
		BendingLoop()
	EndEvent
	
	Event OnBeginState()
		BendingLoop()
	endEvent
endState


;******************************************************
