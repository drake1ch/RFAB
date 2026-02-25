Scriptname RFAB_StaggerScript extends ActiveMagicEffect  

spell property StaggerSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
		StaggerSpell.cast(akTarget)
endEvent