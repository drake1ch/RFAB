Scriptname RFAB_Effect_SetAV extends ActiveMagicEffect  

string Property ActorValue Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.SetActorValue(ActorValue, GetMagnitude())
EndEvent