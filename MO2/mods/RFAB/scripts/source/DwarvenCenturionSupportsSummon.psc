Scriptname DwarvenCenturionSupportsSummon extends ActiveMagicEffect  

Float Property IntervalTime Auto
Int Property CountOfSummons Auto
ActorBase Property SpiderBaseProperty Auto
Explosion Property SpawnEffect Auto

Actor Centurion
Form[] DwemerSpiders

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Centurion = akCaster
	DwemerSpiders = Utility.CreateFormArray(CountOfSummons, None)

	Utility.Wait(IntervalTime)
	While !Centurion.IsDead()
		SummonDwemerSpider()
		Utility.Wait(IntervalTime)
	EndWhile
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	KillAndDeleteDwemerSpiders()
EndEvent

Function SummonDwemerSpider()
	int Iteration = CountOfSummons 
	while Iteration
		Iteration -= 1
		Actor DwemerSpider = DwemerSpiders[Iteration] as Actor
		if DwemerSpider == None || DwemerSpider.IsDead()
			DwemerSpider = Centurion.PlaceActorAtMe(SpiderBaseProperty)
			DwemerSpider.PlaceAtMe(SpawnEffect)
			DwemerSpiders[Iteration] = DwemerSpider as Form
			return 
		EndIf
	EndWhile
EndFunction

Function KillAndDeleteDwemerSpiders()
	int Iteration = CountOfSummons 
	while Iteration
		Iteration -= 1
		Actor DwemerSpider = DwemerSpiders[Iteration] as Actor
		DwemerSpider.DamageAV("Health", DwemerSpider.GetActorValueMax("Health"))
		DwemerSpider.Delete()
		DwemerSpider = None
	EndWhile
EndFunction

Event OnCellDetach()
	self.Dispel()
endEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState == 0 ; Not in combat
		self.Dispel()
	endif
endEvent