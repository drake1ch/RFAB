Scriptname DwarvenSpiderHealingAbilityScript extends ActiveMagicEffect

import PO3_SKSEFunctions

Spell Property MendingSpell Auto
Float Property IntervalTime Auto
Float Property ViewDistance Auto
Keyword Property ActorTypeDwarven Auto
ActorBase Property SpiderBaseProperty Auto

Actor DwemerSpider
Actor CombatTarget
Actor MostBrokenDwemerActor
ObjectReference[] CombatAllies

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DwemerSpider = akCaster
	StartHealing()
EndEvent

Function StartHealing()

	Actor Player = Game.GetPlayer()
	Cell SpiderCurrentCell = DwemerSpider.GetParentCell()

	Utility.wait(IntervalTime)
	while !DwemerSpider.IsDead() && Player.GetParentCell() == SpiderCurrentCell
		MostBrokenDwemerActor = FindMostBrokenDwemerAlly()
		CombatTarget = None
		if MostBrokenDwemerActor != None
			CombatTarget = DwemerSpider.GetCombatTarget()
			DwemerSpider.StopCombat()
			DwemerSpider.DoCombatSpellApply(MendingSpell, MostBrokenDwemerActor)
			DwemerSpider.StartCombat(CombatTarget)
		endIf
		Utility.wait(IntervalTime)
	EndWhile
EndFunction

Actor Function FindMostBrokenDwemerAlly()
	CombatAllies = FindAllReferencesWithKeyword(DwemerSpider, ActorTypeDwarven, ViewDistance, true)
	Actor MostBrokenActor = None
	float LowestHP = 1.0
	int AlliesCount = CombatAllies.Length

	while AlliesCount
		AlliesCount -= 1
		Actor CurrentActor = CombatAllies[AlliesCount] as Actor
		float CurrentActorHP = CurrentActor.GetActorValuePercentage("health")
		if CurrentActor != DwemerSpider && !CurrentActor.IsHostileToActor(DwemerSpider)
			if (CurrentActorHP < LowestHP) && (CurrentActorHP > 0 && CurrentActorHP < 1)
				LowestHP = CurrentActorHP
				MostBrokenActor = CurrentActor
			EndIf
		Endif
	EndWhile

	return MostBrokenActor
EndFunction

Event OnCellDetach()
	self.Dispel()
EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState == 0 ; Not in combat
		self.Dispel()
	endif
EndEvent