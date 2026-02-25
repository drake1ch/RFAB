Scriptname WB_Toggle_Script extends activemagiceffect  

; -----

Spell Property WB_AbilityToToggle Auto

Message Property WB_AbilityTurnedOff_Message Auto
Message Property WB_AbilityTurnedOn_Message Auto

ImagespaceModifier Property WB_AbilityTurnedOff_Imod Auto
ImagespaceModifier Property WB_AbilityTurnedOn_Imod Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.HasSpell(WB_AbilityToToggle)
		akTarget.RemoveSpell(WB_AbilityToToggle)
		If WB_AbilityTurnedOff_Message
			WB_AbilityTurnedOff_Message.Show()
		EndIf
		If WB_AbilityTurnedOff_Imod
			WB_AbilityTurnedOff_Imod.Apply()
		EndIf
	Else
		akTarget.AddSpell(WB_AbilityToToggle, false)
		If WB_AbilityTurnedOn_Message
			WB_AbilityTurnedOn_Message.Show()
		EndIf
		If WB_AbilityTurnedOn_Imod
			WB_AbilityTurnedOn_Imod.Apply()
		EndIf
	EndIf

EndEvent

; -----