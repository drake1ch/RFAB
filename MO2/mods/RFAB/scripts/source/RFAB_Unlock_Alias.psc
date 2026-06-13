Scriptname RFAB_Unlock_Alias extends ReferenceAlias  

Actor Property Player Auto

RFAB_Unlock Property Unlock Auto

Spell Property KnockSpell Auto
Scroll Property KnockScroll Auto

Event OnObjectEquipped(Form akObject, ObjectReference akReference)
	if (akObject == KnockSpell || akObject == KnockScroll)
		RegisterForSingleUpdate(0.01)
	endif
EndEvent

Event OnObjectUnequipped(Form akObject, ObjectReference akReference)
	if (akObject == KnockSpell || akObject == KnockScroll)
		RegisterForSingleUpdate(3.0)
	endif
EndEvent

Event OnUpdate()
	Evaluate()
EndEvent

Function Evaluate()
	if (IsKnockEquipped())
		PO3_Events_Alias.RegisterForProjectileHit(self)
	else
		PO3_Events_Alias.UnregisterForProjectileHit(self)
	endif
EndFunction

Event OnProjectileHit(ObjectReference akTarget, Form akSource, Projectile akProjectile)
	if (akSource == KnockSpell)
		Process(akTarget)
	elseif (akSource == KnockScroll)
		Process(akTarget, abMasterScroll = true)
	endif
EndEvent

Function Process(ObjectReference akObject, bool abMasterScroll = false)
	if (akObject.IsLocked())
		Unlock.TryMagicUnlock(Player, akObject, abMasterScroll)
	endif
EndFunction

bool Function IsKnockEquipped()
	Form kLeft = Player.GetEquippedObject(0)
	Form kRight = Player.GetEquippedObject(1)

	return kLeft == KnockSpell || kLeft == KnockScroll \
		|| kRight == KnockSpell || kRight == KnockScroll
EndFunction