Scriptname DLC2HMDaedraEffectScript extends activemagiceffect  


import utility
import form

;===============================================

Actor selfRef
EffectShader Property DLC2HMDaedraFXS Auto
EffectShader Property DLC2HMDaedraDeathFXS Auto
EffectShader Property DLC2HMDaedraUnsummonDeathFXS Auto
explosion property DLC2HMDaedraDeathExplosion auto
int daedraHealth 

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster

		;UDBP 2.0.2 - Prevent this from appearing on the player.
		If selfRef == Game.GetPlayer()
			Dispel()
			return
		EndIf

		;UDBP 2.0.2 - Need 3D check
		if( selfRef.Is3DLoaded() )
			DLC2HMDaedraFXS.Play(selfRef, -1)
		EndIf
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		DLC2HMDaedraFXS.Stop(selfRef)
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		daedraHealth = selfRef.GetAV("Health") as int
		if daedraHealth > 0
; 			debug.trace("flame health  > 0")
			DLC2HMDaedraFXS.Stop(selfRef)
			;DLC2HMDaedraUnsummonDeathFXS.Play(selfRef) - UDPB 2.0.2 - This effect doesn't exist, so obviously can't use it.
		elseIf daedraHealth <= 0
			DLC2HMDaedraDeathFXS.Play(selfRef)
			;wait(1.0)
			selfRef.placeAtMe(DLC2HMDaedraDeathExplosion)
			DLC2HMDaedraFXS.Stop(selfRef)
			DLC2HMDaedraDeathFXS.Stop(selfRef)
		endif
	ENDEVENT
	