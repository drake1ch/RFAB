Scriptname WB_Entomb_Script extends ActiveMagicEffect  

; -----

WB_Entomb_Quest_Script Property WB_Entomb_Quest Auto
GlobalVariable Property WB_Alteration_EntombStatus_Global Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If WB_Alteration_EntombStatus_Global.GetValue() == 0
		WB_Entomb_Quest.StartEntombing(akTarget, akCaster)
	EndIf

EndEvent

; -----