Scriptname RFAB_Dragon_Crystal_Script extends ActiveMagicEffect

Activator Property CrystalModel Auto
ObjectReference Property Box Auto
SPELL Property SpellToCast Auto
Actor Property Player Auto

float Property MinDistance = 1500.0 Auto
float Property Delay = 1.5 Auto
float Property Cooldown = 3.5 Auto

Actor _owner

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_owner = akTarget
	RegisterForSingleUpdate(Cooldown)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	if (_owner.GetDistance(Player) > MinDistance && Player.IsDetectedBy(_owner))
		Box.MoveTo(Player, afZOffset = 80.0)
		ObjectReference kMarker = Box.PlaceAtMe(CrystalModel)
		kMarker.SetScale(2.0)
		kMarker.SetAngle(0.0, 0.0, 0.0)
		Utility.Wait(Delay)
		SpellToCast.RemoteCast(kMarker, _owner)
		kMarker.Delete()
		RegisterForSingleUpdate(Cooldown)
	else
		RegisterForSingleUpdate(1.0)
	endif
EndEvent