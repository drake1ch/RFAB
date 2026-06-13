scriptName RFAB_FloatingPillarScript extends ObjectReference

Event OnLoad()
	RegisterForSingleUpdate(0.1)
EndEvent

Event OnUpdate()
	float fRandomZ = Utility.RandomFloat(-200.0, 200.0)
	float fRandomAngleZ = Utility.RandomFloat(-180.0, 180.0)
	if (Is3DLoaded())
		TranslateTo(X, Y, Z + fRandomZ, GetAngleX(), GetAngleY(), fRandomAngleZ, 15, 15)
		RegisterForSingleUpdate(Utility.RandomFloat(5.0, 10.0))
	endif
EndEvent

Event OnCellDetach()
	UnRegisterForUpdate()
EndEvent