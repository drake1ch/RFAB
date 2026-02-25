Scriptname WB_OcatosRecitalFail_Script extends ActiveMagicEffect  

; -----

Message Property WB_AlterationMetamagic_OcatosRecital_Message_Fail Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_AlterationMetamagic_OcatosRecital_Message_Fail.Show()

EndEvent

; -----