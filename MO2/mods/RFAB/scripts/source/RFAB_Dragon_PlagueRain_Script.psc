Scriptname RFAB_Dragon_PlagueRain_Script extends ActiveMagicEffect

ObjectReference[] Property Box Auto
SPELL[] Property mySpell Auto

Actor Property Player Auto

float Property MinDistance = 0.0 Auto
int Property MaxCount = 192 Auto
float Property Cooldown = 0.1 Auto

MagicEffect Property ClearSkiesEffect Auto

Actor _owner
int _count = 0

Event OnEffectStart(Actor akTarget, Actor akCaster)
	_owner = akTarget
	RegisterForSingleUpdate(Utility.RandomFloat(20.0, 35.0))
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	if (_owner.GetDistance(Player) > MinDistance && Player.IsDetectedBy(_owner) && !Player.HasMagicEffect(ClearSkiesEffect))
		float fX = Utility.RandomFloat(-600.0, 600.0)
		float fY = Utility.RandomFloat(-600.0, 600.0)
		Box[0].MoveTo(Player, fX, fY, 3500.0)
		Box[1].MoveTo(Player, fX, fY, 0.0)
		int iType = Utility.RandomInt(0, MySpell.Length)
		MySpell[iType].Cast(Box[0], Box[1])
		_count += 1
		if (_count < MaxCount)
			RegisterForSingleUpdate(Cooldown)
		endif
	else
		RegisterForSingleUpdate(1.0)
	endif
EndEvent