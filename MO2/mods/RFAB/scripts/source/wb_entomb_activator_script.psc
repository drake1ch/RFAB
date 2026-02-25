Scriptname WB_Entomb_Activator_Script extends ObjectReference  

; ------

WB_Entomb_Quest_Script Property WB_Entomb_Quest Auto
GlobalVariable Property WB_Alteration_EntombStatus_Global Auto

; -----

Event OnLoad()

	If WB_Alteration_EntombStatus_Global.GetValue() == 1
		WB_Entomb_Quest.ReleaseCurrentVictim(Self)
		Utility.Wait(5.0)
	EndIf
	Delete()

EndEvent

; -----