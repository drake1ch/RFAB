Scriptname FXAtronachStormSCRIPT extends activeMagicEffect
{This script runs from the Storm Atronach's ability and controlls the fx arts.}
;===============================================

import utility
import form

;===============================================
VisualEffect Property AtronachStormCloak Auto
EffectShader Property AtronachStormShockFXS Auto
EffectShader Property AtronachUnsummonDeathFXS Auto
Armor Property FXAtronachStormArmor Auto
int atronachHealth 
actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		
		;USKP 2.0.1 - Stop this from attaching to the player.
		if( selfRef == Game.GetPlayer() )
			Return
		EndIf

		;USSEP 4.1.5 Bug #13993: added this line:
		USSEP_RegisterForAnimationEvents (selfRef)

		selfRef.PlaySubGraphAnimation( "AutoOneOff" )
		;USKP 2.0.3 - Sanity checks added in case properties are not assigned. Ash Guardians in Dragonborn for example.
		if( AtronachStormCloak )
			AtronachStormCloak.Play(selfRef, -1)
		EndIf
		AtronachStormShockFXS.Play(selfRef)
		if( FXAtronachStormArmor )
			selfRef.EquipItem(FXAtronachStormArmor)
		EndIf
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		;USKP 2.0.3 - Sanity checks added in case properties are not assigned. Ash Guardians in Dragonborn for example.
		if( AtronachStormCloak )
			AtronachStormCloak.Stop(selfRef)
		EndIf
		AtronachStormShockFXS.Stop(selfRef)
		if( FXAtronachStormArmor )
			selfRef.unEquipItem(FXAtronachStormArmor)
		EndIf
	endEvent
	
	EVENT onDying(actor myKiller)
		atronachHealth = selfRef.GetAV("Health") as int
		if atronachHealth > 0
; 				debug.trace("health  > 0")
				;USKP 2.0.3 - Sanity checks added in case properties are not assigned. Ash Guardians in Dragonborn for example.
				if( AtronachStormCloak )
					AtronachStormCloak.Stop(selfRef)
				EndIf
				AtronachStormShockFXS.Stop(selfRef)
				AtronachUnsummonDeathFXS.Play(selfRef)
				wait(1.5)
				;selfRef.disable()
		elseIf atronachHealth <= 0
; 			debug.trace("health  == 0")
			;USKP 2.0.3 - Sanity checks added in case properties are not assigned. Ash Guardians in Dragonborn for example.
			if( AtronachStormCloak )
				AtronachStormCloak.Stop(selfRef)
			EndIf
			selfRef.PlaySubGraphAnimation( "StopEffect" )
			wait(3)
			AtronachStormShockFXS.Stop(selfRef)
			if( FXAtronachStormArmor )
				selfRef.unEquipItem(FXAtronachStormArmor)
			EndIf
		endIf
	ENDEVENT

;-----------------------------------------------------------------
;	Added by USSEP 4.1.5 for Bug #13993:
;-----------------------------------------------------------------

Event OnAnimationEvent (ObjectReference akSource, string asEventName)
	;do nothing
EndEvent

function USSEP_RegisterForAnimationEvents (actor actorRef)
	if actorRef
		RegisterForAnimationEvent (actorRef, "AutoOneOff")
		RegisterForAnimationEvent (actorRef, "StopEffect")
	endif
endFunction	