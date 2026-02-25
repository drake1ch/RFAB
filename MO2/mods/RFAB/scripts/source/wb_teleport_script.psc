Scriptname WB_Teleport_Script extends ObjectReference  

; ------

VisualEffect Property WB_AlterationAlt_VFX_MarkAndRecall Auto
Sound Property WB_IllusionBlue_Marker_Teleport Auto
ImagespaceModifier Property WB_AlterationAlt_Imod_Teleport Auto
Actor Property PlayerRef Auto

; ------

Event OnLoad()

	PlayerRef.MoveTo(Self)
	WB_AlterationAlt_VFX_MarkAndRecall.Play(PlayerRef)
	WB_IllusionBlue_Marker_Teleport.Play(PlayerRef)
	WB_AlterationAlt_Imod_Teleport.Apply()
	Utility.Wait(0.5)
	Self.Delete()

EndEvent

; ------