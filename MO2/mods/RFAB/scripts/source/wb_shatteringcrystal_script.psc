Scriptname WB_ShatteringCrystal_Script extends ActiveMagicEffect  

; -----

Activator Property WB_DestructionFrost_Activator_ShatteringCrystal Auto
Spell Property WB_S_D100_ShatteringCrystal_Spell_Explosion Auto

Float Property Scale = 2.0 Auto
Float Property Height = 10.0 Auto

; -----

ObjectReference TheMarker

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheMarker = akTarget.PlaceAtMe(WB_DestructionFrost_Activator_ShatteringCrystal)
	TheMarker.SetScale(Scale)
	TheMarker.SetAngle(0,0,0)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	WB_S_D100_ShatteringCrystal_Spell_Explosion.RemoteCast(TheMarker, akCaster)
	TheMarker.Disable(true)
	Utility.Wait(5.0)
	TheMarker.Delete()

EndEvent

; -----