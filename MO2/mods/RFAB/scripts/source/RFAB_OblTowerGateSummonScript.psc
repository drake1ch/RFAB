Scriptname RFAB_OblTowerGateSummonScript extends ObjectReference

LeveledActor Property DaedraSummon Auto

Explosion Property SummonExplosion Auto

int Property Cooldown = 60 Auto

int Property MaxCount Auto

int Count

Event OnLoad()
	OnUpdate()
EndEvent

Event OnUpdate()
	ObjectReference Daedra = PlaceActorAtMe(DaedraSummon.GetNthForm(Utility.RandomInt(0, DaedraSummon.GetNumForms())) as ActorBase)
	Daedra.PlaceAtMe(SummonExplosion)
	if (Count < MaxCount)
		RegisterForSingleUpdate(Cooldown)
	else
		PlayAnimation("ForceClosed")
	endif
EndEvent

Event OnWarlordDie()
	UnregisterForUpdate()
	PlayAnimation("ForceClosed")
EndEvent

Event OnUnload()
    Delete()
EndEvent