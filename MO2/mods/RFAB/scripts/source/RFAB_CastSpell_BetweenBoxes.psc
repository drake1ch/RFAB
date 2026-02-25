Scriptname RFAB_CastSpell_BetweenBoxes extends ActiveMagicEffect

ObjectReference[] Property Box Auto
SPELL[] Property mySpell Auto

Actor Property Player Auto

float Property MinDistance = 1500.0 Auto
float Property Delay = 1.0 Auto
float Property Cooldown = 5.0 Auto

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
		Box[0].MoveTo(Player, afZOffset = 1500.0)
		Box[1].MoveTo(Player)
		MySpell[0].Cast(Box[0], Box[1])
		Utility.Wait(Delay)
		MySpell[1].Cast(Box[1])
		RegisterForSingleUpdate(Cooldown)
	else
		RegisterForSingleUpdate(1.0)
	endif
EndEvent