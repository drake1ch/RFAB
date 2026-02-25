Scriptname WB_Milestone_Script extends ObjectReference  

; -----

EffectShader Property WB_AlterationAlt_FXS_CreatedObject Auto

; -----

Event OnLoad()

	WB_AlterationAlt_FXS_CreatedObject.Play(Self, 2.5)

EndEvent

; -----