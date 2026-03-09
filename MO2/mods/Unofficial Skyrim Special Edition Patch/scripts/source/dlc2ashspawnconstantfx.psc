Scriptname DLC2AshSpawnConstantFX extends activeMagicEffect  


;===============================================

import utility
import form

;===============================================
VisualEffect Property DLC2AshSpawnFX Auto
EffectShader Property DLC2AshSpawnFXShader Auto

int AshHealth 
actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		
		;UDBP 2.0.2 - Don't allow this to attach to the player.
		if( selfRef != Game.GetPlayer() )
			Dispel()
			Return
		EndIf

		;UDBP 2.0.2 - 3D check.
		if( selfRef.Is3DLoaded() )
			DLC2AshSpawnFX.Play(selfRef, -1)
		EndIf
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		DLC2AshSpawnFX.Stop(selfRef)
	endEvent
	
	EVENT OnDeath(actor myKiller)
		AshHealth = selfRef.GetAV("Health") as int
		if AshHealth > 0

				DLC2AshSpawnFX.Stop(selfRef)
				DLC2AshSpawnFXShader.Play(selfRef)
				wait(1.5)
				
		elseIf AshHealth <= 0

			DLC2AshSpawnFX.Stop(selfRef)
			
			wait(3)
			
		endIf
	ENDEVENT
