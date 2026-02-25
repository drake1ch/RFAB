Scriptname WB_GenericCounterspell_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_IllusionAntimagic_Imod_Counterspell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_IllusionAntimagic_Imod_Counterspell.Apply()
	akTarget.InterruptCast()

EndEvent

; -----