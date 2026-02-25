Scriptname WB_Imod_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_Imod Auto
Float Property WB_ImodStrength Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If WB_ImodStrength
		WB_Imod.Apply(WB_ImodStrength)
	Else
		WB_Imod.Apply()
	EndIf

EndEvent

; -----