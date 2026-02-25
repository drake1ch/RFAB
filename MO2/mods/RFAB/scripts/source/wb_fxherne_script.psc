Scriptname WB_FXHerne_Script extends ActiveMagicEffect  

; -----

Spell Property WB_S_C075_ConjureHerne_Spell_Proc Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	WB_S_C075_ConjureHerne_Spell_Proc.Cast(akCaster)
EndEvent

; -----