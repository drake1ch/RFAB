Scriptname FXWitchlightAttachSCRIPT extends ActiveMagicEffect conditional
{Attaches and manages witchlights's fx}
;======================================================================================;
;	IMPORTS     /
;=============/
import utility
import form
import game
;======================================================================================;
;	PROPERTIES  /
;=============/
VisualEffect Property WitchlightFXAttachEffect Auto
objectReference property myWisp auto conditional hidden
actorBase property wispBase auto

;======================================================================================;
;	VARIABLES   /
;=============/
ObjectReference selfRef

;======================================================================================;
;	EVENTS	    /
;=============/

	EVENT OnEffectStart(Actor Target, Actor Caster)
	
		selfRef = caster		
		
		;USKP 2.0.1 - Stop this from attaching to the player.
		if( selfRef == Game.GetPlayer() )
			Return
		EndIf
		
		int i		 	;counter var
		int cap = 50	;recursion limiter for 3dLoaded check
		while selfRef.is3dLoaded() == FALSE && i < cap
			; wait for onLoad() to complete
			if i >= cap
; 				debug.trace("Recursion of limit ("+i+") hit by: "+self)
				; return
			else
				i+=1
; 				;debug.trace("While() recursion ("+i+")")
			endif
		endWhile
		; only attack FX once the3D is loaded
		;USKP 2.0.2 - So despite ALL THAT above, we still need to check this. Stupid.
		if( selfRef.Is3DLoaded() )
			WitchlightFXAttachEffect.Play(selfRef, -1)
		EndIf
	ENDEVENT
	
	
	EVENT OnEffectFinish(Actor Target, Actor Caster)
	
		WitchlightFXAttachEffect.Stop(selfRef)

	ENDEVENT
	
	