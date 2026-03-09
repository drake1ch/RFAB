Scriptname DraugrFXScript extends  ActiveMagicEffect  
{Attaches and manages fx}



import utility
import form

;===============================================

Actor selfRef
ActorBase myActorBase
int draugrSex
VisualEffect Property DraugrMaleEyeGlowFX Auto
VisualEffect Property DraugrFemaleEyeGlowFX Auto

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		
		;Added by USKP to prevent this effect from appearing on the player.
		If selfRef == Game.GetPlayer()
			Dispel()
			return
		EndIf
		
		;USKP 2.0.3 - Don't bother with any of this if the dumb zombie isn't loaded!
		if( selfRef.Is3DLoaded() )
			myActorBase = caster.GetLeveledActorBase()		
			;If sex is male (only one currently working) play glow eye art
			if myActorBase.GetSex() == 0
				if (selfRef.GetSleepState() == 3)
	; 				Debug.Trace("Draugr man is sleeping! 3")
				else
					;Play glow art
					DraugrMaleEyeGlowFX.Play(selfRef, -1)
				endif
			endif
			;if sex is female (currently not returned) play debug text to say this is now working
			if myActorBase.GetSex() == 1
				if (selfRef.GetSleepState() == 3)
	; 				Debug.Trace("Draugr fem is sleeping! 3")
				else
					DraugrFemaleEyeGlowFX.Play(selfRef, -1)
				endIf
			endif
		EndIf
	ENDEVENT
	
	Event OnGetUp(ObjectReference akFurniture)
; 		Debug.Trace("Draugr just got up from " )
		;Added by USKP to prevent this effect from appearing on the player.
		if( selfRef == Game.GetPlayer() )
			Dispel()
			Return
		EndIf
		
		; USKP 2.0.1 - Sanity check because the actorbase property isn't always valid when this runs.
		if( myActorBase )
			if myActorBase.GetSex() == 0
				;Play glow art
				DraugrMaleEyeGlowFX.Play(selfRef, -1)
			endif
			;if sex is female (currently not returned) play debug text to say this is now working
			if myActorBase.GetSex() == 1
				DraugrFemaleEyeGlowFX.Play(selfRef, -1)
			endif
		EndIf
	EndEvent
	
	EVENT onDeath(actor myKiller)

		DraugrMaleEyeGlowFX.Stop(selfRef)
		DraugrFemaleEyeGlowFX.Stop(selfRef)

	ENDEVENT