Scriptname SprigganFXSCRIPT extends ActiveMagicEffect  
{Attaches and controlss spriggan FX}

import utility
import form

Actor selfRef
VisualEffect Property SprigganFXAttachEffect Auto
Spell Property crSprigganHeal01 Auto
Spell Property crSprigganCallCreatures Auto
Idle Property FFselfIdle  Auto  
int doOnce
;===============================================

;RegisterForSleep() ; Before we can use OnSleepStart we must register.
 

	EVENT OnEffectStart(Actor Target, Actor Caster)
		;Play your particles.
		selfRef = caster		

		;Added by USKP to prevent this effect from appearing on the player.
		If selfRef == Game.GetPlayer()
			Dispel()
			return
		EndIf

		;USKP 2.0 - Check for NONE and spit an error out to see if we can find it
		if( selfRef == None )
			Debug.TraceStack( "USKP error check: Spriggan called this as a NONE. Please report this error to the USKP team." )
			Return
		EndIf
		
		;USSEP 4.1.5 Bug #14445: added this line:
		RegisterForAnimationEvent (selfRef, "KillFX")
		RegisterForAnimationEvent (selfRef, "Revive")
		
		;test to see if spriggan is in ambush mode
		if (selfRef.GetSleepState() == 3)
; 			Debug.Trace("Spriggan is sleeping! 3")
			selfRef.PlaySubGraphAnimation( "KillFX" )
		else
			;USKP 2.0.3 - 3D check needed before shaders.
			if( selfRef.Is3DLoaded() )
				SprigganFXAttachEffect.Play(selfRef, -1)
			EndIf
		endIf
	ENDEVENT

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		SprigganFXAttachEffect.Stop(selfRef)
	endEvent
	
	Event OnGetUp(ObjectReference akFurniture)
		;Added by USKP to prevent this effect from appearing on the player.
		If selfRef == Game.GetPlayer()
			Dispel()
			return
		EndIf
		
		;USKP 2.0 - Check for NONE and spit an error out to see if we can find it
		if( selfRef == None )
			Debug.TraceStack( "USKP error check: Spriggan called this as a NONE. Please report this error to the USKP team." )
			Return
		EndIf
		
; 		Debug.Trace("We just got up from " )
		SprigganFXAttachEffect.Play(selfRef, -1)
		selfRef.PlaySubGraphAnimation( "Revive" )
	endEvent
	
	EVENT onDeath(actor myKiller)
		;(selfRef as actor).PlaySubGraphAnimation( "LeavesScared" )
		;wait(10.0)
		
		;USKP 2.0 - Check for NONE and spit an error out to see if we can find it
		if( selfRef == None )
			Debug.TraceStack( "USKP error check: Spriggan called this as a NONE. Please report this error to the USKP team." )
			Return
		EndIf
		selfRef.PlaySubGraphAnimation( "KillFX" )
		wait(10.0)
		SprigganFXAttachEffect.Stop(selfRef)	
	ENDEVENT
	
	EVENT onCombatStateChanged(Actor akTarget, int aeCombatState)
		if aeCombatState == 1
			selfRef.playIdle(FFselfIdle)
			utility.wait(3.0)
			
			;USKP 2.0.1 - If the 3D isn't loaded, don't cast.
			if( selfRef.Is3DLoaded() )
				crSprigganCallCreatures.cast(selfRef,selfRef)
			EndIf
		endif
	endEVENT
	
	Event OnEnterBleedout()
; 		Debug.Trace("dude im bleeeding out" )
		if doOnce == 0
			selfRef.PlaySubGraphAnimation( "KillFX" )
			wait(2.0)
			;USKP 2.0.1 - If the 3D isn't loaded, don't case.
			if( selfRef.Is3DLoaded() )
				crSprigganHeal01.Cast(selfRef)
			EndIf
			selfRef.setActorValue("variable07",1)
			selfRef.evaluatePackage()
			wait(1.0)		
			selfRef.PlaySubGraphAnimation( "Revive" )
			doOnce = 1
		endIf
	ENDEVENT

;-----------------------------------------------------------------
;	Added by USSEP 4.1.5 for Bug #14445:
;-----------------------------------------------------------------

Event OnAnimationEvent (ObjectReference akSource, string asEventName)
	;do nothing
EndEvent
