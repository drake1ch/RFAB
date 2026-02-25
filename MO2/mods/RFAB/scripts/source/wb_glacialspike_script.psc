Scriptname WB_GlacialSpike_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_DestructionFrost_Imod_GlacialSpike Auto
Sound Property MAGIcicleImpactBreak Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	WB_DestructionFrost_Imod_GlacialSpike.Apply()
	MAGIcicleImpactBreak.Play(akTarget)
EndEvent

; -----