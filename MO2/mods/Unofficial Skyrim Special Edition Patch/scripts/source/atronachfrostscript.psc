Scriptname AtronachFrostScript extends ActiveMagicEffect  
;===============================================

;===============================================
;VisualEffect Property AtronachFrostEffect01 Auto
EffectShader Property AtronachFrostFXS Auto
EffectShader Property AtronachUnsummonDeathFXS Auto
Explosion Property deathExplosion Auto
Actor selfRef
int atronachHealth 

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		
		;USKP 2.0.5 - Stop this from attaching to the player.
		if( selfRef == Game.GetPlayer() )
			Return
		EndIf

		;USKP 2.0.3 - 3D check needed
		if( selfRef.Is3DLoaded() )
			AtronachFrostFXS.Play(selfRef)
		EndIf
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		AtronachFrostFXS.Stop(selfRef)
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		atronachHealth = selfRef.GetAV("Health") as int
		if atronachHealth > 0
; 			debug.trace("frost health  > 0")
			AtronachFrostFXS.Stop(selfRef)
			AtronachUnsummonDeathFXS.Play(selfRef)
		elseIf atronachHealth <= 0
; 			debug.trace("frost health  <= 0")
			selfRef.placeAtMe(deathExplosion)
			AtronachFrostFXS.Stop(selfRef)
		endIf
	ENDEVENT
