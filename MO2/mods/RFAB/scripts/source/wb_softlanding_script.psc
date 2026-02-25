Scriptname WB_SoftLanding_Script extends ObjectReference  

; ------

Hazard Property WB_AlterationTelekinesis_Hazard_SoftLanding Auto
Actor Property PlayerRef Auto
GlobalVariable Property WB_General_Global_XP Auto
GlobalVariable Property WB_Alteration_DropZone_Global_XP Auto

; ------

Event OnLoad()

	Self.PlaceAtMe(WB_AlterationTelekinesis_Hazard_SoftLanding)
	Game.AdvanceSkill("Alteration",WB_Alteration_DropZone_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
	Self.Delete()

EndEvent

; ------