scriptName RFAB_MovingPillarScript extends ObjectReference

float property XOffset auto
float property YOffset auto
float property ZOffset auto
float property Speed auto

Sound property translate_finish_sound auto

Event OnActivate(ObjectReference akActionRef)
	Speed = Utility.RandomFloat(Speed * 0.75, Speed * 1.2)
	MoveTo(self, -XOffset, -YOffset, -ZOffset, true)

	EnableNoWait(true)
	RegisterForSingleUpdate(0.1 + Utility.RandomFloat(0.0, 1.0))
EndEvent

Event OnCellDetach()
	UnRegisterForUpdate()
EndEvent

Event OnTranslationComplete()
	GoToState("Floating")
	RegisterForSingleUpdate(0.1)
	translate_finish_sound.Play(self)
EndEvent

Event OnUpdate()
	TranslateTo(X + XOffset, Y + YOffset, Z + ZOffset, GetAngleX(), GetAngleY(), GetAngleZ(), Speed, 0.0)
	;translate_finish_sound.Play(self)

	if (Utility.RandomInt(0, 1) == 0)
		ZOffset = 30.0
	else
		ZOffset = -30.0
	endif

	Speed = 3.0
EndEvent

State Floating
	Event OnUpdate()
		if (!Is3DLoaded())
			return
		endif
		ZOffset = -ZOffset
		TranslateTo(X, Y, Z + ZOffset, GetAngleX(), GetAngleY(), GetAngleZ(), Speed, 0.0)
	EndEvent

	Event OnTranslationComplete()
		RegisterForSingleUpdate(0.1)
	EndEvent
EndState