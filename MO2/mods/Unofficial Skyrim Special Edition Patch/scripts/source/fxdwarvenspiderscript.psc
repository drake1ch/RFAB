Scriptname FXDwarvenSpiderSCRIPT extends ActiveMagicEffect  
{Add the fx art to the dwarven centurion, sphere,and spider. There are tests for properties being filler since not all three have three addons.}

import utility
import form

;===============================================

Actor selfRef
Keyword Property DLC1LDAetherialSummon Auto
VisualEffect Property FXDwarvenSpiderEffect Auto
Explosion Property ExplosionDwarvenSpider Auto

	EVENT OnEffectStart(Actor Target, Actor Caster)
		selfRef = caster
		
		;Added by USKP to prevent this effect from appearing on the player.
		If selfRef == Game.GetPlayer()
			Dispel()
			return
		EndIf
		
		;USKP 2.0.3 - 3D check for shaders.
		if( selfRef.Is3DLoaded() )
			FXDwarvenSpiderEffect.Play(selfRef, -1)
		EndIf
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXDwarvenSpiderEffect.Stop(selfRef)
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		if (selfRef.GetLevel() > 7 && !selfRef.IsCommandedActor() && !selfRef.HasKeyword(DLC1LDAetherialSummon))
			selfRef.PlaySubGraphAnimation( "StopEffect" )
			FXDwarvenSpiderEffect.Stop(selfRef)
			selfRef.placeAtMe(ExplosionDwarvenSpider)
		EndIf
	ENDEVENT
	