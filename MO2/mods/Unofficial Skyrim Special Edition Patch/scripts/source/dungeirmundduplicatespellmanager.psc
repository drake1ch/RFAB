scriptName dunGeirmundDuplicateSpellManager extends ObjectReference
{Since the boss' and duplicates' summon/banish effects need to happen simultaneously despite being latent, this script, placed on an activator triggered by the event system, allows the calls to be forked off.}

Actor TargetRef
Activator property summonFX Auto
Activator property banishFX Auto
EffectShader property GhostFX Auto
ReferenceAlias property target Auto
bool property isSummonActivator Auto
bool property isReachwaterRockBattle Auto

auto State Waiting
	Event OnActivate(ObjectReference or)
		if (isSummonActivator)
			Summon()
		Else
			Banish()
		EndIf
	EndEvent
EndState

;USKP 2.0.4 - This script had some seriously bad usage of repeating getactorRef() calls and also lacked any sanity checks to be sure the alias in use was even filled.
Event Summon()
	TargetRef = target.GetActorReference()
	if( TargetRef != None )
		if ( !TargetRef.IsDead() )
			ObjectReference summonGate = TargetRef.PlaceAtMe(SummonFX)
	; 		;Debug.Trace("Effect is: " + summonGate)
			Utility.Wait(0.5)
			TargetRef.Enable()
			if (isReachwaterRockBattle)
				TargetRef.SetAlpha(0.33, True)
			Else
				TargetRef.SetAlpha(0.9, True)
			EndIf
			TargetRef.EvaluatePackage()
			TargetRef.StartCombat(Game.GetPlayer())
			(TargetRef as dunGeirmundsBossDuplicates).FinishDuplication()
		EndIf
	EndIf
EndEvent

Event Banish()
	TargetRef = target.GetActorReference()
	if( TargetRef != None )
		if ( !TargetRef.IsDead() )
			;If the duplicate is still alive (eg. this function is being called directly by Sigdis, instead of on death), set a variable to stop the duplicate from attacking.
			TargetRef.SetAV("Variable06", 1)
			TargetRef.EvaluatePackage()
			;Dispel the duplicates with the banish vfx.
			TargetRef.PlaceAtMe(BanishFX)
			Utility.Wait(0.5)
			TargetRef.Disable()
			TargetRef.Delete()
			TargetRef = None
		EndIf
	EndIf
EndEvent
