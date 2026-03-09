Scriptname AbTGTrapsightScript extends ActiveMagicEffect  Conditional

GlobalVariable Property pTSight Auto Conditional

Event OnEffectStart(Actor Target, Actor Caster)
	pTSight.SetValue(pTSight.value + 1) ; USKP 2.0.1 - The += operator does not work correctly on globals.
EndEvent
