Scriptname StockadeBarricade01ActivatorScript extends ObjectReference  
{Disables my linked ref when I'm destroyed (Through destruction stages).}

import debug

Int Property OldStage = 3 Auto
{The destruction stage that is before the stage you want to trigger at
- Default = 3}

Int Property NewStage = 4 Auto
{The destruction stage that you want the trigger to happen at
- Default = 4}

Sound Property OBJCWBarricadeDamage Auto
Sound Property OBJCWBarricadeDestroyed Auto

;USKP 2.0.4 - Daryl tried to get a bit too fancy with the linked ref. Just check the function, it's not that big a thing. Unloading probably loses the variable or something.
;Lack of sanity checking is deliberate btw, these should always be paired to valid navmesh collision blockers.
Event OnLoad()
	;Trace("DARYL - " + self + " Running OnLoad().")
	if GetCurrentDestructionStage() < NewStage
		GetLinkedRef().Enable()
	EndIf
EndEvent

Event OnUnload()
	;Trace("DARYL - " + self + " Running OnUnload().")
	GetLinkedRef().Disable()
EndEvent

Event OnDestructionStageChanged(int aiOldStage, int aiCurrentStage)
	
	int DamageID = OBJCWBarricadeDamage.Play(self)

	if (aiOldStage == OldStage) && (aiCurrentStage == NewStage)
		;Trace("DARYL - " + self + " destroyed, disabling navmesh cut.")
		int DestroyedID = OBJCWBarricadeDestroyed.Play(self)
		GetLinkedRef().Disable()
	endif
EndEvent

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;int DamageID = OBJCWBarricadeDamage.Play(self)
;EndEvent
