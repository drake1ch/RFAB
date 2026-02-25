Scriptname tbmChrysamereTauntScript extends ReferenceAlias

Sound Property tauntSound Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if (akActionRef == Game.GetPlayer())
		Game.ShakeCamera()
		tauntSound.Play(GetRef())
		GetRef().Disable()
	EndIf
EndEvent
