Scriptname USSEP_TG09ShadowCloakScript extends ActiveMagicEffect

SPELL Property TGNightingaleShadow Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akCaster.DispelSpell(TGNightingaleShadow)
EndEvent
