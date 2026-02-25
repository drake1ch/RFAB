Scriptname tbmRealChrysamereActivatorScript extends ObjectReference  
{Wword that drops the real Chrysamere into the players inventory and activates the dragon.}

Weapon Property ChrysamereItem Auto
ObjectReference Property DragonReference Auto
Sound Property DragonRoar Auto

Auto State stateWaiting
	Event OnActivate (objectReference triggerRef)
		Game.GetPlayer().AddItem(ChrysamereItem, 1)
		Game.ShakeCamera(None, 1, 2)
		DragonReference.Enable()
		DragonRoar.Play(Game.GetPlayer())
		self.Disable()
	EndEvent
endState
