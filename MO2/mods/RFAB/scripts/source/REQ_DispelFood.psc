scriptname REQ_DispelFood extends ActiveMagicEffect
{Dispels this active effect if the actor is drunk.}

Faction property REQ_Storage_Alcohol auto
MagicEffect property SanguinnBuff auto


Event OnMagicEffectStart(ObjectReference akCaster, MagicEffect akEffect)
	registerforsingleUpdate(2.0)
EndEvent

Event onupdate()
	if (self.GetTargetActor().GetFactionRank(REQ_Storage_Alcohol) > 0) && (self.GetTargetActor().HasmagicEffect(SanguinnBuff))
		Dispel()
	endif
	registerforsingleUpdate(1.0)
EndEvent