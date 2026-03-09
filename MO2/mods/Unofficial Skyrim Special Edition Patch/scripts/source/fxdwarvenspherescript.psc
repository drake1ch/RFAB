Scriptname FXDwarvenSphereScript extends ActiveMagicEffect  
{Attached dwarven sphere fx}

import utility
import form

;===============================================
actor selfRef
VisualEffect Property FXDwarvenSphereEffect Auto

	EVENT OnEffectStart(Actor Target, Actor Caster)
		selfRef = caster
		
		;Added by USKP to prevent this effect from appearing on the player.
		If selfRef == Game.GetPlayer()
			Dispel()
			return
		EndIf
		
		if( selfRef.Is3DLoaded() ) ; 3D check added by USKP 2.0 - triggers errors without it.
			FXDwarvenSphereEffect.Play(selfRef, -1)
		EndIf
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXDwarvenSphereEffect.Stop(selfRef)
	ENDEVENT
	
	EVENT onDeath(actor myKiller)
		selfRef.PlaySubGraphAnimation( "StopEffect" )
		wait(4.0)
		FXDwarvenSphereEffect.Stop(selfRef)
	ENDEVENT
	
	