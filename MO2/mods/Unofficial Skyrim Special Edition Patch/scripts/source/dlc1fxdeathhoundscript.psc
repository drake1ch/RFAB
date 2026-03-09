Scriptname DLC1FXDeathHoundSCRIPT extends activeMagicEffect

;===============================================

import utility
import form

;===============================================
VisualEffect Property FXDeathHoundEffect Auto
EffectShader Property DeathHoundDeathFXShader Auto

int houndHealth 
actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		
		;UDGP 2.0.3 - Don't let this get on the player.
		if( selfRef == Game.GetPlayer() )
			Dispel()
			Return
		EndIf
		
		;UDGP 2.0.1 - Insert short delay here to allow time for 3D to load.
		Utility.Wait(1)
		FXDeathHoundEffect.Play(selfRef, -1)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXDeathHoundEffect.Stop(selfRef)
	endEvent
	
	EVENT OnDeath(actor myKiller)
		houndHealth = selfRef.GetAV("Health") as int
		if houndHealth > 0

				FXDeathHoundEffect.Stop(selfRef)
				DeathHoundDeathFXShader.Play(selfRef)
				wait(1.5)
				
		elseIf houndHealth <= 0

			FXDeathHoundEffect.Stop(selfRef)
			
			wait(3)
			
		endIf
	ENDEVENT
	
	