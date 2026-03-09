Scriptname MGRitual05DragonScript extends actor

miscobject Property Scales  Auto  

weapon Property MGRitual05Dagger  Auto  

int DoOnce


Event OnActivate (ObjectReference ActionRef)

	if DoOnce == 0
		if Self.IsDead()
			;USSEP 4.2.2 Bug #28425
			if( Game.GetPlayer().GetEquippedWeapon() == MGRitual05Dagger || Game.GetPlayer().GetEquippedWeapon(true) == MGRitual05Dagger )
				Game.GetPlayer().AddItem(Scales,1)
				DoOnce=1
			endif
		endif
	endif


EndEvent

;USSEP 4.2.3 Bug #28845 - Respawned dragons should reset this so that a Heartscale can be taken.
Event OnReset()
	DoOnce = 0
EndEvent
