scriptName dweSpiderCenturionPipeScript extends ObjectReference

import debug
import utility

;****************************************

auto State Listening

	Event onActivate(objectReference triggerRef)
		Actor myActor = triggerRef as Actor
		;USKP 2.0.1 - Added check to make sure the actor exists.
		if (myActor && myActor.getState() != "Waiting")
			gotoState("done")
			playAnimation("exit")
		endif
	endEvent

endState

;****************************************

State done
	;do nothing
endState

;****************************************