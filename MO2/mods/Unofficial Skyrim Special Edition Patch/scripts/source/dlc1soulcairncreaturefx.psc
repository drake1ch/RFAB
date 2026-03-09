Scriptname DLC1SoulCairnCreatureFX extends ActiveMagicEffect 
{handles the fx for the necro skeleton}
import Debug
import Utility

VisualEffect Property FXSCCreatureMultiEffect auto
VisualEffect Property FXSCCreatureEyeGlowEffect auto
EffectShader Property SCCreatureDeathFXS auto
Activator property AshPileObject auto
{The object we use as a pile.}

LeveledItem Property DLC01DeathItemMistman Auto

Bool Property isSummonable = FALSE auto
{Default = FALSE}

Actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = target
		
		;UDGP 2.0.3 - Don't let this get on the player.
		if( selfRef == Game.GetPlayer() )
			Dispel()
			Return
		EndIf
		
		;UDGP 2.0.2 - Short delay to let 3D finish loading.
		Utility.Wait(2)
		
		if (FXSCCreatureMultiEffect)
			if (selfRef.GetSleepState() == 3)
	; 			Debug.Trace("Spriggan is sleeping! 3")
				FXSCCreatureMultiEffect.Stop(selfRef)
				;selfRef.PlaySubGraphAnimation( "KillFX" )
			else
				FXSCCreatureMultiEffect.play(selfRef, -1)
			endif
		endif
		if (FXSCCreatureEyeGlowEffect)
			FXSCCreatureEyeGlowEffect.play(selfRef, -1)
		endif
	ENDEVENT

	Event OnEffectFinish(Actor akTarget, Actor akCaster)		
		if(FXSCCreatureMultiEffect)
		FXSCCreatureMultiEffect.Stop(selfRef)
		endif
		if (FXSCCreatureEyeGlowEffect)
		FXSCCreatureEyeGlowEffect.Stop(selfRef)
		endif
	ENDEVENT
	
	Event OnGetUp(ObjectReference akFurniture)
		if (FXSCCreatureMultiEffect)
			FXSCCreatureMultiEffect.play(selfRef, -1)
		endif
		if (FXSCCreatureEyeGlowEffect)
			FXSCCreatureEyeGlowEffect.play(selfRef, -1)
		endif
	endEvent

	EVENT OnDying(actor myKiller)
;/ 		selfRef.RemoveAllItems()
 		selfRef.addItem(DLC01DeathItemMistman)
 /;
		;UDGP 2.0 - Missing sanity checks
		if( FXSCCreatureMultiEffect )
			FXSCCreatureMultiEffect.stop(selfRef)
		EndIf
		if( FXSCCreatureEyeGlowEffect )
			FXSCCreatureEyeGlowEffect.stop(selfRef)
		EndIf
		SCCreatureDeathFXS.play(selfRef)
		
		if (isSummonable == FALSE)
;/ 		Notification ("IsSummonable == False")
		Notification(isSummonable)
 /;			selfRef.SetCriticalStage(selfRef.CritStage_DisintegrateStart)
			selfRef.AttachAshPile(AshPileObject)		

			utility.wait(2)	
			selfRef.SetAlpha (0.0)
			selfRef.SetCriticalStage(selfRef.CritStage_DisintegrateEnd)
		endif
	ENDEVENT