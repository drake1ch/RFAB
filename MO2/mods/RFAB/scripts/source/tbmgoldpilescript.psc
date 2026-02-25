Scriptname tbmGoldpileScript extends ObjectReference  
{Gives the player a semi random amount of gold when activated.}

Int Property MinimumGold = 1000 Auto
Int Property MaximumGold = 2000 Auto
MiscObject Property gold001  Auto  

Auto State stateWaiting
	Event OnActivate (objectReference triggerRef)
		self.BlockActivation(true)

		int random = Utility.RandomInt(MinimumGold, MaximumGold)

		Game.GetPlayer().AddItem(gold001, random, false)

		GotoState("stateDone")
	EndEvent
endState

State stateDone
	Event OnActivate (objectReference triggerRef)
		;debug.trace("already looted")
	EndEvent
endState