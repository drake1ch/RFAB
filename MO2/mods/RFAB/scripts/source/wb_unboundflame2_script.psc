Scriptname WB_UnboundFlame2_Script extends activemagiceffect  

; -----

Spell Property WB_S_D000_Blaze_Spell_Proc_PC Auto
Float Property WB_Delay Auto
ImagespaceModifier Property WB_Imod Auto
Sound Property WB_Sound Auto

; -----

Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForUpdate(WB_Delay)
	TheTarget = akTarget
	TheCaster = akCaster

EndEvent

; -----

Event OnUpdate()

;	Actor NewJumpTarget = Game.FindRandomActorFromRef(TheTarget, WB_SeekRange)
	If Utility.RandomInt(0,1) == 0
		WB_S_D000_Blaze_Spell_Proc_PC.Cast(TheCaster, TheCaster)
		WB_Sound.Play(TheCaster)
	Else
		WB_S_D000_Blaze_Spell_Proc_PC.Cast(TheCaster, TheTarget)
		WB_Sound.Play(TheTarget)
	EndIf

EndEvent

; -----