scriptName DLC2OmenOfDangerScript extends objectReference
;
;
;===========================================

effectShader Property DLC2OmenOfDangerFXS auto
GlobalVariable property DLC2OmenOfDanger auto

event onCellAttach()
; 	;debug.Trace(self + " is loading 3d")
; 	;debug.Trace(self + " has found that HasTrapSight == " + hasTrapSight.value)
	;/
	USSEP 4.1.5 for Bug #14337: Moved this code to an OnLoad event
	
	registerForAnimationEvent((game.GetPlayer() as objectReference), "OmenOfDanger")

	if DLC2OmenOfDanger.GetValue() == 1
; 		;debug.Trace(self + " trapsight is set")
		game.GetPlayer().PlaySubGraphAnimation("OmenOfDanger")
		;debug.sendAnimationEvent(game.getPlayer(), "OmenOfDanger")
	endif
	/;
endEvent

event OnAnimationEvent(ObjectReference akSource, string asEventName)
; 	debug.Trace(self + "has recieved AnimationEvent >> " + asEventName)
	if akSource == game.GetPlayer() && asEventName == "OmenOfDanger"
		if DLC2OmenOfDanger.getValue() == 1
			DLC2OmenOfDangerFXS.play(self as objectReference, -1.0)
		else
			DLC2OmenOfDangerFXS.stop(self as objectReference)
		endif
	endif
endEvent

event onCellDetach()
	;/
	USSEP 4.1.5 for Bug #14337: Moved this code to an OnUnload event
	
	DLC2OmenOfDangerFXS.stop(self as objectReference)
	unregisterForAnimationEvent((game.GetPlayer() as objectReference), "OmenOfDanger")
	/;
endEvent

;-----------------------------------------------------------------
;	Added by USSEP 4.1.5 for Bug #14337:
;-----------------------------------------------------------------

Event OnLoad()
	RegisterForAnimationEvent ((game.GetPlayer() as objectReference), "OmenOfDanger")
	if DLC2OmenOfDanger.GetValue() == 1
		Game.GetPlayer().PlaySubGraphAnimation ("OmenOfDanger")
	endif
EndEvent

Event OnUnload()
	DLC2OmenOfDangerFXS.stop (self as objectReference)
	UnregisterForAnimationEvent ((game.GetPlayer() as objectReference), "OmenOfDanger")
EndEvent
