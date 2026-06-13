Scriptname RFAB_Effect_SetAV extends ActiveMagicEffect  

string Property ActorValue Auto

bool Property AddToBase = false Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	float fMagnitude = GetMagnitude()

	if (AddToBase)
		fMagnitude += akTarget.GetBaseActorValue(ActorValue)
	endif

	akTarget.SetActorValue(ActorValue, fMagnitude)
EndEvent