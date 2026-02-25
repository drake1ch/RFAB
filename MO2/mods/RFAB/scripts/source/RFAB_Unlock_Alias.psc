Scriptname RFAB_Unlock_Alias extends ReferenceAlias  

Actor Property Player Auto

RFAB_Unlock Property Unlock Auto

Projectile Property DefaultProjectile Auto
Projectile Property DualCastProjectile Auto

Spell Property KnockSpell Auto
Scroll Property KnockScroll Auto

bool _isRegistered = false

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
	if (IsHasKnockEquipped())
		if (!_isRegistered)
			_isRegistered = true
			PO3_Events_Alias.RegisterForProjectileHit(self)
		endif
	elseif (_isRegistered)
		_isRegistered = false
		PO3_Events_Alias.UnregisterForProjectileHit(self)
	endif
EndFunction

Event OnProjectileHit(ObjectReference akTarget, Form akSource, Projectile akProjectile)
	if (akProjectile == DefaultProjectile)
		Process(akTarget)
	elseif (akProjectile == DualCastProjectile)
		Process(akTarget, abDualCast = true)
	elseif (akSource == KnockScroll)
		Process(akTarget, abMasterScroll = true)
	endif
EndEvent

Function Process(ObjectReference akObject, bool abDualCast = false, bool abMasterScroll = false)
	if (akObject.IsLocked())
		Unlock.TryMagicUnlock(Player, akObject, abDualCast, abMasterScroll)
	endif
EndFunction

bool Function IsHasKnockEquipped()
	Form[] kHands = new Form[2]
	kHands[0] = Player.GetEquippedObject(0)
	kHands[1] = Player.GetEquippedObject(1)

	return kHands.Find(KnockSpell) != -1 || kHands.Find(KnockScroll) != -1
EndFunction