Scriptname RFAB_SkeletonKey extends ObjectReference  

int Property LockpickingBonus = 25 Auto

bool _applied = false

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	Actor kPlayer = Game.GetPlayer()

	if (!_applied && (akNewContainer as Actor) == kPlayer)
		kPlayer.ModActorValue("Lockpicking", LockpickingBonus)
		_applied = true
	elseif (_applied && (akOldContainer as Actor) == kPlayer)
		kPlayer.ModActorValue("Lockpicking", -LockpickingBonus)
		_applied = false
	endif
EndEvent