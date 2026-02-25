Scriptname WB_PathOfPillars_Script extends ObjectReference  

; -----

Actor Property PlayerRef Auto
Sound Property WB_Sound Auto
Float Property WB_Duration Auto
EffectShader Property WB_AlterationAlt_FXS_CreatedObject Auto

; -----

Event OnActivate(ObjectReference akActivator)

	If akActivator == PlayerRef
		BlockActivation()
		WB_Sound.Play(Self)
		Disable()
		Delete()
	EndIf

EndEvent

; ------

Event OnLoad()

	RegisterForSingleUpdate(WB_Duration)
	WB_AlterationAlt_FXS_CreatedObject.Play(Self)

EndEvent

; ------

Event OnUpdate()

	Disable(true)
	Delete()

EndEvent

; -----