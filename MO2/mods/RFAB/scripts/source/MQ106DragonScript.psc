Scriptname MQ106DragonScript extends ReferenceAlias  

import PO3_Events_Alias 

Keyword Property MagicShout  Auto  
{keyword for shout effects}

DragonActorScript DragonScript
Quest MyQuest 

Event OnLoad()
;/ 	if !MyQuest.GetStageDone(110)
		RegisterForHitEventEx(self, Game.GetPlayer())
    endif /;
    if (MyQuest as MQ106Script).dragonHitByShout != 1
    	RegisterForMagicEffectApplyEx(self, MagicShout, true)
	endif
    MyQuest = GetOwningQuest()
EndEvent

Event OnCombatStateChanged(Actor akTarget,int aeCombatState)
	if aeCombatState != 0 ; 0 means not in combat, so non-0 means we entered combat
		; end scene when start combat, make aggressive
		MyQuest.SetStage(110)
	endIf
endEvent

;/ Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	; end scene when hit, make aggressive
	; only after 105 is done - make sure he's finished exiting the mound	
	if !MyQuest.GetStageDone(110)
		UnregisterForAllHitEventsEx(self)
		MyQuest.SetStage(110)
	endif
EndEvent /;

Event OnMagicEffectApplyEx(ObjectReference akCaster, MagicEffect akEffect, Form akSource, bool abApplied)
	if (akCaster != Game.GetPlayer())
		return
	endif
	(MyQuest as MQ106Script).dragonHitByShout = 1
	UnregisterForAllMagicEffectApplyEx(self)
EndEvent

Event OnDeath(Actor akKiller)
	MyQuest.SetStage(150)
	DragonScript = GetRef() as DragonActorScript
	RegisterForSingleUpdate(1)
endEvent

Event OnUpdate()
	if MyQuest.GetStageDone(150)
		if !MyQuest.GetStageDone(155)
			if GetRef().GetDistance(Game.GetPlayer()) < DragonScript.deathFXrange
				UnregisterForUpdate()
				MyQuest.SetStage(155)
			endif
		endif
	endif
	if !MyQuest.GetStageDone(155)
		RegisterForSingleUpdate(1)
	endif
endEvent
