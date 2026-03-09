Scriptname WispActorScript extends ActiveMagicEffect  
{Abilities and FX for Wisp/Glimmerwitch}
;======================================================================================;
;	IMPORTS     /
;=============/
import utility
import form
import debug
;======================================================================================;
;	PROPERTIES  /
;=============/
keyword property wispChild01 auto
keyword property wispChild02 auto
keyword property wispChild03 auto

spell property wispBuff01 auto
spell property wispBuff02 auto
spell property wispBuff03 auto

spell property Phase1ConcSpell auto
{A long range concentration spell for phase #1}
spell property Phase2ConcSpell auto
{Shorter range spell for phase #2}

actorBase property encWispShade auto

VisualEffect Property WispFXAttachEffect Auto
explosion property ExplosionIllusionLight01 auto
Activator property AshPileObject auto
{The object we use as a pile.}

float property PhaseThreeHPPercent auto
{At what % of HP should I spawn my dopplegangers?. DEFAULT: 0.2}


;======================================================================================;
;	VARIABLES   /
;=============/
;USKP 2.0.4 - All of these are Actors, so let's just dispense with all the type casting that's going on down below.
Actor selfRef

; let's refer to the witchlights as "orbs" to avoid confusion.
Actor orb01
Actor orb02
Actor orb03

Actor Shade01 
Actor Shade02

;track number of living orb babies
int liveLights = 3

; have my FX been attached?
bool bFX = FALSE
;======================================================================================;
;	EVENTS	    /
;=============/
	EVENT onLoad()
		;trace("Wisp: Has Loaded 3D ("+selfRef+")")
		EVPall()
	endEVENT

	EVENT OnEffectStart(Actor Target, Actor Caster)
		;trace("AbWisp Effect Start on: "+SelfRef+"")
		selfRef = caster
		
		;USKP 2.0.1 - Stop this from attaching to the player.
		if( selfRef == Game.GetPlayer() )
			Return
		EndIf
		
		if selfref.getLinkedRef() == NONE
			; only attack FX at this point if I am not in an ambush link
			if (WispFXAttachEffect != NONE)
				WispFXAttachEffect.Play(selfRef, -1)
				bFX = TRUE
			Endif
		endif

		;USKP 2.0.4 - These should be cast as Actors
		orb01 = selfRef.getLinkedRef(WispChild01) as Actor
		orb02 = selfRef.getLinkedRef(WispChild02) as Actor
		orb03 = selfRef.getLinkedRef(WispChild03) as Actor
		EVPall()

		if phaseThreeHPpercent > 1.0
			; if we passed a high value, the user probably meant a whole number percentage like 30%
			phaseThreeHPpercent = phaseThreeHPpercent/100
		endif	
	ENDEVENT
	
	EVENT onGetup(ObjectReference akFurniture)
		;USKP 2.0.1 - Stop this from attaching to the player.
		if( selfRef == Game.GetPlayer() )
			Return
		EndIf
		
		if akFurniture == selfRef.getLinkedRef() && bFX == FALSE
			; if I was in a furniture ambush, then add my FX when I leave it
			WispFXAttachEffect.Play(selfRef, -1)
			bFX = TRUE
		endif
	endEVENT
	
	Event OnCombatStateChanged(Actor victim, int aeCombatState)
		if aeCombatState != 0 ; 0 means not in combat, so non-zero means we entered combat
; 			debug.trace("Wisp began combat with "+victim+"  ("+self+")")
			if aeCombatState == 1	
				;USKP 2.0.6 - Dead actors throw errors when asked to start combat.
				If (orb01 != NONE)
					if( !orb01.IsDead() )
						orb01.startCombat(victim)
					EndIf
				Endif
				If (Orb02 != NONE)
					if( !orb02.IsDead() )
						orb02.startCombat(victim)
					EndIf
				Endif
				If (Orb03 != NONE)
					if( !orb03.IsDead() )
						orb03.startCombat(victim)
					EndIf
				Endif
				; Start listening for critically low HP
				registerforSingleupdate(1.0)
			endif
		endif
	endEVENT
	
	EVENT onActivate(objectReference actronaut)
; 		debug.trace("Wisp Activated")
		if actronaut == orb01 || actronaut == orb02 || actronaut == orb03
			utility.wait(0.1)
; 			debug.trace("Actronaut was one of my orbs")
			liveLights -= 1
; 			debug.trace("Livelights = "+livelights)
			if liveLights <= 0
; 				debug.trace("All child lights dead for "+selfref)
				;Variable07 sets up the berserk package/combat style
				selfRef.setActorValue("Variable07",1)
				;also "eliminate" her ability to cast spells - take all her magicka away.
				;trace("WISPS: move to combat phase 2")
				; Take away her magicka (she'll regen) and shuffle her spell set
				selfRef.damageActorValue("Magicka", -(selfRef.getActorValue("Magicka"))) 
				selfRef.removeSpell(Phase1ConcSpell)
				selfRef.addSpell(Phase2ConcSpell)
			endif
		endif
	endEVENT

	EVENT onUpdate()
		; Check HP for Phase 3 Combat - Last ditch doppleganger attack!
		if selfRef.getActorValuePercentage("health") >  phaseThreeHPpercent
			; HP still high, so hold off.
			;utility.wait(0.5)
			RegisterforSingleUpdate(0.5)
		else
			; create my dopplegangers and unregister for update
			Shade01 = selfRef.placeAtMe(EncWispShade) as Actor
			Shade02 = selfRef.placeAtMe(EncWispShade) as Actor

			;Set AV06 to 1 as a flag for being in this state (used in Frostmere Crypt)
			selfRef.SetAV("Variable06", 1)

			; Dump the orbs.
			If (orb01 != NONE)
				orb01.kill()
			Endif
			If (Orb02 != NONE)
				orb02.kill()
			Endif
			If (Orb03 != NONE)
				orb03.kill()
			Endif
			; restore her longer-range spell
			selfRef.addSpell(Phase1ConcSpell)
		endif
	endEVENT
	
	EVENT OnDying(Actor akKiller)
		; Effects automatically finish onDeath so use this EVENT hook instead 
		;trace("Actor has died: "+selfref)
		selfRef.SetCriticalStage((selfRef as actor).CritStage_DisintegrateStart)
		WispFXAttachEffect.Stop(selfRef)
		utility.wait(0.90)
		selfRef.placeatme(ExplosionIllusionLight01)
		selfRef.AttachAshPile(AshPileObject)
		; pause a second before killing inheritors - I've seen massive damage skip over this
		utility.wait(0.5)
		If (orb01 != NONE)
			orb01.kill()
		Endif
		If (Orb02 != NONE)
			orb02.kill()
		Endif
		If (Orb03 != NONE)
			orb03.kill()
		Endif
		If (Shade01 != NONE)
			Shade01.kill()
		Endif
		If (Shade02 != NONE)
			Shade02.kill()
		Endif
		selfRef.SetCriticalStage(selfRef.CritStage_DisintegrateEnd)
	ENDEVENT


	FUNCTION EVPall()
		;trace("Sending EVP to self and witchlight children ("+selfRef+")")
		;trace("Witchlights are the Following:")
		;trace("--------------------------------")
		;trace(orb01)
		;trace(orb02)
		;trace(orb03)
		;trace("--------------------------------")
		If (orb01 != NONE)
			orb01.evaluatePackage()
		Endif
		If (Orb02 != NONE)
			orb02.evaluatePackage()
		Endif
		If (Orb03 != NONE)
			orb03.evaluatePackage()
		Endif
	endFUNCTION
	