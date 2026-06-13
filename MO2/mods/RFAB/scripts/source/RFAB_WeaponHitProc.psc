Scriptname RFAB_WeaponHitProc extends ActiveMagicEffect  

import PO3_Events_AME

Spell Property SpellToCast Auto

GlobalVariable Property ChanceGV Auto

float Property Cooldown Auto

Actor _owner
ObjectReference _marker
Form _exception

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_owner = akTarget
	_marker = akTarget.PlaceAtme(Game.GetForm(0x3B), abForcePersist = true)
	_exception = Game.GetForm(0x1F4)
	RegisterForWeaponHit(self)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	_marker.Delete()
	UnregisterForWeaponHit(self)
EndEvent

Event OnUpdate()
	RegisterForWeaponHit(self)
EndEvent

Event OnWeaponHit(ObjectReference akTarget, Form akSource, Projectile akProjectile, Int aiHitFlagMask)
	if (akSource == _exception)
		return
	endif

	Actor kVictim = akTarget as Actor

	if (!kVictim || kVictim.IsDead())
		return
	endif

	if (Utility.RandomInt(1, 100) <= ChanceGV.Value as int)
		_marker.MoveTo(kVictim)
		SpellToCast.RemoteCast(_marker, _owner, kVictim)
		if (Cooldown != 0.0)
			UnregisterForWeaponHit(self)
			RegisterForSingleUpdate(Cooldown)
		endif
	endif
EndEvent