Scriptname WB_DispelMagic_Script extends ActiveMagicEffect  

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.DispelAllSpells()

EndEvent

; -----