Scriptname dunPOIChickenNecromancerScript extends ObjectReference 

dunPOIChickenNecromancerNest property theSacredNest auto
Actor Property Chicken1 Auto
Actor Property Chicken2 Auto
Actor Property Chicken3 Auto
Actor Property Chicken4 Auto

EVENT OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if akTarget == game.getPlayer() && aeCombatState != 0
		; the player has interrupted me!
		if theSacredNest.done == FALSE
			theSacredNest.activate(self)
		endif
	endif
endEVENT

;USKP 2.0.4 - Added event to remove the dead chickens once this guy is gone.
Event OnDeath(Actor akKiller)
	Chicken1.DeleteWhenAble()
	Chicken2.DeleteWhenAble()
	Chicken3.DeleteWhenAble()
	Chicken4.DeleteWhenAble()
EndEvent
