Scriptname WB_ObjectInInvDispelGlow_Script extends ReferenceAlias  

; -----

ReferenceAlias Property WB_Glow Auto

; -----

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	If akNewContainer
		WB_Glow.GetReference().Disable()
		WB_Glow.GetReference().Delete()
	EndIf

EndEvent

; -----