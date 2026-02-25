Scriptname WB_OcatosRecitalRevert_Script extends ActiveMagicEffect  

; -----

FormList Property WB_AlterationMetamagic_OcatosRecital_FormList Auto
Message Property WB_AlterationMetamagic_OcatosRecital_Message_Clear Auto
ImagespaceModifier Property WB_AlterationMetamagic_Imod_Outro Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_AlterationMetamagic_Imod_Outro.Apply()
	WB_AlterationMetamagic_OcatosRecital_FormList.Revert()
	WB_AlterationMetamagic_OcatosRecital_Message_Clear.Show()

EndEvent

; -----