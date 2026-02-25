Scriptname WB_SoundAndImod_Script extends ActiveMagicEffect  

; -----

Sound Property WB_Sound Auto
ImagespaceModifier Property WB_Imod Auto
Float Property WB_Strength Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_Sound.Play(akTarget)
	WB_Imod.Apply(WB_Strength)

EndEvent

; -----